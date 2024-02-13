/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_default","_resupplyCamp","_redCamp","_medicalCamp","_crateLoot"];

_crateLoot =
		[
			[// Weapons
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,4]
			],
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies
				["Exile_Item_TreasureMap",1,3]
			],
			[//Items
				["Rangefinder",1,3]
			],
			[ // Backpacks
				["B_Carryall_cbr",1,1],["B_Carryall_khk",1,1],["B_Carryall_mcamo",1,1],["B_Carryall_ocamo",1,1],["B_Carryall_oli",1,1],["B_Carryall_oucamo",1,1]
			]
	];
/* Nested arrays are:
[
	["start message","end message","mission mame(used for map marker)"],
	[objects to spawn provided as output from ObjectGraber],
	[["crateType",[offset from mission center x, y, z],_loot array to use, _array with numbers of each category of loot to add]],
	[vehicles to spawn],
	[no static weapons, [weapon1, weapon2, ...]],
	[No vehicle patrols,[vehicle1, vehicle2, ...]]
]
*/

_default = [ //  Start, end message and map marker
	[  // messages
		"Mafia wants you to eliminate a police patrol in the orange sector. You will be rewarded with respect for each kill and may take their belongings.",
		"The orange sector has been cleared!",
		"Police patrol"
	],
	[  // Map objects

	],

	[],
	[],  // select 3
	[],  // select 4
	[]  // select 5
];

_default2 = [
	[  // Select 0
		"Mafia's calling all stations! Our armoury was raided and we want those pricks at the orange marker dead! Take no prisoners!", // Mission Start message 1 for players
		"The Sector at the Orange Marker is under control!",												// Mission End message for player
		"Police armoury"																								// Map marker label
	],
	[  // Select 1
	// This nested array defines loot crates to be spawned at the mission.
	// for each loot crate the array lists: ["loot box type",[position x,y,z],Loot array from  which to select loot, [weapons,mazazines,optics,materials,items,backpacks]]
	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	 // Weapons, magazines, optics, nothing else

		["Land_Camping_Light_F",[-10.5957,10.332,0.687943],344.243,1,0,[],"","",true,false],
		["Land_Camping_Light_F",[10.5957,10.332,0.687943],344.243,1,0,[],"","",true,false],
		["Land_Camping_Light_F",[-10.5957,-10.332,0.687943],344.243,1,0,[],"","",true,false],
		["Flag_ARMEX_F",[-29.41016,0.13477,-0.0224228],359.992,1,0,[],"","",true,false]  // Something to mark the position of the crate.
																						// using the format output by objectgrabber
																						// https://community.bistudio.com/wiki/Dynamic_Object_Compositions
	],

	[  // Select 2  Customized loot chests
		// format ["chest class name",[offset from mission center x,y,z],loot array, [items from each loot category to add (see below)]]
		// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
		// The idea here was that you could define the position of loot boxes relative to buildings and bunkers so set them in 3D space as you wished.
		["Box_NATO_Wps_F",[0,0,0],_crateLoot,[4,4,3,0,3,1]],  // Standard loot crate with standard loadout
		["Box_NATO_Wps_F",[-5,-5,0],blck_BoxesLoot_Major,[0,8,0,0,0,1]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		["Land_CargoBox_V1_F",[7, 5.4,0],blck_BoxesLoot_Major,[0,15,7,0,0,0]]
	],
	[	 // select 3
		// Note that the relative position of these vehicles could be setup in the Editor then taken from objectgrabber or other output formats.
		["I_Truck_02_covered_F",[-8,-5,0],blck_BoxesLoot_Major,[0,0,0,0,7,1]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		["I_Truck_02_transport_F",[8, 5.4,0],blck_BoxesLoot_Major,[4,10,5,0,0,0]]
	],
	[2,["B_HMG_01_high_F","B_GMG_01_high_F","O_static_AT_F"]],  // Select 4  Spawns 2 Static AI Weapons from the list and mans each with one AI
	[2,["I_G_Offroad_01_armed_F"]]  // Select 5 Spawns 2 AI Vehicle patrols using vehicles randomly selected from the list.

];

_resupplyCamp =
[
	[
		"Mafias intelligence spottet a Police contruction site at the orange marker. Destroy them.",
		"The Police contruction site at the Orange Marker is under control",
		"Police contruction site"
	],
	[
		// spawn some items to give AI cover and make the mission more interesting
		// using the format output by objectgrabber
		// https://community.bistudio.com/wiki/Dynamic_Object_Compositions
		["Land_Cargo_Patrol_V1_F",[-29.41016,0.13477,-0.0224228],359.992,1,0,[],"","",true,false],
		["Land_Cargo_House_V1_F",[29.2988,-0.1,0.150505],54.9965,0,0.848867,[],"","",true,false],
		["CamoNet_INDP_big_F",[-20.4346,15.43164,-0.00395203],54.9965,1,0,[],"","",true,false],
		["Land_BagBunker_Small_F",[-20.4346,15.43164,-0.0138168],119.996,1,0,[],"","",true,false],
		["Land_Unfinished_Building_02_F",[-20.4346,15.43164,-0.00395203],54.9965,1,0,[],"","",true,false],
		["Land_BagBunker_Small_F",[18.4453,-15.791,0.00744629],305.003,1,0,[],"","",true,false],
		["Land_BagBunker_Small_F",[18.3711,15.5703,0.0101624],254.999,1,0,[],"","",true,false],
		["CamoNet_INDP_big_F",[18.3711,15.5703,-0.00395203],54.9965,1,0,[],"","",true,false]
	],
	[
		["Box_NATO_Wps_F",[0,0,0],blck_BoxesLoot_Major,[0,0,0,10,5,0]],  // Standard loot crate with standard loadout
		["Box_NATO_Wps_F",[-5,-5,0],blck_BoxesLoot_Major,[0,0,0,10,10,3]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		["Land_CargoBox_V1_F",[7, 5.4,0],blck_BoxesLoot_Major,[0,0,0,10,5,0]]
	],
	[],  // select 3
	[],  // select 4
	[]  // select 5
];
