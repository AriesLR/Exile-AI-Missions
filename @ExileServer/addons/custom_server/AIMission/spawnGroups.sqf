/*
  Code by Ghostrider-DBD-
  Spawn a collection of groups around a particular position
  Last updated 8/2/15
*/
//Sets Private Variables to they don't interfere when this script is called more than once
private["_pos","_i","_skillLevel","_numai","_aiGroup","_numai1","_numai2","_xpos","_ypos","_newpos","_group","_numGroups","_minDist","_maxDist","_numai","_arc","_dir","_dist","_numAIPerGroup"];	
		
//Gets variables passed from SM1.sqf
_pos = _this select 0;
_numai1 = [_this,1,5] call BIS_fnc_param;  // minimum # of mission AI to spawn 
_numai2 = [_this,2,10] call BIS_fnc_param; // maximum # of mission AI to spawn
_skillLevel = [_this,3,"blue"] call BIS_fnc_param; // "blue", "red", "green", "orange"
_numGroups = [_this,4,1] call BIS_fnc_param; // AIi will be devided into this # of groups
_minDist = [_this,5,20] call BIS_fnc_param;  // Min dist from mission center at which to spawn AI
_maxDist = [_this,6,35] call BIS_fnc_param;  // Max dist from mission center at which to spawn AI

_aiGroup = [];

_numai = round(_numai2 + round(random(_numai2 - _numai1)));
//Spawns the AI at several randomized locations relative to the loot box
_numAIPerGroup = round(_numai /_numGroups);
_arc = 360/_numGroups;
_dir = random 360;
//diag_log format["spawnGroups.sqf: spawning %1 groups of ~ %2 AI at postion %3",_numGroups,_numAIPerGroup,_pos];
for "_i" from 1 to _numGroups do {
	_dist = (_minDist+(random (_maxDist - _minDist)));
	_dir = _dir + _arc;
	if (_dir > 360) then {_dir = _dir - 360};	
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	//diag_log format["spawnGroups.sqf: spawning group # %1 at %2",_i,_newPos];
	_group = [_newPos,_numAIPerGroup,_numAIPerGroup+1,"orange",_pos,_minDist,_maxDist] call blck_spawnGroup;
	_aiGroup = _aiGroup + _group;
	_dir = _dir + _arc;
};
//diag_log format["spawnGroups.sqf: %1 units spawned", count _aiGroup];
_aiGroup;  // return an array containing the units just spawned.
