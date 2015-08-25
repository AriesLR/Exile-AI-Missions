// Not used, retained for possible future purpose

private["_pos","_arr","_sorted","_return"];
/*
	Source: http://forums.bistudio.com/showthread.php?97602-Sort-Array-per-Distance
	Edited by KiloSwiss to directly return the closest element in the array that is a player
*/

_pos = _this select 0;
_arr = _this select 1;
diag_log format["### Possible threads: %1", _arr];
_sorted = [];
{ private "_closest";
	_closest = _arr select 0; diag_log format["### A: %1", _closest];
	{if ((_x distance _pos) < (_closest distance _pos)) then {_closest = _x}} count _arr;
	_sorted pushBack _closest;
	_arr = _arr - [_closest];
}forEach _arr;
diag_log format["### B: %1", _sorted];
_return = _sorted select 0;
diag_log format["### C: %1", _return];

_return
