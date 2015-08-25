	
// Place any overrides of the default configurations here.
// An example would be to move the center or change the dimensions for the map on which the missions are spawned so that only part of the map is used.
// Or map-specific configurations if you run the mission system on multiple servers. Our configurations are shown below as an example


diag_log "[blckeagls] Loading Configuration Overides";

if (blck_WorldName == "bornholm") then 
{  // 6022.8906,23.348747,17387.381
	
	blck_locationBlackList = blck_locationBlackList + [[[4274,19753,0], 1500]];  //  
	diag_log "[DBD Clan] --- >>> Loading config overides for Bornholm";
};
if (blck_WorldName == "chernarus") then 
{  // 6022.8906,23.348747,17387.381

	diag_log "[DBD Clan] --- >>> Loading config overides for Chernarus";
};
if (blck_WorldName == "altis") then 
{  // 6022.8906,23.348747,17387.381
	
	blck_locationBlackList = blck_locationBlackList + [[[10846,10672,12.8],300]];  //  
	
	diag_log "[DBD Clan] --- >>> Loading config overides for Altis";
};
//================================ ESSEKER ==============================
if (blck_WorldName == "Esseker") then 
{ // 6022.8906,23.348747,17387.381

	blck_locationBlackList = blck_locationBlackList + [[[6802,0,5187],300],[[10134,0.1,7979],300],[[4014,0,9223],300]]; //
	diag_log "[DBD Clan] --- >>> Loading config overides for Esseker";
};
//================================ ESSEKER ==============================
if (blck_debugON) then 
{
	diag_log "[blckeagls] Debug seting is ON, Custom configurations used";
	
	blck_cleanupCompositionTimer = 5;  // Time after mission completion at which items in the composition are deleted.
	blck_AICleanUpTimer = 10;  // Time after mission completion at which any remaining live AI are deleted.
	blck_bodyCleanUpTimer = 15;
	blck_SpawnEmplaced_Major = 1; // Number of static weapons at Orange Missions
	blck_SpawnEmplaced_Major2 = 1; // Number of static weapons at Green Missions
	blck_SpawnEmplaced_Minor = 1;  // Number of static weapons at Blue Missions
	blck_SpawnEmplaced_Minor2 = 1; 
	blck_SpawnVeh_Major = 1; // Number of static weapons at Orange Missions
	blck_SpawnVeh_Major2 = 1; // Number of static weapons at Green Missions
	blck_SpawnVeh_Minor = 1;  // Number of static weapons at Blue Missions
	blck_SpawnVeh_Minor2 = 1;
	
	blck_TMin_Major = 5;
	blck_TMin_Major2 = 6;
	blck_TMin_Minor = 7;
	blck_TMin_Minor2 = 8;
	 	
	//Maximum Spawn time between missions in seconds
	blck_TMax_Major = 10;
	blck_TMax_Major2 = 11;
	blck_TMax_Minor = 12;
	blck_TMax_Minor2 = 13;

	blck_SkillsBlue = [
		["aimingAccuracy",0.01],
		["aimingShake",0.01],
		["aimingSpeed",0.01],
		["endurance",0.01],
		["spotDistance",0.01],
		["spotTime",0.01],
		["courage",0.01],
		["reloadSpeed",0.80],
		["commanding",0.8],
		["general",1.00]
	];
};



