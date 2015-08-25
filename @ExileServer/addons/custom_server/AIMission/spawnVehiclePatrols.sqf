//////////////////////////////////////
// Spawn vehicles, man with AI, give AI waypoints around the perimeter of the mission area
// Returns an array _units that contains a list of the units that were spawned and placed in the vehicle
// By Ghostrider-DBD-
// Last updated 7/30/15

fn_setWaypoints =
{
	_group = _this select 0;  // The group to which waypoints should be assigned
	_center = _this select 1;  // center of the mission area
	
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	[_center,50,100,_group] call blck_setupWaypoints;
};

private["_pos","_index","_noVehPatrols","_level","_vehType","_minDis","_maxDis","_dir","_arc","_xpos","_ypos","_newpos","_vehType","_safepos","_units","_dist","_aiGroup","_numAI","_veh","_grp"];
//diag_log format["---***>>>spawnVehiclePatrols.sqf: _this = %1",_this];
//Gets position information from spawnai1.sqf
_pos = _this select 0; // Center of the mission area
_noVehPatrols = [_this,1,-1] call BIS_fnc_param; // number of vehicles to spawn
_vehTypes = [_this,2,blck_AIPatrolVehicles] call BIS_fnc_param; 
_minDis = [_this,3,30] call BIS_fnc_param;  // minimum distance from the center of the mission for vehicle waypoints
_maxDis = [_this,4,45] call BIS_fnc_param;  // maximum distance from the center of the mission for vehicle waypoints
_level = [_this,5,"red"] call BIS_fnc_param;  // difficulty level of the AI
_numAI = [_this,6,3] call BIS_fnc_param;  // Number of AI to spawn 

if (_noVehPatrols <= 0) exitWith {};

_units = [];
_dir = round(random(360));
_arc = 360/_noVehPatrols;

for "_i" from 1 to _noVehPatrols do
{	
	// spread out the spawn points for the vehicles
	_dir = _dir + _arc;
	if (_dir > 360) then {_dir = _dir - 360;};  // for conceptual purposes.
	_dist = round(_minDis + (random(_maxDis - _minDis)));
	_xpos = (_pos select 0) + sin (_dir) * _dist;
	_ypos = (_pos select 1) + cos (_dir) * _dist;
	_newpos = [_xpos,_ypos,0];	
	
	// Spawn the vehicle
	_index = floor(random(count blck_AIPatrolVehicles));
	_vehType = blck_AIPatrolVehicles select _index;
	//diag_log format["spawnVehiclePatrols.sqf: _vehType is %1",_vehType];
	_safepos = [_newpos,0,25,0,0,20,0] call BIS_fnc_findSafePos;	
	_veh = [_vehType,_safepos] call blck_spawnVehicle;
	
	_veh addEventHandler ["GetIn",{  // forces player to be ejected if he/she tries to enter the vehicle
		private ["_theUnit"];
		_theUnit = _this select 2;
		_theUnit action ["Eject", vehicle _theUnit];
	}];
	_veh setVehicleLock "LOCKEDPLAYER";

	// Spawn AI to man the vehicle
	_aiGroup = [_safepos,_numAI,_numAI,_level,_pos,_minDis,_maxDis] call blck_spawnGroup;	
	//diag_log format["spawnVehiclePatrols.sqf: _aiGroup is %1",_aiGroup];	
	_units = _units + _aiGroup;
	//diag_log format["spawnVehiclePatrols.sqf: _units is %1",_units];
	// delete any waypoints that may have been assigned and add new waypoints along the periphery of the mission area
	_grp = group (_aiGroup select 0);
	//diag_log format["spawnVehicle.sqf: typeName of _grp is %1", typeName _grp];
	//[_pos, _grp] call fn_setWaypoints;

	//Moves 3 AI units into vehicle
	(_aiGroup select 0) moveingunner _veh;
	(_aiGroup select 1) moveindriver _veh;
	for "i" from 2 to (count _aiGroup) do {
		(_aiGroup select _i) moveInCargo _veh;
	};
	_veh lockCargo true;
	_veh setVariable ["Driver", driver _veh,true];
	_veh setVariable ["Gunner", gunner _veh, true];
	_veh setVariable ["Cargo", (_aiGroup select 2), true];
	_veh setVariable ["Group", group (driver _veh), true];
	
	//diag_log format["spawnVehicle.sqf: vehicle crew is %1", (crew _veh)];	
	//Clears vehicle inventory
	clearWeaponCargoGlobal    _veh;
	clearMagazineCargoGlobal  _veh;
	clearBackpackCargoGlobal  _veh;
	clearItemCargoGlobal       _veh;
	_veh setVehicleLock "LOCKEDPLAYER";
	
	[_veh] spawn blck_vehicleMonitor;
};

//diag_log format["spawnVehiclePatrols.sqf: RETURN value of _units is %1",_units];
_units