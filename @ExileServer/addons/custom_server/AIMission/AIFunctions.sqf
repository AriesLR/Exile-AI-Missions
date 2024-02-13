/*
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	Last modified 8/1/15

	==============================================================================================================================================

*/
// Set to true to activate Debug settings - these are limited at the present time.
blck_debugON = false;


// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Do NOT edit variables below this line.
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
blck_removeGear = compile preprocessFileLineNumbers format ["%1\AIMission\removeGear.sqf",BLCK_directory]; // Strip an AI unit of all gear.
blck_spawnAI = compile preprocessFileLineNumbers format ["%1\AIMission\spawnUnit.sqf",BLCK_directory]; // spawn individual AI
blck_EH_AIKilled = format ["%1\AIMission\AIKilled.sqf",BLCK_directory];  // Event handler to process AI deaths
blck_spawnGroup = compile preprocessFileLineNumbers format ["%1\AIMission\spawnGroup.sqf",BLCK_directory];  // Spawn a single group and populate it with AI units]
blck_setupWaypoints = compile preprocessFileLineNumbers format ["%1\AIMission\setWaypoints.sqf",BLCK_directory];  // Set default waypoints for a group
blck_spawnGroups = compile preprocessFileLineNumbers format ["%1\AIMission\spawnGroups.sqf",BLCK_directory];  //  Call spawnGroup multiple times using specific parameters for group positioning
blck_spawnEmplacedWeapon = compile preprocessFileLineNumbers format ["%1\AIMission\spawnEmplaced.sqf",BLCK_directory];  // Self-evident
blck_spawnVehicle = compile preprocessFileLineNumbers format ["%1\AIMission\spawnVehicle.sqf",BLCK_directory];            //  Spawn a temporary vehicle of a specified type at a specific position
blck_spawnVehiclePatrols = compile preprocessFileLineNumbers format ["%1\AIMission\spawnVehiclePatrols.sqf",BLCK_directory];  // Spawn an AI vehicle control and have it patrol the mission perimeter
blck_MessagePlayers = compile preprocessFileLineNumbers format ["%1\AIMission\AIM.sqf",BLCK_directory];  // Send messages to players regarding Missions
blck_vehicleMonitor = compile preprocessFileLineNumbers format ["%1\AIMission\vehicleMonitor.sqf",BLCK_directory];  // Process events wherein all AI in a vehicle are killed

blck_spawnMissionVehicles = compile preprocessFileLineNumbers format ["%1\AIMission\spawnMissionVehicles.sqf",BLCK_directory];  // Spawn non-AI vehicles at missions; these will be filled with loot following the parameters in the composition array for the mission
blck_spawnCrate = compile preprocessFileLineNumbers format ["%1\AIMission\spawnCrate.sqf",BLCK_directory]; // Simply spawns a crate of a specified type at a specific position.
blck_spawnMissionCrates = compile preprocessFileLineNumbers format ["%1\AIMission\spawnMissionCrates.sqf",BLCK_directory];  // Spawn loot crates at specific positions relative to the mission center; these will be filled with loot following the parameters in the composition array for the mission

blck_cleanupObjects = compile preprocessFileLineNumbers format ["%1\AIMission\cleanUpObjects.sqf",BLCK_directory];
blck_spawnCompositionObjects = compile preprocessFileLineNumbers format ["%1\AIMission\otl7_Mapper.sqf",BLCK_directory];
blck_fillBoxes = compile preprocessFileLineNumbers format ["%1\AIMission\fillBoxes.sqf",BLCK_directory]; // Adds items to an object according to passed parameters. See the script for details.
blck_smokeAtCrates = compile preprocessFileLineNumbers format ["%1\AIMission\smokeAtCrates.sqf",BLCK_directory]; // Spawns a wreck and adds smoke to it
blck_spawnMines = compile preprocessFileLineNumbers format ["%1\AIMission\spawnMines.sqf",BLCK_directory];  // Deploys mines at random locations around the mission center
blck_clearMines = compile preprocessFileLineNumbers format ["%1\AIMission\clearMines.sqf",BLCK_directory]; // clears mines in an array passed as a parameter
blck_FindSafePosn = compile preprocessFileLineNumbers format ["%1\AIMission\findSafePosn.sqf",BLCK_directory];
//blck_playerGetInAIVehicle = compile preprocessFileLineNumbers format ["%1\AIMission\decomissionAIVehicle.sqf",BLCK_directory];
blck_EH_vehicleHit = compile preprocessFileLineNumbers format ["%1\AIMission\decomissionAIVehicle.sqf",BLCK_directory];  // processes instances in which a vehicle is hit
blck_randomPosition = compile preprocessFileLineNumbers format ["%1\AIMission\randomPosn.sqf",BLCK_directory];// find a randomPosn. see script for details.
blck_playerInRange = compile preprocessFileLineNumbers format ["%1\AIMission\playerInRange.sqf",BLCK_directory];
blck_signalEnd = compile preprocessFileLineNumbers format ["%1\AIMission\signalEnd.sqf",BLCK_directory]; // deploy smoke grenades at loot crates at the end of the mission.

//Minimum distance  between missions
MinDistanceFromMission = 1000;

// Define map marker coordinates
blck_OrangeMarker = ["OrangeMarker",[0,0,0],"",""];  /// Format:["MarkerName",[Marker Position - [0,0,0] when not in use, "Marker Label"];
blck_GreenMarker = ["GreenMarker",[0,0,0],"",""];
blck_RedMarker = ["RedMarker",[0,0,0],"",""];
blck_BlueMarker = ["BlueMarker",[0,0,0],"",""];

//sets Mission Variables
blck_MissionGoMajor = false;
MissionGoMajor2 = false;
MissionGoMinor = false;
MissionGoMinor2 = false;
AllMissionCoords = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]];

// the chopper used to fly in paratroops as reinforcements will be randomly selected from this list
// Experimental
blck_reinforcementHeli = [];

 // Settings for each mission class with regard to paratrooper reinforcements.
 // Parameters are [[No Times Reinforcements called, Min number of paratroopers, Max number of paratroopers, "Skill level of paratroopers"]]
 // Experimental
blck_MissionsParaReinforce = [[0,2,3,"blue"],[1,2,3,"red"],[1,2,5,"green"],[1,3,5,"orange"]];

// Chance that reinforcements will be called when one AI is killed at a mission of a particular class ("blue, red, green, orange")
// Experimental
blck_MissionsParaReinforceChance = 0.1;

// When a random vehicle is to be selected and spawned at a mission it will be randomly chosen from this list
// I recommend that you choose vehicles that can not be sold in order to avoid bloating trader inventories, orange
// setting the trader inventory cleanup time to expiresAIdata = "14000"; to force vehicles to be deleted from inventory roughly every server restart
blck_defaultMissionVehicles = ["I_Truck_02_covered_F","I_Truck_02_transport_F"];

// Arrays for use during cleanup of alive AI at some time after the end of a mission
blck_AIMajor = [];
blck_AIMajor2 = [];
blck_AIMinor = [];
blck_AIMinor2 = [];

blck_cleanupCompositionTimer = 900;  // Time after mission completion at which items in the composition are deleted.
blck_AICleanUpTimer = 600;  // Time after mission completion at which any remaining live AI are deleted.

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
blck_TriggerDistance = 1000;

// wait for a random period within the range defined by _min, _max
blck_waitTimer = {
	// Call as
	//[_minTime, _maxTime] call blck_waitTimer
	// Returns true;
	//can be used in waitUntil {[_minTime, _maxTime] call blck_waitTimer};
	private["_min","_max","_wait","_Tstart"];
	_min = _this select 0;
	_max = _this select 1;
	_wait = round(_min + (_max - _min));
	_Tstart = diag_tickTime;
	 waitUntil{sleep 5;(diag_tickTime - _Tstart) > _wait;};
	true
};

// Delete any alive AI associated with a completed mission.
// one passes an array of units
blck_AICleanup = {
	private ["_ai","_group","_aiGroups","_aiUnits"];

	if (count _this < 1) exitWith {[0,"*ERROR* [blck_AICleanup] no parameters passed"] call beef_fncUtil_Log;};
	_aiUnits = _this select 0;
	sleep blck_AICleanUpTimer;
	if (count _aiUnits >= 1) then {
		{
			[2,format ["[blck_AICleanup] Group of unit to be deleted is %1 and its unit count is %2", group _x, count units group _x]] call beef_fncUtil_Log;
			deleteVehicle _x;
		} forEach _aiUnits;
	};
};

// Self explanatory
blck_setSkill = {
	// [_group, _skill] call blck_setSkill;
	private ["_unit","_skillsArrray"];

	_unit = _this select 0;
	_skillsArrray = _this select 1;

	{
		_unit setSkill [(_x select 0),(_x select 1)];
	} forEach _skillsArrray;
};

//diag_log "[blckeagls] Functions Loaded";
