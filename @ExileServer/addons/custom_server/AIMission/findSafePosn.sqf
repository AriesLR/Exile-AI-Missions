// self explanatory. Checks to see if the position is in either a black listed location or near a player spawn. 
// As written this relies on BIS_fnc_findSafePos to ensure that the spawn point is not on water or an excessively steep slope. 
// The parameter for slope needs verification
// By Ghostrider-DBD-
// Last updated 8/2/15

private["_findNew","_coords","_blackListCenter","_blackListRadius","_dist","_xpos","_ypos","_newPos","_townPos"];

_findNew = true;

while {_findNew} do {
	_findNew = false;
	//[_centerForSearch,_minDistFromCenter,_maxDistanceFromCenter,_minDistanceFromNearestObj,_waterMode,_maxTerainGradient,_shoreMode] call BIS_fnc_findSafePos
	// https://community.bistudio.com/wiki/BIS_fnc_findSafePos
	_coords = [blck_mapCenter,0,blck_mapRange,30,0,5,0] call BIS_fnc_findSafePos;
	{
		if ((_x distance _coords) < MinDistanceFromMission) then {
			_FindNew = true;
		};
	} forEach AllMissionCoords;
	
	{
		_blackListCenter = _x select 0;
		_blackListRadius = _x select 1;
		if ( (_blackListCenter distance _coords) < _blackListRadius) exitWith
		{
			_FindNew = true;
		};
		//};
	} forEach blck_locationBlackList;
 
	// test for water nearby
	private ["_i"];
	_dist = 100;
	for [{_i=0}, {_i<360}, {_i=_i+20}] do
	{
		_xpos = (_coords select 0) + sin (_i) * _dist;
		_ypos = (_coords select 1) + cos (_i) * _dist;
		_newPos = [_xpos,_ypos,0];
		if (surfaceIsWater _newPos) then
		{
			_FindNew = true;
			_i = 361;
		};
	};
	// check that missions spawn at least 1 kkm from towns
	{
		_townPos = [((locationPosition _x) select 0), ((locationPosition _x) select 1), 0];
		if (_townPos distance _coords < 1000) exitWith {
			_FindNew = true;
		};
	} forEach blck_townLocations;
};

_coords;