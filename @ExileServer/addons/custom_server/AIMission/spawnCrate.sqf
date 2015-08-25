/*
	spawn a crate at a specific location and protect it against cleanup by Epoch
	returns the object (crate) that was created.
	By Ghostrider-DBD-
	Last modified 7-14-15
*/

private ["_coords","_crate","_px","_py","_crateType"];

_coords = _this select 0;
_px = _coords select 0;
_py = _coords select 1;

_crateType = blck_crateTypes call BIS_fnc_selectRandom;
_crate = objNull;
_crate = createVehicle [_crateType,_coords,[], 0, "CAN_COLLIDE"];
_crate setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_crate setPos [_px, _py, 0.5];

_crate;
