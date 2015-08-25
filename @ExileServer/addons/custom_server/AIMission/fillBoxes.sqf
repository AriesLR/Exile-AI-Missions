/*
	for the Mission System by blckeagls
	By Ghostrider-DBD-
	Last Updated 7-16-15
	Fill a crate with items
*/

	private["_crate","_boxLoot","__itemCnts","_wepCnt","_magCnt","_itemCnt","_opticsCnt","_materialsCnt","_a1","_item","_diff","_bkcPckCnt"];

	_crate = _this select 0;
	_boxLoot = _this select 1; // Array of [[weapons],[magazines],[optics],[materials],[items],[backpacks]]	
	_itemCnts = _this select 2; // number of items to load for each of the above [weapons,magazines,optics,materials,items,backpacks]
	//diag_log format["fillBoxes.sqf: _boxLoot = %1", _boxLoot];
	//diag_log format["fillBoxes.sqf: _itemCnts = %1", _itemCnts];
	
	_wepCnt = _itemCnts select 0; // number of types of weapons to load
	_magCnt = _itemCnts select 1; // Number of types of additional, optional magazines to add (this includes building supplies)
	_opticsCnt = _itemCnts select 2; // number of types of optics to be added
	_materialsCnt = _itemCnts select 3;  // Number of cinder, motar etc to be added
	_itemCnt = _itemCnts select 4; // number of items (first aid packs, multigun bits) to load
	_bkcPckCnt = _itemCnts select 5; // Number of backpacks to add
	
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	
	if (_wepCnt > 0) then
	{
		_a1 = _boxLoot select 0; // choose the subarray of weapons and corresponding magazines
		// Add some randomly selected weapons and corresponding magazines
		for "_i" from 1 to _wepCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_crate addWeaponCargoGlobal [_item select 0,1];
			_crate addMagazineCargoGlobal [_item select 1, 1 + round(random(3))];
		};
	};
	if (_magCnt > 0) then
	{	
	// Add Magazines, grenades, and 40mm GL shells
		_a1 = _boxLoot select 1;
		for "_i" from 1 to _magCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_diff = (_item select 2) - (_item select 1);  // Take difference between max and min number of items to load and randomize based on this value
			_crate addMagazineCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];
		};
	};
	if (_opticsCnt > 0) then
	{
		// Add Optics
		_a1 = _boxLoot select 2;
		for "_i" from 1 to _opticsCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_diff = (_item select 2) - (_item select 1); 
			_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
		};
	};
	if (_materialsCnt > 0) then
	{
		// Add materials (cindar, mortar, electrical parts etc)
		_a1 = _boxLoot select 3;
		for "_i" from 1 to _materialsCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_diff = (_item select 2) - (_item select 1); 
			_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
		};
	};
	if (_itemCnt > 0) then
	{
		// Add Items (first aid kits, multitool bits, vehicle repair kits, food and drinks)
		_a1 = _boxLoot select 4;
		for "_i" from 1 to _itemCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_diff = (_item select 2) - (_item select 1); 
			_crate additemCargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];		
		};
	};	
	if (_bkcPckCnt > 0) then
	{
		_a1 = _boxLoot select 5;
		for "_i" from 1 to _bkcPckCnt do {
			_item = _a1 call BIS_fnc_selectRandom;
			_diff = (_item select 2) - (_item select 1); 
			_crate addbackpackcargoGlobal [_item select 0, (_item select 1) + round(random(_diff))];	
		};
	};