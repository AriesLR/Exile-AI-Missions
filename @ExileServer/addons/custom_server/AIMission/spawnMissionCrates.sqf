/*
	Spawn some crates using an array containing crate types and their offsets relative to a reference position and prevent their cleanup.
	By Ghostrider-DBD-
	Last Modified 7-31-15
*/

private ["_coords","_crates","_objs","_pos","_offset"];

_coords = [_this,0,[0,0,0]] call BIS_fnc_param;
_crates = [_this,1,[]] call BIS_fnc_param; //array of crates to be spawned where each is described as ["crate type",[offset relative to coords as x,y,z], loot array, array of values specifying how many of each item type in the loot array to add as weapons,magazines,optics,materials,items,backpacks]
//diag_log format["spawnMissionCrates.sqf: _coords = %1", _coords];
//diag_log format["spawnMissionCrates.sqf: crate count = %1", count _crates];
_objs = [];
{
	//diag_log format["spawnMissionCrates.sqf crate = %1",_x];
	//diag_log format["spawnMissionCrates.sqf _x crate type = %1",_x select 0];
	//diag_log format["spawnMissionCrates.sqf _x offset type = %1",_x select 1];
	//diag_log format["spawnMissionCrates.sqf _x item amounts = %1",_x select 3];	
	_offset = _x select 1; // offset relative to _coords at which to spawn the vehicle
	if ((count _coords) == 3) then // assume that there is a Z offset provided
	{
		_pos = [(_coords select 0)+(_offset select 0),(_coords select 1) + (_offset select 1),(_coords select 2)+(_offset select 2)]; // calculate the world coordinates
	}
	else
	{ 
		if ((count _coords) == 2) then // assume only X and Y offsets are provided
		{
			_pos = [(_coords select 0)+(_offset select 0),(_coords select 1) + (_offset select 1),0]; // calculate the world coordinates
		};
	};
	//diag_log format["spawnMissionCrates.sqf _pos = %1",_pos];		
	_crate = createVehicle [_x select 0 /*vehicle type*/,_pos,[], 0, "CAN_COLLIDE"];
	_crate setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
	_objs pushback _crate;
	[_crate,_x select 2 /*loot array*/, _x select 3 /*array of values specifying number of items of each loot type to load*/] call blck_fillBoxes;
}forEach _crates;

_objs
