/*
AI Mission Compiled by blckeagls @ Zombieville.net
Code was modified by blckeagls using other peoples code.  Been over a year, don't have their names anymore.  
Code was modified by Narines fixing several bugs.
Modified by Ghostrider with thanks to ctbcrwker for input, testing, and troubleshooting.
Credits to Vampire, Narines, KiloSwiss, blckeagls, theFUCHS, lazylink, Mark311 who wrote mission systems upon which this one is based and who's code is used with modification in some parts of this addon.

Thanks to cyncrwler for testing and bug fixes.
*/
private ["_version","_versionDate"];
_blck_version = "3.54";
_blck_versionDate = "8-2-2015";

waitUntil{{isPlayer _x}count playableUnits > 0};
sleep 10; 

diag_log format["[blckeagls] loading version %1 Build %2 ...... >>",_blck_versionDate,_blck_version];
// Load Configuration information

call compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIconfigs.sqf";

// Get information about the map
sleep 5;
execVM "\q\addons\custom_server\AIMission\findWorld.sqf";
sleep 5;

// compile functions
call compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIfunctions.sqf";
sleep 5;

// Load any user-defined specifications or overrides
execVM "\q\addons\custom_server\AIMission\configOverrides.sqf";

//Start the mission timers
[] execVM "\q\addons\custom_server\AIMission\Major\majorTimer.sqf"; //Starts major mission system (Orange Map Markers)
[] execVM "\q\addons\custom_server\AIMission\Major2\major2Timer.sqf";//Starts major mission system 2 (Green Map Markers)
[] execVM "\q\addons\custom_server\AIMission\Minor2\minor2Timer.sqf";//Starts minor mission system 2 (Red Map Markers)
[] execVM "\q\addons\custom_server\AIMission\Minor\minorTimer.sqf";//Starts minor mission system (Blue Map Markers)


diag_log "[blckeagls] >>--- Completed initialization"; 
sleep 15;

blck_Initialized = true;
publicVariable "blck_Initialized";
//diag_log format["[blckeagls] Mission system settings:blck_debugON = %4 blck_useSmokeAtCrates = %1 blck_useMines = %2 blck_useStatic = %3 blck_useVehiclePatrols %4",blck_useSmokeAtCrates,blck_useMines,blck_useStatic,blck_debugON,blck_useVehiclePatrols];
//diag_log format["[blckeagls] AI Settings: blck_useNVG = %1  blck_useLaunchers = %2",blck_useNVG,blck_useLaunchers];
//diag_log format["[blckeagls] AI Runover and other Vehicle Kill settings: blck_RunGear = %1 blck_VG_Gear =%2 blck_VK_RunoverDamage = %3 blck_VK_GunnerDamage = %4",blck_RunGear,blck_VG_Gear,blck_VK_RunoverDamage,blck_VK_GunnerDamage];

