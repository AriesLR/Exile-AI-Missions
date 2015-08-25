//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
// by Ghostrider-DBD- 
// Last modified 7/16/15
/////////////////////////////////////////////////////

	private ["_obj1","_objList","_minDist","_result"];
	_obj1 = _this select 0;  // player or other object
	_objList = _this select 1;  // array of objects
	_minDist = _this select 2;  // distance below which the function would return true;
	_result = false;
	
	//diag_log format["playerInRange.sqf: _obj1 = %1, _objList = %2 _minDist = %3",_obj1,_objList,_minDist];
	{
		if ((_x distance _obj1) < _minDist) exitWith {_result = true;};
	} forEach _objList;
	
	_result