	// Spawn objects from a list of object names and offsets
	
	private ["_coords","_objList","_list","_obj","_xpos","_ypos","_offset","_baseObj"];
	_coords = _this select 0;
	_objList = _this select 1;
	_list = [];
	_obj = nil;

	{
		_obj = _x select 0;
		_offset = _x select 1;
		_xpos = _offset select 0;
		_ypos = _offset select 1;
		_xpos = (_coords select 0) + _xpos;
		_ypos = (_coords select 1) + _ypos;
		_baseObj = createVehicle [_x select 0,[_xpos,_ypos,0],[], 0, "CAN_COLLIDE"];
		_baseObj setVariable["LAST_CHECK",14400];
		_baseObj setPos [_xpos,_ypos,,0];
		_list = _list + [_baseObj];
		uiSleep 0.2;
	} forEach _objList;
	
	_list
	




