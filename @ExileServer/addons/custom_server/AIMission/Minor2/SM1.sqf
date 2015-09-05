/*
  Spawn Red Mision2
  Code by blckeagls
  Modified by Ghostrider
  Last updated 8/2/15  
*/
//See Major/SM1.sqf for comments
private ["_coords","_crates","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos","_objects","_startMsg","_endMsg","_missionObjs","_compositions","_missionCfg","_compSel","_mines"];
diag_log "[blckeagls] Starting RED mission SM1";

_coords = _this select 0;
//diag_log format["Minor2[Red]\SM1.sqf: _coords = %1",_coords];
_objects = [];
_mines = [];
_aiGroup = [];

#include "\q\addons\custom_server\AIMission\Minor2\compositions\compositionsRed.sqf"; 

// a listing of mission compositions for this mission set.
_compositions = 
[
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
[0,format["[SM1.sqf] Red Mission composition = %1",_compSel]] call beef_fncUtil_Log;
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
	blck_RedMarker set [2, (_missionCfg select 0 select 2)];
}
else
{
	//diag_log "SM1.sqf: NOT labeling map markers *****";
	blck_RedMarker set [2, ""];  //
};

if (blck_preciseMapMarkers) then
{
	//diag_log "SM1.sqf:  Map marker will be PRECISELY at mission position";	
	blck_RedMarker set [1,_coords];
} 
else
{
	//diag_log "SM1.sqf:  Map marker will be OFFSET from the mission position";
	blck_RedMarker set [1,[_coords,75] call blck_randomPosition];
};
blck_RedMarker set [3,blck_labelMapMarkers select 1];
["start",_startMsg,blck_RedMarker select 2] call blck_MessagePlayers;
[blck_RedMarker] execVM "debug\spawnMarker.sqf";
waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;
if (count (_missionCfg select 2) > 0) then
{
	// Spawn crates and fill them with loot
	_crates = [_coords,_missionCfg select 2/* array of crates*/] call blck_spawnMissionCrates;
}
else
{
	_crates = [_coords,[[blck_crateTypes call BIS_fnc_selectRandom,[0,0,0],blck_BoxesLoot_Minor2,blck_lootCountsMinor2]]] call blck_spawnMissionCrates;
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

if (count (_missionCfg select 3) > 0) then
{
	// spawn vehicles and fill them with loot
	_vehicles = [_coords,_missionCfg select 3 /* array of vehicles*/] call blck_spawnMissionVehicles;
};

if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Minor2 > 0) then
	{
		private["_static","_count"];
		//diag_log format["SM1.sqf _missionCfg select 4 = %1", _missionCfg select 4];
		if ( count (_missionCfg select 4) > 0 ) then
		{
			_static = _missionCfg select 4 select 1;
			_count = _missionCfg select 4 select 0;
		}
		else
		{
			_static = blck_staticWeapons;
			_count = blck_SpawnEmplaced_Minor2;
		};		
		_aiGroup = [_coords,_count,_static,35,50,"red"] call  blck_spawnEmplacedWeapon;
		blck_AIMinor2 = blck_AIMinor2 + _aiGroup;
	};
};

if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Minor2 > 0) then
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
			_count = blck_SpawnVeh_Minor2;
		};
		_aiGroup = [_coords,_count,_veh,45,60,"red",3] call  blck_spawnVehiclePatrols;
		blck_AIMinor2 = blck_AIMinor2 + _aiGroup;
	};
};

_aiGroup = [_coords,blck_MinAI_Minor2,blck_MaxAI_Minor2,"red",blck_AIGrps_Minor2,20,40] call blck_spawnGroups;
blck_AIMinor2 = blck_AIMinor2 + _aiGroup;

waitUntil{uiSleep 1; {(isPlayer _x) && ([_x,_crates,15] call blck_playerInRange) && (vehicle _x == _x) } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
["end",_endMsg,blck_RedMarker select 2] call blck_MessagePlayers;
//[blck_RedMarker select 1, "Red"] execVM "debug\missionCompleteMarker.sqf";
[blck_RedMarker select 0] execVM "debug\deleteMarker.sqf";
blck_RedMarker set [1,[0,0,0]];
blck_RedMarker set [2,""];
if (blck_useSignalEnd) then
{
	[_crates select 0] call blck_signalEnd;
};
[0,"[SM1.sqf] RED mission ended"] call beef_fncUtil_Log;
MissionGoMinor2 = false;
