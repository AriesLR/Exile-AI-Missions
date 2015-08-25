/*
 Spawn Blue
  Original Code by blckeagls
  Modified by Ghostrider
  Last updated 8/2/15   
  See \Major\SM1.sqf for comments  
*/

private ["_coords","_crates","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos","_objects","_startMsg","_endMsg","_missionObjs","_compositions","_missionCfg","_compSel","_mines"];
diag_log "[blckeagls] Starting BLUE mission SM1";

_coords = _this select 0;
//diag_log format["Minor[Blue]\SM1.sqf: _coords = %1",_coords];
_objects = [];
_mines = [];
_aiGroup = [];

#include "\q\addons\custom_server\AIMission\Minor\compositions\compositionsBlue.sqf"; 

_compositions = 
[
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
diag_log format["[blckeagls] Blue Mission composition = %1 ",_compSel];
// Select a mission configuration and load the data into _missionCfg
switch (_compositions call BIS_fnc_selectRandom) do 
{
	case "default": {_missionCfg = _default};
	case "default2": {_missionCfg = _default2};	
	case "medicalCamp": {_missionCfg = _medicalCamp};
	case "redCamp": {_missionCfg = _redCamp};
	case "resupplyCamp": {_missionCfg = _resupplyCamp};
};

// Parse the _missionCfg into messages and a list of objects for clarity of code
_startMsg = _missionCfg select 0 select 0;
_endMsg = _missionCfg select 0 select 1;
_missionObjs = _missionCfg select 1;

if (blck_labelMapMarkers select 0) then 
{
	//diag_log "SM1.sqf: labeling map markers *****";
	blck_BlueMarker set [2, (_missionCfg select 0 select 2)];
}
else
{
	//diag_log "SM1.sqf: NOT labeling map markers *****";
	blck_BlueMarker set [2, ""];  //
};

if (blck_preciseMapMarkers) then
{
	//diag_log "SM1.sqf:  Map marker will be PRECISELY at mission position";	
	blck_BlueMarker set [1,_coords];
} 
else
{
	//diag_log "SM1.sqf:  Map marker will be randomly OFFSET from the mission position";
	blck_BlueMarker set [1,[_coords,75] call blck_randomPosition];
};
blck_BlueMarker set [3,blck_labelMapMarkers select 1];
["start",_startMsg,blck_BlueMarker select 2] call blck_MessagePlayers;
[blck_BlueMarker] execVM "debug\spawnMarker.sqf";
waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance && vehicle _x == _x} count playableunits > 0 };
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;
if (count (_missionCfg select 2) > 0) then
{
	_crates = [_coords,_missionCfg select 2/* array of crates*/] call blck_spawnMissionCrates;
}
else
{
	_crates = [_coords,[[blck_crateTypes call BIS_fnc_selectRandom,[0,0,0],blck_BoxesLoot_Minor,blck_lootCountsMinor]]] call blck_spawnMissionCrates;
};

if (blck_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
{
	private ["_temp"];
	_temp = [_coords,blck_SmokeAtMissions select 1] call blck_smokeAtCrates;
	_objects = _objects + _temp;
};

if (blck_useMines) then
{
	_mines = [_coords] call blck_spawnMines;
};

if (count (_missionCfg select 3) > 0) then  // spawn loot vehicles
{
	_vehicles = [_coords,_missionCfg select 3 /* array of vehicles*/] call blck_spawnMissionVehicles;
};

if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Minor > 0) then
	{
		private["_static","_count"];
		if ( count (_missionCfg select 4) > 0 ) then
		{
			_static = _missionCfg select 4 select 1;
			_count = _missionCfg select 4 select 0;
		}
		else
		{
			_static = blck_staticWeapons;
			_count = blck_SpawnEmplaced_Minor;
		};
		_aiGroup = [_coords,_count,_static,35,50,"blue"] call  blck_spawnEmplacedWeapon;
		//diag_log format["Minor\SM1.sqf: results returned by blck_spawnEmplacedWeapon are %1",_aiGroup];		
		blck_AIMinor = blck_AIMinor + _aiGroup;	
	};
};

if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Minor > 0) then
	{
		private["_veh","_count"];
		if (count (_missionCfg select 5) > 0) then
		{
			_veh = _missionCfg select 5 select 1;
			_count = _missionCfg select 5 select 0;
			
		}
		else
		{
			_veh = blck_AIPatrolVehicles;
			_count = blck_SpawnVeh_Minor;
		};
		
		_aiGroup = [_coords,_count,_veh,45,60,"blue",3] call  blck_spawnVehiclePatrols;
		blck_AIMinor = blck_AIMinor + _aiGroup;
	};
};

_aiGroup = [_coords,blck_MinAI_Minor,blck_MaxAI_Minor,"blue",blck_AIGrps_Minor,20,40] call blck_spawnGroups;
blck_AIMinor = blck_AIMinor + _aiGroup;

waitUntil{uiSleep 1; {(isPlayer _x) && ([_x,_crates,15] call blck_playerInRange) && (vehicle _x == _x) } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
["end",_endMsg,blck_BlueMarker select 2] call blck_MessagePlayers;
[blck_BlueMarker select 1, "Blue"] execVM "debug\missionCompleteMarker.sqf";
[blck_BlueMarker select 0] execVM "debug\deleteMarker.sqf";
blck_BlueMarker set [1,[0,0,0]];
blck_BlueMarker set [2,""];
if (blck_useSignalEnd) then
{
	//diag_log format["**** Minor\SM1.sqf::    _crate = %1",_crates select 0];
	[_crates select 0] call blck_signalEnd;
};
diag_log "[blckeagls] End of BLUE mission SM1";
MissionGoMinor = false;
