//////////////////////////////////////////////
//  returns a position array at random position within a radius of _range relative to _pos.
// Ghostrider-DBD-
// Last updated 7/11/15
////////////////////////////////////////////

private["_pos","_range","_newX","_newY"];
_pos = _this select 0;
_range = _this select 1;

//diag_log format["--<><>randomPosn.sqf: called with parameters %1",_this];
//diag_log format["--<><>randomPosn.sqf: _pos = %1;  _range = %2",_pos, _range];
_signs = [1,-1];
_sign = _signs call BIS_fnc_selectRandom;

_newX = ((_pos select 0) + (random(_range)) * (_signs call BIS_fnc_selectRandom));
_newY = ((_pos select 1) + (random(_range)) * (_signs call BIS_fnc_selectRandom)); 

//diag_log format["--<><>randomPosn.sqf: return values %1",[_newX,_newY,0]];
[_newX,_newY,0]

