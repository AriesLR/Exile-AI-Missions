////////////////////////////////////////////
// Create, delete and change Mission Markers
// 7/10/15
// by Ghostrider-DbD-
//////////////////////////////////////////
// spawn a temporary marker to indicate the position of a 'completed' mission
// this will not show to JIP players

private["_location","_MainMarker","_name"];

_location = _this select 0;
_name = str(random(1000000)) + "MarkerCleared";
//diag_log format["#### missionCompleteMarker.sqf: _this = %3;   _location = %1;  _name = %2",_location,_name,_this];
_MainMarker = createMarker [_name, _location];
_MainMarker setMarkerColor "ColorBlack";
//_MainMarker setMarkerType "hd_dot";
_MainMarker setMarkerType "n_hq";
_MainMarker setMarkerText "Mission Cleared";
uiSleep blck_MarkerPeristTime;
deleteMarker _MainMarker;
