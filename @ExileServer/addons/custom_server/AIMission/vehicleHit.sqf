// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.1.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/index.php?threads/sarge-ai-framework-public-release.8391/
//		
// ---------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------
//   SAR_ai_vehicle_hit.sqf
//   last modified: 1.4.2013
//   not used yet, some issues with the eventhandler
// ---------------------------------------------------------------------------------------------------------
// Modified by Ghostrider
// Not used currently as a vehicle hit causes all AI to exit the vehicle which defeats the purpose of the script
// ------------------------------------------------------------------------------------------------------------


private ["_ai_veh","_ai_veh_hitsource","_ai_veh_type","_ai_veh_name","_ai_veh_side","_ai_veh_group_side","_ai_veh_hitsource_group_side","_ai_veh_hitsource_type","_ai_veh_hitsource_name","_ai_veh_hitsource_side"];

diag_log "Vehicle Damage Handler activated";

_ai_veh = _this select 0;
_ai_veh_hitsource = _this select 1;

_ai_veh_type = typeof _ai_veh;
_ai_veh_name = name _ai_veh;
_ai_veh_side = side _ai_veh;
_ai_veh_group_side = side (group _ai_veh);

_ai_veh_hitsource_type = typeof _ai_veh_hitsource;
_ai_veh_hitsource_name = name _ai_veh_hitsource;
_ai_veh_hitsource_side = side _ai_veh_hitsource;
_ai_veh_hitsource_group_side = side (group _ai_veh_hitsource);

if (blck_DebugON) then {
    diag_log format["SAR_HITKILL_DEBUG: AI vehicle hit - Type: %1 Name: %2 Side: %3 Group Side: %4",_ai_veh_type,_ai_veh_name, _ai_veh_side,_ai_veh_group_side];
    diag_log format["SAR_HITKILL_DEBUG: AI vehicle attacker - Type: %1 Name: %2 Side: %3 Group Side: %4",_ai_veh_hitsource_type,_ai_veh_hitsource_name, _ai_veh_hitsource_side,_ai_veh_hitsource_group_side];
};

if(isPlayer _ai_veh_hitsource) then {
    
     (gunner _ai_veh) doTarget _ai_veh_hitsource;
     (gunner _ai_veh) doFire _ai_veh_hitsource;
	 //  https://community.bistudio.com/wiki/atan2
	_xy = _ai_veh worldToModel getPosASL _ai_veh_hitsource;
	_dir = (_xy select 0) atan2 (_xy select 1); //_dir range from -180 to +180 
	if (_dir < 0) then {_dir = 360 + _dir}; //_dir range from 0 to 360
	_pos = getPos _ai_veh;
	_dist = 50;
	_xpos = (_pos select 0) + sin (_xy) * _dist;
	_ypos = (_pos select 1) + cos (_xy) * _dist;
	_newpos = [_xpos,_ypos,0];
	_grp = _ai_veh getVariable ["Group","Vacant"];
	if (_grp != "Vacant") then
	{
		_wp = _grp addWaypoint _newpos;
		_wp setWaypointType "MOVE";
		_wp setWaypointTimeout [5, 10, 15];
	};	
};
