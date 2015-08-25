/*
  Red Mission timer
  Code by blckeagls
  Modified by Ghostrider
   Last modified 7/18/15 
  See Major\majorTimer.sqf for comments
*/
private ["_coords","_wait","_timeDiff","_timeVar","_wait","_startTime","_allAIGroups","_mission","_minor2Missions","_oldAI"];
diag_log "[blckeagls] RED mission timer started";
if (isNil "blck_AIMinor2") then { blck_AIMinor2 = [];};

_minor2Missions = ["SM1"];

while {true} do {
	waitUntil {[blck_TMin_Minor2, blck_TMax_Minor2] call blck_waitTimer};
	blck_AIMinor2 = [];
	_coords = [] call blck_FindSafePosn;
	_coords pushback 0;	
	AllMissionCoords set [2,_coords];	
	_mission = _minor2Missions call BIS_fnc_selectRandom;
	MissionGoMinor2 = true;
	[_coords] execVM format["\q\addons\custom_server\AIMission\Minor2\%1.sqf",_mission];
	waitUntil {!MissionGoMinor2};
	_oldAI = blck_AIMinor2;
	[_oldAI] spawn blck_AICleanup;	
	AllMissionCoords set [2,[0,0,0]];
};