////////////////////////////////////////////
// Create, delete, Mission Markers
// 8/1/15
// by Ghostrider-DbD-
//////////////////////////////////////////
// spawn a round marker of a size and color specified in passed parameters
private["_blck_fn_configureRoundMarker"];
_blck_fn_configureRoundMarker = {
	private["_name","_pos","_color","_size","_MainMarker","_labelType"];
	//diag_log format["_blck_fn_configureRoundMarker: -: _this = %1", _this];
	_name = _this select 0;
	_pos = _this select 1;
	_color = _this select 2;
	_text = _this select 3;	
	_size = _this select 4;
	_labelType = _this select 5;

	//diag_log format["_blck_fn_configureRoundMarker: _pos = %1, _color = %2, _size = %3, _name = %4, label %5",_pos, _color, _size, _name, _text];
	// Do not show the marker if it is in the left upper corner
	if ((_pos distance [0,0,0]) < 10) exitWith {};
	
	_MainMarker = createMarker [_name, _pos];
	_MainMarker setMarkerColor _color;
	_MainMarker setMarkerShape "ELLIPSE";
	_MainMarker setMarkerBrush "Grid";
	_MainMarker setMarkerSize _size; //
	//diag_log format["_blck_fn_configureRoundMarker: -: _labelType = %1", _labelType];
	if (count toArray(_text) > 0) then
	{
		switch (_labelType) do {
			case "arrow":
			{
				//diag_log "++++++++++++++--- marker label arrow detected";
				
				_name = "label" + _name;
				_textPos = [(_pos select 0) + (count toArray (_text) * 12) - 200, (_pos select 1) - (_size select 0), 0];
				_MainMarker = createMarker [_name, _textPos];
				_MainMarker setMarkerShape "Icon";
				_MainMarker setMarkerType "HD_Arrow";
				_MainMarker setMarkerColor "ColorBlack";
				_MainMarker setMarkerText _text;
				_MainMarker setMarkerDir 37;
				};
			case "dot": 
			{
				//diag_log "++++++++++++++--- marker label dot detected";
				_name = "label" + _name;
				_MainMarker = createMarker [_name, _pos];
				_MainMarker setMarkerShape "Icon";
				_MainMarker setMarkerType "hd_dot";
				_MainMarker setMarkerColor "ColorBlack";
				_MainMarker setMarkerText _text;
				};
			};
	};
};

// determine the type of marker and call the spawn routine with appropriate parameters
private["_mArray","_MainMarker"];
_mArray = _this select 0;
//diag_log format["********spawnMarker.sqf: _this = %1",_this];
switch (_mArray select 0) do {
	case "OrangeMarker": {[_mArray select 0, _mArray select 1, "ColorOrange", _mArray select 2, [275,275],_mArray select 3] call _blck_fn_configureRoundMarker;};
	case "GreenMarker": {[_mArray select 0, _mArray select 1, "ColorGreen",_mArray select 2, [250,250],_mArray select 3] call _blck_fn_configureRoundMarker;};
	case "RedMarker": {[_mArray select 0, _mArray select 1, "ColorRed",_mArray select 2, [225,225],_mArray select 3] call _blck_fn_configureRoundMarker;};
	case "BlueMarker": {[_mArray select 0, _mArray select 1, "ColorBlue",_mArray select 2, [200,200],_mArray select 3] call _blck_fn_configureRoundMarker;};
};
