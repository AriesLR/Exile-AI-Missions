// Immediately deletes everything in a list
// by Ghostrider-DBD-
// Last modified 8/2/15

private ["_mines"];
_mines = _this select 0;
//diag_log format["deleting %1 mines----- >>>> ", count _mines];
{
	deleteVehicle _x;
} forEach _mines;

