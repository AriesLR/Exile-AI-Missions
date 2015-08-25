/*
	Based on code by SARGE
	Modified by Ghostrider
	Updated 1-26-15 -
	Because this is p-ecompiled there is less concern about keeping comments in.
*/
// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.1.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/index.php?threads/sarge-ai-framework-public-release.8391/
//  
// ---------------------------------------------------------------------------------------------------------
//   SAR_aihit.sqf
//   last modified: 1.4.2013
// ---------------------------------------------------------------------------------------------------------
//  Parameters:
//  [ _ai (AI unit that was killed, 
//    _aikiller (unit that killed the AI)  
//   ]

// Modified by Ghostrider
// ------------------------------------------------------------------------------------------------------------


private ["_ai","_aikiller","_aikilled_type","_aikilled_side","_aikilled_group_side","_aikiller_group_side","_aikiller_type","_aikiller_name","_aikiller_side","_humanity"];

_unit = _this select 0;
_aikiller = _this select 1;

_aikilled_type = typeof _unit;
_aikilled_side = side _unit;
_aikilled_group_side = side (group _unit);

_aikiller_type = typeof _aikiller;
_aikiller_name = name _aikiller;
_aikiller_side = side _aikiller;
_aikiller_group_side = side (group _aikiller);

if (blck_debugON && (isServer)) then {
    diag_log format["blck_HITKILL_DEBUG: AI hit - Type: %1 Side: %3 Group Side: %4",_aikilled_type,_aikilled_side,_aikilled_group_side];
    diag_log format["blck_HITKILL_DEBUG: AI attacker - Type: %1 Name: %2 Side: %3 Group Side: %4",_aikiller_type,_aikiller_name, _aikiller_side,_aikiller_group_side];
};

if(isPlayer _aikiller) then {
    
        {
            _x doTarget _aikiller;
            _x doFire _aikiller;
        } foreach units group _unit;
    };