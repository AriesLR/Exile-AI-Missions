/*
	Spawn a vehicle and protect it against cleanup by Epoch
	Returns the object (vehicle) created.
	By Ghostrider-DBD-
	Last modified 7-16-15
*/

private["_veh","_pos","_vehType"];

	_vehType = _this select 0;  // type of vehicle to be spawned
	_pos = _this select 1;  // position at which vehicle is to be spawned
	//diag_log format["spawnVehicle.sqf:   _this = %1",_this];
	_veh = createVehicle[_vehType, _pos, [], 0, "NONE"];
	_veh setVariable["LAST_CHECK",14400];
	_veh call EPOCH_server_setVToken;
	_veh
	
