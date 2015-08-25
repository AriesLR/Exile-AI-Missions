/*
  Spawn Green Mission
  Original Code by blckeagls
  Modified by Ghostrider
  Last modified 8/2/15
  See Major\SM1.sqf for comments
*/

private ["_coords","_crates","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos","_objects","_startMsg","_endMsg","_missionObjs","_compositions","_missionCfg","_compSel","_mines"];
diag_log "[blckeagls] Starting GREEN mission SM1";

_coords = _this select 0;
//diag_log format["Major2[Green]\SM1.sqf: _coords = %1",_coords];
_objects = [];
_mines = [];
_aiGroup = [];

#include "\q\addons\custom_server\AIMission\Major2\compositions\compositionsGreen.sqf"; 

_compositions = 
[
	"default"	
];

_compSel = _compositions call BIS_fnc_selectRandom;

switch (_compositions call BIS_fnc_selectRandom) do 
{
	case "default": {_missionCfg = _default};
	case "default2": {_missionCfg = _default2};	
	case "medicalCamp": {_missionCfg = _medicalCamp};
	case "redCamp": {_missionCfg = _redCamp};
	case "resupplyCamp": {_missionCfg = _resupplyCamp};
};

_startMsg = _missionCfg select 0 select 0;
_endMsg = _missionCfg select 0 select 1;
_missionObjs = _missionCfg select 1;

if (blck_labelMapMarkers select 0) then 
{
	//diag_log "SM1.sqf: labeling map markers *****";
	blck_GreenMarker set [2, (_missionCfg select 0 select 2)];
}
else
{
	//diag_log "SM1.sqf: NOT labeling map markers *****";
	blck_GreenMarker set [2, ""];  //
};
blck_GreenMarker set [3,blck_labelMapMarkers select 1];
if (blck_preciseMapMarkers) then
{
	//diag_log "SM1.sqf:  Map marker will be PRECISELY at mission position";	
	blck_GreenMarker set [1,_coords];
} 
else
{
	//diag_log "SM1.sqf:  Map marker will be OFFSET from the mission position";
	blck_GreenMarker set [1,[_coords,75] call blck_randomPosition];
};

//Sends message to all players about the AI Mission
["start",_startMsg,blck_GreenMarker select 2] call blck_MessagePlayers;
[blck_GreenMarker] execVM "debug\spawnMarker.sqf";
waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;
if (count (_missionCfg select 2) > 0) then
{
	// Spawn crates and fill them with loot
	_crates = [_coords,_missionCfg select 2/* array of crates*/] call blck_spawnMissionCrates;
}
else
{
	_crates = [_coords,[[blck_crateTypes call BIS_fnc_selectRandom,[0,0,0],blck_BoxesLoot_Major2,blck_lootCountsMajor2]]] call blck_spawnMissionCrates;
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
	if (blck_SpawnEmplaced_Major2 > 0) then
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
			_count = blck_SpawnEmplaced_Major2;
		};	
		_aiGroup = [_coords,_count,_static,35,50,"green"] call  blck_spawnEmplacedWeapon;
		blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	};
};

if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Major2 > 0) then
	{
		private["_veh","_count"];
		if (count (_missionCfg select 5) > 0) then
		{
			_veh = _missionCfg select 5 select 1;
			_count = _missionCfg select 5 select 0;
			
		}
		else
		{		
			_count = blck_SpawnVeh_Major2;
			_veh = blck_AIPatrolVehicles;
		};	
		_aiGroup = [_coords,_count,_veh,45,60,"green",3] call  blck_spawnVehiclePatrols;
		blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	};
};

_aiGroup = [_coords,blck_MinAI_Major2,blck_MaxAI_Major2,"green",blck_AIGrps_Major2,20,40] call blck_spawnGroups;
blck_AIMajor2 = blck_AIMajor2 + _aiGroup;

waitUntil{uiSleep 1; {(isPlayer _x) && ([_x,_crates,15] call blck_playerInRange) && (vehicle _x == _x) } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
["end",_endMsg,blck_GreenMarker select 2] call blck_MessagePlayers;
[blck_GreenMarker select 1, "Green"] execVM "debug\missionCompleteMarker.sqf";
[blck_GreenMarker select 0] execVM "debug\deleteMarker.sqf";
blck_GreenMarker set [1,[0,0,0]];
blck_GreenMarker set [2,""];
if (blck_useSignalEnd) then
{

	[_crates select 0] call blck_signalEnd;
};
MissionGoMajor2 = false;
diag_log "[blckeagls] End of GREEN mission SM1";