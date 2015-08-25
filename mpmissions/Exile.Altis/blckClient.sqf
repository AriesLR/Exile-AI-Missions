////////////////////////////////////////////
// Create, delete and change Mission Markers
// Last Updated 8/1/15
// by Ghostrider-DbD-
//////////////////////////////////////////

blck_MarkerPeristTime = 300;  
blck_useHint = false;
blck_useSystemChat = true;
blck_useTitleText = false;

"blck_Message" addPublicVariableEventHandler {
	private["_event","_msg","_mission"];
	_event = _this select 1 select 0;
	 _message = _this select 1 select 1;	
	_mission = _this select 1 select 2;
	if (blck_useSystemChat) then {systemChat format["%1",_message];};	
	if (blck_useHint) then {
		hint parseText format[
		"<t align='center' size='2.0' color='#f29420'>%1</t><br/>
		<t size='1.25' color='#01DF01'>______________</t><br/><br/>
		<t size='1.25' color='#ffff00'>%2</t><br/>
		<t size='1.25' color='#01DF01'>______________</t><br/><br/>
		<t size='1.25' color='#FFFFFF'>Any loot you find is yours as payment for eliminating the threat!</t>",_mission,_message
		];	
	if (blck_useTitleText) then {titleText [_message, "PLAIN DOWN",5];uiSleep 5; titleText ["", "PLAIN DOWN",5]};
	};
		
	switch (_event) do 
	{
		case "start": {
						playSound "UAV_05";
					};
		case "end": {
						playSound "UAV_03";
					};
	};
};
	
if (!isNil "blck_OrangeMarker") then {[blck_OrangeMarker] execVM "debug\spawnMarker.sqf"};
if (!isNil "blck_GreenMarker") then {[blck_GreenMarker] execVM "debug\spawnMarker.sqf"};
if (!isNil "blck_RedMarker") then {[blck_RedMarker] execVM "debug\spawnMarker.sqf"};
if (!isNil "blck_BlueMarker") then {[blck_BlueMarker] execVM "debug\spawnMarker.sqf"};
