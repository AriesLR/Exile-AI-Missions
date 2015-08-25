/*
	Spawns a wreck and plumb of smoke within the area specified by _pos
	by Ghostrider-DBD-
	Last updated 8/2/15
*/


private ["_pos","_objs","_smokeSource","_smokeTrail","_fire","_posFire","_posWreck","_smoke","_dis","_minDis","_maxDis","_closest","_wrecks","_mode"];

_objs = [];

// http://www.antihelios.de/EK/Arma/index.htm
_wrecks = ["Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Tyres_F","Land_Pallets_F","Land_MetalBarrel_F"];
_smokeSource = _wrecks call BIS_fnc_selectRandom;  
// Use the Land_Fire_burning item if you want a bright visual cue at night but be forewarned that the flames are blinding with NVG at close range and may damage players
_smokeTrail = "test_EmptyObjectForSmoke"; // "options are "test_EmptyObjectForFireBig", "test_EmptyObjectForSmoke"
_pos = _this select 0;
_mode = _this select 1;

switch (_mode) do {
	case "none": {if (true) exitWith {};};
	case "center": {_minDis = 5; _maxDis = 15; _closest = 5;};
	case "random": {_minDis = 15; _maxDis = 50; _closest = 10;};
	default {_minDis = 5; _maxDis = 15; _closest = 5;};
};
_dis = 0;
//_posWreck = [_pos, 0, 30, 10, 0, 20, 0] call BIS_fnc_findSafePos; // Position the wreck within 30 meters of the position and 5 meters away from the nearest object
// _minDis and _maxDis determine the spacing between the smoking item and the loot crate.
//_minDis = 5; // Minimum distance of 
//_maxDis = 50;
//_closest = 10;

while {_dis < 7} do
{
	_posWreck = [_pos, _minDis, _maxDis, _closest, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call
	_dis = _posWreck distance _pos;
};

_fire = createVehicle [_smokeSource, _posWreck, [], 0, "can_collide"];
_fire setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_fire setPos _posWreck;
_fire setDir floor(random(360));
//https://community.bistudio.com/wiki/setVectorUp
//_fire setVectorUp surfaceNormal position _fire;

_smoke = createVehicle [_smokeTrail, _posWreck, [], 0, "can_collide"];  // "test_EmptyObjectForSmoke" createVehicle _posFire;  
_smoke setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_smoke attachto [_fire, [0,0,1]]; 

_objs = _objs + [_fire,_smoke];
//diag_log format ["--smokeAtCrate.sqf:: _objs = %1",_objs];
_objs