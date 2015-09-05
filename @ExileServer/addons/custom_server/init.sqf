/*
AI Mission Compiled by blckeagls @ Zombieville.net
Code was modified by blckeagls using other peoples code.  Been over a year, don't have their names anymore.
Code was modified by Narines fixing several bugs.
Modified by Ghostrider with thanks to ctbcrwker for input, testing, and troubleshooting.
Credits to Vampire, Narines, KiloSwiss, blckeagls, theFUCHS, lazylink, Mark311 who wrote mission systems upon which this one is based and who's code is used with modification in some parts of this addon.

Thanks to cyncrwler for testing and bug fixes.
*/
private ["_version","_versionDate"];
_blck_version = "3.54 branch beef 0.1";
_blck_versionDate = "8-30-2015";

waitUntil{{isPlayer _x}count playableUnits > 0};
sleep 10;

diag_log format["[BLCK] loading version %1 Build %2 ...... >>",_blck_versionDate,_blck_version];
// Load Configuration information

BLCK_directory = "\q\addons\custom_server";
BLCK_LogLevel = 1;
call compile preprocessFileLineNumbers format ["%1\AIMission\AIconfigs.sqf",BLCK_directory];
call compile preprocessFileLineNumbers format ["%1\AIMission\beef_functions.sqf",BLCK_directory];

// Get information about the map
sleep 5;
execVM format ["%1\AIMission\findWorld.sqf",BLCK_directory];
sleep 5;

// Load any user-defined specifications or overrides
execVM format ["%1\AIMission\configOverrides.sqf",BLCK_directory];

// compile functions
call compile preprocessFileLineNumbers format ["%1\AIMission\AIfunctions.sqf",BLCK_directory];
sleep 5;

//Start the mission timers
[] execVM format ["%1\AIMission\Major\majorTimer.sqf",BLCK_directory]; //Starts major mission system (Orange Map Markers)
[] execVM format ["%1\AIMission\Major2\major2Timer.sqf",BLCK_directory];//Starts major mission system 2 (Green Map Markers)
[] execVM format ["%1\AIMission\Minor2\minor2Timer.sqf",BLCK_directory];//Starts minor mission system 2 (Red Map Markers)
[] execVM format ["%1\AIMission\Minor\minorTimer.sqf",BLCK_directory];//Starts minor mission system (Blue Map Markers)

[0,"Initialization completed"] call beef_fncUtil_Log;
sleep 15;

blck_Initialized = true;
publicVariable "blck_Initialized";
//diag_log format["[blckeagls] Mission system settings:blck_debugON = %4 blck_useSmokeAtCrates = %1 blck_useMines = %2 blck_useStatic = %3 blck_useVehiclePatrols %4",blck_useSmokeAtCrates,blck_useMines,blck_useStatic,blck_debugON,blck_useVehiclePatrols];
//diag_log format["[blckeagls] AI Settings: blck_useNVG = %1  blck_useLaunchers = %2",blck_useNVG,blck_useLaunchers];
//diag_log format["[blckeagls] AI Runover and other Vehicle Kill settings: blck_RunGear = %1 blck_VG_Gear =%2 blck_VK_RunoverDamage = %3 blck_VK_GunnerDamage = %4",blck_RunGear,blck_VG_Gear,blck_VK_RunoverDamage,blck_VK_GunnerDamage];

