	// Delete a list of objects after a certain time.
	// By Ghostrider-DBD-
	// Last modified 8/2/15
	// code to delete any smoking or on fire objects adapted from kalania but .. unfortunately not yet working
	//http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page1
	// http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page2

	private ["_buildings","_startTime","_waitTime"];
	
	_buildings = _this select 0;
	_waitTime = _this select 1;
	
	_startTime = diag_tickTime;
	//diag_log format["cleanUpObjects: -- >> _buildings = %1",_buildings];
	waitUntil {sleep 10; (diag_tickTime - _startTime) > _waitTime;};

	
	fn_deleteParticleSource = {
		private ["_wokka","_emitterArray"];
		
		_wokka = _this select 0;
		//diag_log format["fn_deleteParticleSource: -- >> _wokka is %1", _wokka];
		//_emitterArray = _wokka getVariable "effects";
		//diag_log format["fn_deleteParticleSource: -- >> emmitterArray is %1",_emitterArray];
		{
			diag_log format["deleting emiter %1 of type %2",_x, typeOf _x]; 
			deleteVehicle _x;
		} forEach _wokka;
		deleteVehicle _wokka;
	};
	///////////////////////////////////////////////////
	//  Main body of the function
	//////////////////////////////////////////////////
	{
		
		if (typeOf _x == "test_EmptyObjectForSmoke") then {
			//diag_log "cleanupobjects.sqf: _x is a test_EmptyObjectForSmoke, calling subroutine";
			//[_x] call fn_deleteParticleSource;
			_x setVariable ["LAST_CHECK", (diag_tickTime + blck_cleanupCompositionTimer)];
		} else {
			//diag_log format["cleanupObjects.sqf: -- >> object %1 is typeOf %2",_x, typeOf _x];		
			deleteVehicle _x;
			//_x setVariable ["LAST_CHECK", (diag_tickTime + blck_cleanupCompositionTimer)];
		};
	} forEach _buildings;
	////////////////////////////////////////////////
	


 



