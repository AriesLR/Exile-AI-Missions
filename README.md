# Exile-AI-Missions
blckeagl's AI Missions edited for Exile Mod


How to install:

Step 1: Unpack the Zip file anywhere you would like.

Step 2: Unpack your mission pbo. 

Step 3: Open the folder you just created in Step 1.

Step 4: Copy the debug folder and file called blckClient.sqf from MPMissions into the folder you just created by unpacking your mission pbo in Step 2.

Step 5: Either use the init.sqf provided in MPMissions or add the following to the your init.sqf:

execVM "blckClient.sqf";
if (isServer) then {
	[] ExecVM "\q\addons\custom_server\init.sqf";
};

NOTE: Be sure to add these lines above any code that reads:

 if (isServer) exitWith {};	

Step 6: Repack your mission pbo.

Step 8: Copy custom_server.pbo from @ExileServer\addons into the @ExileServer\addons folder for your server.

Now that you've done this you need to follow the steps below to make AI Attack players.


How to make the AI Attack players:


Step 1: Extract your current “exile_server.pbo”

Step 2: Open the “code” folder and find “ExileServer_object_player_createBambi.sqf”

Step 3a: Find lines 29-48 (in Notepad++)
Step 3b: Locate the following within those lines _bambiPlayer disableAI "TARGET";

Step 4: Under that line paste the following _bambiPlayer addRating -3000;

What this does is sets the player to “ENEMY” which will make all factions attack.
