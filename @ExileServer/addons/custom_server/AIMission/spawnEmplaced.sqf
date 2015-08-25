// Spawns anemplaced weapons, man's it, and destroys it when the AI gets out.
// by Ghostrider-DBD-
// Last Updated 7/30/15

private["_pos","_emplaced","_emplacedTypes","_aiGroup","_safepos","_ai","_ai1","_slot","_vehSE","_i","_noEmplaced","_minDist","_maxDist","_level","_objSE","_unitsSE","_gunner","_dist","_dir","_arc","_xpos","_ypos","_newpos"];

_pos = _this select 0;
_noEmplaced = [_this,1,-1] call BIS_fnc_param;
_emplacedTypes = _this select 2;
_minDist = [_this,3,30] call BIS_fnc_param; 
_maxDist = [_this,4,45] call BIS_fnc_param; 
_level = [_this,5,"red"] call BIS_fnc_param;  

if (_noEmplaced <= 0) exitWith {};

_unitsSE = [];
_dir = round(random(360));
_arc = 360/_noEmplaced;
//diag_log format["spawnEmplaced.sqf: arc is %1 and _dir is %2",_arc,_dir];
for "_i" from 1 to _noEmplaced do
{
	// spread out the spawn points for the static weapons
	_dir = _dir + _arc;
	//diag_log format["spawnEmplaced: _dir is %1 for cycle %2",_dir,_i];
	_dist = round(_minDist + (random(_maxDist - _minDist)));
	_xpos = (_pos select 0) + sin (_dir) * _dist;
	_ypos = (_pos select 1) + cos (_dir) * _dist;
	_newpos = [_xpos,_ypos,0];	
	
	_safepos = [_pos,_minDist,_maxDist,0,0,20,0] call BIS_fnc_findSafePos;
	_emplaced = _emplacedTypes call BIS_fnc_selectRandom;
	_vehSE = createVehicle[_emplaced, _safepos, [], 0, "NONE"];
	_vehSE setVariable["LAST_CHECK",14400];
	_vehSE call EPOCH_server_setVToken;
	clearWeaponCargoGlobal    _vehSE;
	clearMagazineCargoGlobal  _vehSE;
	clearBackpackCargoGlobal  _vehSE;
	clearItemCargoGlobal      _vehSE;
	_vehSE addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
	_vehSE addEventHandler ["GetIn",{(_this select 0) setDamage 1;}];
	_vehSE setVehicleLock "LOCKEDPLAYER";

	_aiGroup = [_safepos,1,1,"orange",_pos,_minDist,_maxDist] call blck_spawnGroup;
	_unitsSE = _unitsSE + _aiGroup;
	_gunner = _aiGroup select 0;
	_gunner moveingunner _vehSE;
	_vehSE setVariable ["Gunner", gunner _vehSE, true];
	
	[_vehSE] spawn blck_vehicleMonitor;	
	//diag_log format["spawnEmplaced.sqf: Emplaced weapon %1 spawned",_i];
};

_unitsSE
