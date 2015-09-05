
beef_fncUtil_Log = {
	private["_log"];
	if ((_this select 0) <= BLCK_LogLevel) then {
		_log = format["[BLCK] %1", (_this select 1)];
		diag_log _log;
	};
};
