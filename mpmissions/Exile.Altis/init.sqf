execVM "blckClient.sqf";

if (isServer) then {
	[] execVM "\q\addons\custom_server\init.sqf";
};