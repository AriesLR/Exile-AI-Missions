//////////////////////////////////////////////////////
// Attach a marker of type _marker to the first object in the array _crates every 60 seconds for 5 min.
// by Ghostrider-DBD- based on an idea from Wicked AI for Arma 2 Dayz Epoch 
// Last modified 7/18/15
/////////////////////////////////////////////////////

	private ["_crate","_start","_bbr","_p1","_p2","_maxHeight","_signalCrate"];
	_crate = _this select 0;
	_start = diag_tickTime;
	diag_log format["signalEnd.sqf: _this = %1, _crate = %2",_this, _crate];

	_smokeTypes = ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShell"];
	_smoke = [_smokeTypes] call BIS_fnc_selectRandom;		
	_signalCrate = _crate;
	_bbr = boundingBoxReal _signalCrate;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_maxHeight = abs ((_p2 select 2) - (_p1 select 2));	
	diag_log format["signalEnd.sqf: Spawning Smoke of type _marker %1 at crate of type _crate = %2",_marker, _crate];
	while { (diag_tickTime - _start) < 300 } do  // loop for 5 min accounting for the fact that smoke grenades do not last very long
	{
		diag_log format["signalEnd.sqf: Loop pass at diag_tickTime %1",diag_tickTime];
		_marker = _smoke createVehicle (getPos _signalCrate);
		_marker setPosATL (getPosATL _signalCrate);
		// bounding box code from example attachTo
		// https://community.bistudio.com/wiki/boundingBoxReal
		_marker attachTo [_signalCrate,[0,0,(_maxHeight + 0.01)]];
		uiSleep 60;
		deleteVehicle _marker;
	};
	
