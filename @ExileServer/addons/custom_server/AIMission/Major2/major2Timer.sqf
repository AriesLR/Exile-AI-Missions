/*
  Green Mission timer
  By blckeagls
  Modified by Ghostrider
  Last modified 7/11/15
  See Major\majorTime.sqf for comments
*/

private ["_coords","_allAIGroups","_mission","_Major2Missions","_oldAI"];
[0,"[major2Timer.sqf] GREEN mission timer started"] call beef_fncUtil_Log;
if (isNil "blck_AIMajor2") then { blck_AIMajor2 = [];};

_Major2Missions = ["SM1"];

while {true} do {
	waitUntil {[blck_TMin_Major2, blck_TMax_Major2] call blck_waitTimer};
	blck_AIMajor2 = [];
	_coords = [] call blck_FindSafePosn;
	_coords pushback 0;
	//diag_log format["Major2[Green]\MajorTimer.sqf: _coords = %1",_coords];	
	AllMissionCoords set [1,_coords];	
	_mission = _Major2Missions call BIS_fnc_selectRandom;
	MissionGoMajor2 = true;
	[_coords] execVM format["%1\AIMission\Major2\%2.sqf",BLCK_directory,_mission];
	waitUntil {!MissionGoMajor2;};
	AllMissionCoords set [1,[0,0,0]];
	_oldAI = blck_AIMajor2;
	[_oldAI] spawn blck_AICleanup;	
};