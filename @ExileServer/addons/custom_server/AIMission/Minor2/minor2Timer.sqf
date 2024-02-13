/*
  Red Mission timer
  Code by blckeagls
  Modified by Ghostrider, Beefheart
   Last modified 8/30/15
  See Major\majorTimer.sqf for comments
*/
private ["_coords","_wait","_timeDiff","_timeVar","_wait","_startTime","_allAIGroups","_mission","_minor2Missions","_oldAI"];
[0,"[minor2Timer.sqf] RED mission timer started"] call beef_fncUtil_Log;

_minor2Missions = ["SM1"];
if (isNil "blck_AIMinor2") then { blck_AIMinor2 = [];};

while {true} do {
	waitUntil {[blck_TMin_Minor2, blck_TMax_Minor2] call blck_waitTimer};
	blck_AIMinor2 = [];
	_coords = [] call blck_FindSafePosn;
	_coords pushback 0;
	AllMissionCoords set [2,_coords];
	_mission = _minor2Missions call BIS_fnc_selectRandom;
	MissionGoMinor2 = true;
	[_coords] execVM format["%1\AIMission\Minor2\%2.sqf",BLCK_directory,_mission];
	waitUntil {!MissionGoMinor2};
	_oldAI = blck_AIMinor2;
	[_oldAI] spawn blck_AICleanup;
	AllMissionCoords set [2,[0,0,0]];
};