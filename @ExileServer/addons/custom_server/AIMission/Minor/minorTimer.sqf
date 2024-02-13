/*
  Blue Mission timer
  Code by blckeagls
  Modified by Ghostrider, Beefheart
  Last modified 8/30/15
  See Major\majorTimer.sqf for comments
*/
private ["_coords","_wait","_timeDiff","_timeVar","_wait","_startTime","_allAIGroups","_mission","_minorMissions","_oldAI"];
[0,"[minorTimer.sqf] BLUE mission timer started"] call beef_fncUtil_Log;

_minorMissions = ["SM1"];
if (isNil "blck_AIMinor") then { blck_AIMinor = [];};

while {true} do {
	waitUntil {[blck_TMin_Minor, blck_TMax_Minor] call blck_waitTimer};
	blck_AIMinor = [];
	_coords = [] call blck_FindSafePosn;
	_coords pushback 0;
	AllMissionCoords set [3,_coords];
	AllMissionCoords = AllMissionCoords + [_coords];
	_mission = _minorMissions call BIS_fnc_selectRandom;
	MissionGoMinor = true;
	[_coords] execVM format["%1\AIMission\Minor\%2.sqf",BLCK_directory,_mission];
	waitUntil {!MissionGoMinor};
	AllMissionCoords set [3,[0,0,0]];
	_oldAI = blck_AIMinor;
	[_oldAI] spawn blck_AICleanup;
};
