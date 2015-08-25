/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_default","_resupplyCamp","_redCamp","_medicalCamp","_crateLoot"];

	
_default = [
	[
		"A group of Bandits was sighted in a nearby sector! Check the Green marker on your map for the location!",
		"The Sector at the Green Marker is under survivor control!",
		"Bandit Patrol"
	],
	[  // buildings
	],
	[  // loot
		["Box_NATO_Wps_F",[0,0,0],blck_BoxesLoot_Major2,blck_lootCountsMajor2],  // Standard loot crate with standard loadout
		["Land_PaperBox_C_EPOCH",[-5,-5,0],blck_BoxesLoot_Major2,[0,0,0,10,10,3]]  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		//["Land_CargoBox_V1_F",[7, 5.4,0],_crateLoot/*blck_BoxLoot_Major*/,[0,15,7,10,0,0]]	 // Weapons, magazines, optics, nothing else
	],
	[],  // Loot Boxes - select 2
	[],  // vehicles with Loot  - select 3
	[],  // Custom Static Weapons - select 4
	[]  // Custom AI Vehicles - select 5
];



