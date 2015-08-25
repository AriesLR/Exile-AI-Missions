// Original code by blckeagl
//This script sends Message Information to allplayers
// Last modified 7/18/15 by Ghostrider-DBD-
//diag_log format["====AIM.sqf: _this = %1",_this];
blck_Message = _this;
//diag_log format["AIM.sqf ===]  _this = %1",_this];
{
	(owner _x) publicVariableClient "blck_Message";
} foreach playableUnits;


