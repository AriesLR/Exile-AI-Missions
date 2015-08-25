/*
  Spawn Orange Mission
  Original Code by blckeagls
  Modified by Ghostrider
  Last updated 8/2/15
*/
private ["_coords","_crates","_aiGroup","_numAIGrp","_objects","_startMsg","_endMsg","_mapLabel","_missionObjs","_compositions","_missionCfg","_compSel","_mines","_result","_markerName","_markerCoords"];
diag_log "[blckeagls] Starting ORANGE mission SM1";

_coords = _this select 0;
// holds a list of objects spawned for this mission for cleanup later on.
_objects = [];
_mines = [];
_aiGroup = [];

// Use include here so as not to distract from the flow of the code. The included file defines arrays specifying the parameters for each mission.
#include "\q\addons\custom_server\AIMission\Major\compositions\compositionsOrange.sqf"; 

// a listing of mission compositions for this mission set.
_compositions = 
[
	"resupplyCamp",
	"default2",
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
diag_log format["[blckeagls] Orange Mission composition = %1 ",_compSel];

//Load the  _missionCfg
switch (_compositions call BIS_fnc_selectRandom) do 
{
	case "default": {_missionCfg = _default};
	case "default2": {_missionCfg = _default2};
	case "medicalCamp": {_missionCfg = _medicalCamp};
	case "redCamp": {_missionCfg = _redCamp};
	case "resupplyCamp": {_missionCfg = _resupplyCamp};
};

//diag_log format["++++ SM1.sqf:  _missionCfg = %1", _missionCfg];
// Parse the _missionCfg into messages and a list of objects for clarity of code
_startMsg = _missionCfg select 0 select 0;
_endMsg = _missionCfg select 0 select 1;
//diag_log format["++++ SM1.sqf:  _startMsg = %1; _endMsg = %2", _startMsg,_endMsg];

if (blck_labelMapMarkers select 0) then 
{
	//diag_log "SM1.sqf: labeling map markers *****";
	blck_OrangeMarker set [2, (_missionCfg select 0 select 2)];
}
else
{
	//diag_log "SM1.sqf: NOT labeling map markers *****";
	blck_OrangeMarker set [2, ""];  //
};
blck_OrangeMarker set [3,blck_labelMapMarkers select 1];
if (blck_preciseMapMarkers) then
{
	//diag_log "SM1.sqf:  Map marker will be PRECISELY at mission position";	
	blck_OrangeMarker set [1,_coords];
} 
else
{
	//diag_log "SM1.sqf:  Map marker will be OFFSET from the mission position";
	blck_OrangeMarker set [1,[_coords,75] call blck_randomPosition];
};

// Define the array of objects to be spawned at the mission, e.g., buildings, bunkers, cammo nets
_missionObjs = _missionCfg select 1;

//Sends message to all players about the AI Mission
["start",_startMsg,blck_OrangeMarker select 2] call blck_MessagePlayers;

//diag_log "SM1.sqf: Setup Mission Map Marker";
// Spawn a map marker on each client
[blck_OrangeMarker] execVM "debug\spawnMarker.sqf";

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance && vehicle _x == _x} count playableunits > 0 };
//Spawns the objects in the composition
// do this before spawning any loot chests so that the chests to properly support the chests when spawned inside structures.
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;

if (count (_missionCfg select 2) > 0) then   // Then there are specific loot crate configurations defined in the composition
{
	// Spawn crates and fill them with loot
	_crates = [_coords,_missionCfg select 2/* array of crates*/] call blck_spawnMissionCrates;
}
else
{  // otherwise spawn a default crate with default contents
	//diag_log "SM1.sqf: Spawn Loot Crates";
	_crates = [_coords,[[blck_crateTypes call BIS_fnc_selectRandom,[0,0,0],blck_BoxLoot_Major,blck_lootCountsMajor]]] call blck_spawnMissionCrates;
};

//diag_log "SM1.sqf: Spawn Smoking Wreck";
if (blck_SmokeAtMissions select 0) then  // spawn a fire and/or smoke near the crate
{
	private ["_temp"];
	_temp = [_coords,blck_SmokeAtMissions select 1] call blck_smokeAtCrates;
	_objects = _objects + _temp;
};

//diag_log "SM1.sqf: Spawn Mines";
if (blck_useMines) then
{
	_mines = [_coords] call blck_spawnMines;
};

// If there are loot vehicles define in the configuration spawn them
if (count (_missionCfg select 3) > 0) then
{
	// spawn vehicles and fill them with loot
	_vehicles = [_coords,_missionCfg select 3 /* array of vehicles*/] call blck_spawnMissionVehicles;
};

//diag_log format["SM1.sqf: Spawn %1 Static Weapons",blck_useStatic];  uiSleep 1;
// Spawn any  randomly generated static weapons and man them
if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Major > 0) then
	{
		private["_static","_count"];
		if ( count (_missionCfg select 4) > 0 ) then  // Specific static weapon parameters are defined for this composition
		{
			_static = _missionCfg select 4 select 1;
			_count = _missionCfg select 4 select 0;
		}
		else  // Use the default static weapon parameters. 
		{
			//diag_log "sm1.sqf: default static spawns utilized";
			_static = blck_staticWeapons;
			_count = blck_SpawnEmplaced_Major;
		};	
		// spawn static weapons and assign AI to them; note that this function exits immediately if the _count == -1
		_aiGroup = [_coords,_count,_static,35,50,"orange"] call  blck_spawnEmplacedWeapon;
		blck_AIMajor = blck_AIMajor + _aiGroup;
	};
};

if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Major > 0) then
	{
		private["_veh","_count"];
		if (count (_missionCfg select 5) > 0) then  // Specific parameters are defined for this composition so use them
		{
			//diag_log "sm1.sqf: default AI Vehicle Patrol spawns utilized";
			_veh = _missionCfg select 5 select 1;
			_count = _missionCfg select 5 select 0;
			
		}
		else  // Otherwise use the default parameters for vehicle patrols
		{	
			//diag_log "sm1.sqf: default AI Vehicle Patrol spawns utilized";
			_count = blck_SpawnVeh_Major;
			_veh = blck_AIPatrolVehicles;
		};		
		// Spawn the vehicle patrols and keep a record of any AI spawned so that they can be cleaned up later if necessary.  Note that the function exits immediately if the count of vehicle patrols is -1.
		_aiGroup = [_coords,_count,_veh,45,60,"orange",3] call  blck_spawnVehiclePatrols;
		blck_AIMajor = blck_AIMajor + _aiGroup;
	};
};

//  Spawn the mission AI and keep a log of the units spawned for cleanup; note that this function exits immediately if the _count == -1
_aiGroup = [_coords,blck_MinAI_Major,blck_MaxAI_Major,"orange",blck_AIGrps_Major,20,40] call blck_spawnGroups;  
blck_AIMajor = blck_AIMajor + _aiGroup;

//Waits until player gets near the _crates to end mission
waitUntil{uiSleep 1; {(isPlayer _x) && ([_x,_crates,15] call blck_playerInRange) && (vehicle _x == _x) } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
//Announce that the mission is complete
["end",_endMsg,blck_OrangeMarker select 2] call blck_MessagePlayers;
[blck_OrangeMarker select 1, "Orange"] execVM "debug\missionCompleteMarker.sqf";
[blck_OrangeMarker select 0] execVM "debug\deleteMarker.sqf";
blck_OrangeMarker set [1,[0,0,0]];
blck_OrangeMarker set [2,""];
if (blck_useSignalEnd) then
{

	[_crates select 0] call blck_signalEnd;
};
diag_log "[blckeagls] End of ORANGE mission SM1";
blck_MissionGoMajor = false;
