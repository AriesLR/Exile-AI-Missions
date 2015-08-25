/*
For the AI Mission Compiled by blckeagls @ Zombieville.net
by Ghostrider-DBD
This file contains most constants that define mission parameters, AI behavior and loot for mission system.
Last modified 8/1/15
*/
	/**************************************************************
	
	BLACKLIST LOCATIONS
	
	**************************************************************/
	// if true then missions will not spawn within 1000 m of spawn points for Altis, Bornholm, Cherno, Esseker or stratis. 
	blck_blacklistSpawns = true;
	// list of locations that are protected against mission spawns	
	blck_locationBlackList = [
	//Add location as [xpos,ypos,0],minimumDistance],
	// Note that there should not be a comma after the last item in this table
		[[0,0,0],0]
	];
	
	/***********************************************************
	
	GENERAL MISSION SYSTEM CONFIGURATION
	
	***********************************************************/
	
	// MISSION MARKER CONFIGURATION
	// blck_labelMapMarkers: Determines if when the mission composition provides text labels, map markers with have a text label indicating the mission type
	//When set to true,"arrow", text will be to the right of an arrow below the mission marker. 
	// When set to true,"dot", ext will be to the right of a black dot at the center the mission marker. 
	blck_labelMapMarkers = [true,"dot"];  
	blck_preciseMapMarkers = true;  // Map markers are/are not centered at the loot crate
	
	// Options to spawn a smoking wreck near the mission.  When the first parameter is true, a wreck or junk pile will be spawned. 
	// It's position can be either "center" or "random".  smoking wreck will be spawned at a random location between 15 and 50 m from the mission.
	blck_SmokeAtMissions = [true,"random"];  // set to [false,"anything here"] to disable this function altogether. 
	blck_useSignalEnd = true; // When true a smoke grenade will appear at the loot crate for 2 min after mission completion.
	
	// PLAYER PENALTIES
	blck_RunGear = true;	// When set to true, AI that have been run over will ve stripped of gear, and the vehicle will be given blck_RunGearDamage of damage.
	blck_RunGearDamage = 0.2; // Damage applied to player vehicle for each AI run over
	blck_VK_Gear = true; // When set to true, AI that have been killed by a player in a vehicle in the list of forbidden vehicles or using a forbiden gun will be stripped of gear and the vehicle will be given blck_RunGearDamage of damage
	blck_VK_RunoverDamage = true; // when the AI was run over blck_RunGearDamage of damage will be applied to the killer's vehicle.
	blck_VK_GunnerDamage = true; // when the AI was killed by a gunner on a vehicle that is is in the list of forbidden vehicles, blck_RunGearDamage of damage will be applied to the killer's vehicle each time an AI is killed with a vehicle's gun.
	blck_forbidenVehicles = ["B_MRAP_01_hmg_F","O_MRAP_02_hmg_F"]; // Add any vehicles for which you wish to forbid vehicle kills	
	// For a listing of the guns mounted on various land vehicles see the following link: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Vehicle_Weapons
	// HMG_M2 is mounted on the armed offroad that is spawned by Epoch	
	blck_forbidenVehicleGuns = ["LMG_RCWS","LMG_M200","HMG_127","HMG_127_APC",/*"HMG_M2",*/"HMG_NSVT","GMG_40mm","GMG_UGV_40mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","autocannon_35mm","LMG_coax","autocannon_30mm"]; // Add any vehicles for which you wish to forbid vehicle kills, o
	
	// GLOBAL MISSION PARAMETERS
	blck_useMines = false;   // when true mines are spawned around the mission area. these are cleaned up when a player reaches the crate.
	blck_useVehiclePatrols = true; // When true vehicles will be spawned at missions and will patrol the mission area.
	blck_killEmptyAIVehicles = true; // when true, the AI vehicle will be extensively damaged once all AI have gotten out.
	blck_AIPatrolVehicles = ["I_G_Offroad_01_armed_F"]; // Type of vehicle spawned to defend AI bases

	// AI VEHICLE PATROL PARAMETERS
	//Defines how many AI Vehicles to spawn. Set this to -1 to disable spawning of static weapons or vehicles. To discourage players runniing with with vehicles, spawn more B_GMG_01_high
	blck_SpawnVeh_Major = 3; // Number of static weapons at Orange Missions
	blck_SpawnVeh_Major2 = 2; // Number of static weapons at Green Missions
	blck_SpawnVeh_Minor = -1;  // Number of static weapons at Blue Missions
	blck_SpawnVeh_Minor2 = -1;  // Number of static weapons at Red Missions

	// AI STATIC WEAPON PARAMETERS
	blck_useStatic = true;  // When true, AI will man static weapons spawned 20-30 meters from the mission center. These are very effective against most vehicles
	blck_staticWeapons = ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];  // [0.50 cal, grenade launcher, AT Launcher]

	// Defines how many static weapons to spawn. Set this to -1 to disable spawning 
	blck_SpawnEmplaced_Major = 3; // Number of static weapons at Orange Missions
	blck_SpawnEmplaced_Major2 = 2; // Number of static weapons at Green Missions
	blck_SpawnEmplaced_Minor = -1;  // Number of static weapons at Blue Missions
	blck_SpawnEmplaced_Minor2 = 2;  // Number of static weapons at Red Missions	

	// MISSION TIMERS
	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	blck_TMin_Major = 250;
	blck_TMin_Major2 = 200;
	blck_TMin_Minor = 120;
	blck_TMin_Minor2 = 150;
	
	//Maximum Spawn time between missions in seconds
	blck_TMax_Major = 360;
	blck_TMax_Major2 = 300;
	blck_TMax_Minor = 200;
	blck_TMax_Minor2 = 250;

	/****************************************************************
	
	GENERAL AI SETTINGS
	
	****************************************************************/
	blck_useNVG = true; // When true, AI will be spawned with NVG if is dark
	blck_useLaunchers = true;  // When true, some AI will be spawned with RPGs; they do not however fire on vehicles for some reason so I recommend this be set to false for now
	//blck_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	blck_launcherTypes = ["launch_RPG32_F"];
	blck_backpack = ["B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr" ];  
	blck_launchersPerGroup = 1;  // Defines the number of AI per group spawned with a launcher
	blck_launcherCleanup = true;// When true, launchers and launcher ammo are removed from dead AI.
	blck_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	blck_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"
	//This defines how long after an AI dies that it's body disappears.
	blck_bodyCleanUpTimer = 1200; // time in seconds after which dead AI bodies are deleted
	// Each time an AI is killed, the location of the killer will be revealed to all AI within this range of the killed AI, set to -1 to disable
	// values are ordered as follows [blue, red, green, orange];
	blck_AIAlertDistance = [150,225,250,300];
	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];
	blck_AIIntelligence = [0.5, 1, 2, 4];  

	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// Orange Missions
	blck_MinAI_Major = 20;
	blck_MaxAI_Major = 25;
	blck_AIGrps_Major = 5;
	blck_SkillsOrange = [
		["aimingAccuracy",0.15],["aimingShake",0.3],["aimingSpeed",0.5],["endurance",1.00],["spotDistance",0.7],["spotTime",0.7],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]
	];
	
	// Green Missions
	blck_MinAI_Major2 = 16;
	blck_MaxAI_Major2 = 21;
	blck_AIGrps_Major2 = 4;
	blck_SkillsGreen = [
		["aimingAccuracy",0.1],["aimingShake",0.3],["aimingSpeed",0.4],["endurance",0.9],["spotDistance",0.6],["spotTime",0.6],["courage",85],["reloadSpeed",0.75],["commanding",0.9],["general",0.75]
	];
	
	// Red Missions
	blck_MinAI_Minor2 = 12;
	blck_MaxAI_Minor2 = 15;
	blck_AIGrps_Minor2 = 3;
	blck_SkillsRed = [
		["aimingAccuracy",0.08],["aimingShake",0.1],["aimingSpeed",0.3],["endurance",0.60],["spotDistance",0.4],["spotTime",0.4],["courage",0.70],["reloadSpeed",0.70],["commanding",0.8],["general",0.70]
	];
	
	// Blue Missions
	blck_MinAI_Minor = 8;	
	blck_MaxAI_Minor = 12;
	blck_AIGrps_Minor = 2;
	blck_SkillsBlue = [
		["aimingAccuracy",0.06],["aimingShake",0.1],["aimingSpeed",0.20],["endurance",0.50],["spotDistance",0.30],["spotTime",0.30],["courage",0.60],["reloadSpeed",0.60],["commanding",0.7],["general",0.60]
	];
	
/*********************************************************************************

AI WEAPONS, UNIFORMS, VESTS AND GEAR

**********************************************************************************/
		_RifleSniper = [ 
			"srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_01_F"		
		];

		_RifleAssault = [
			"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F",
			"arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F",
			"arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","arifle_MX_SW_F","arifle_MX_SW_Black_F"
		];

		_RifleLMG = [
			"LMG_Mk200_F","LMG_Zafir_F"
		];

		_RifleOther = [
			"SMG_01_F","SMG_02_F"
		];

		_Pistols = [
			"hgun_PDW2000_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch","hgun_Pistol_Signal_F"
		];	
		
		_DLC_MMG = [
			"MMG_01_hex_F","MMG_02_sand_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F"
		];
		
		_DLC_Sniper = [
			"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"
		];
		
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	blck_WeaponList_Orange = _RifleSniper + _RifleAssault + _RifleLMG + _DLC_Sniper + _DLC_MMG;
	blck_WeaponList_Green = _RifleSniper + 	_RifleAssault +_RifleLMG + _DLC_MMG;
	blck_WeaponList_Blue = _RifleOther + _RifleAssault +_RifleLMG;
	blck_WeaponList_Red = _RifleOther + _RifleSniper + 	_RifleAssault + _RifleLMG;
		
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	blck_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
				"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest",
				"U_B_GhillieSuit","U_B_SpecopsUniform_sgg","U_O_CombatUniform_oucamo",
				"U_O_SpecopsUniform_ocamo","U_O_OfficerUniform_ocamo","U_IG_Guerilla2_3"
			];

	blck_vests = [
				// DLC Vests
				"V_PlateCarrierIA2_dgtl","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"
			];

/***************************************************************************************
DEFAULT CONTENTS OF LOOT CRATES FOR EACH MISSION
Note however that these configurations can be used in any way you like or replaced with mission-specific customized loot arrays
for examples of how you can do this see \Major\Compositions.sqf
***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	blck_lootCountsMajor = [8,24,8,12,12,1];   // Orange
	blck_lootCountsMajor2 = [7,16,6,10,10,1]; // Green
	blck_lootCountsMinor2 = [5,12,4,6,6,1];  // Red	
	blck_lootCountsMinor = [4,10,3,6,6,1];   // Blue
	
	blck_BoxLoot_Major = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],								
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Rangefinder",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2]
			]
	];		
		
	blck_BoxesLoot_Major2 = 
		[  
			[// Weapons	
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],								
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Rangefinder",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2]
			]
	];
		
	blck_BoxesLoot_Minor = 
				[  
			[// Weapons	
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],								
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Rangefinder",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2]
			]
	];
	
	blck_BoxesLoot_Minor2 = 
				[  
			[// Weapons	
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],								
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Rangefinder",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2]
			]
	];


	// Time the marker remains after completing the mission in seconds - experimental not yet implemented

	blck_crateTypes = ["Box_NATO_Wps_F"];  // Default crate type.
	
	//diag_log "[blckeagls] Configurations Loaded";

	true;