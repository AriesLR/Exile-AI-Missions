/*
	Spawn temporary vehicles such as might be used at a mission
	By Ghostrider-DBD-
	Last updated 7-18-15
*/

private ["_coords","_vehicles","_vehs","_pos","_offset","_veh"];
//diag_log format["spawnMissionVehicles.sqf _this = %1",_this];
_coords =[_this,0,[0,0,0]] call BIS_fnc_param; // base coordinates to which any offsets will be applied 
_vehicles = [_this,1,[]] call BIS_fnc_param;  // array containing descriptions of vehicles, their offset positions, and loot if any
_vehs = [];
{
	//diag_log format["spawnMissionCVehicles.sqf _x = %1",_x];
	_offset = _x select 1; // offset relative to _coords at which to spawn the vehicle
	_pos = [(_coords select 0)+(_offset select 0),(_coords select 1) + (_offset select 1),(_coords select 2)+(_offset select 2)];
	_veh = [_x select 0 /* vehicle class name*/, _pos] call blck_spawnVehicle;
	_veh setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
	_vehs pushback _veh;
	[_veh,_x select 2 /*loot array*/, _x select 3 /*array of values specifying number of items of each loot type to load*/] call blck_fillBoxes;
}forEach _vehicles;

_vehs
