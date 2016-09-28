/*
Author: Kerkkoh
First Edit: 23.11.2015
*/
enableSaving [false, false];

sleep 1;

if (isServer) then {
	["MPF", "SQL_CUSTOM", "MPF.ini"] spawn DB_fnc_ExtDBinit;
	sleep 3;
	[] call MPFS_fnc_handleDisconnectPlayer;
	[] spawn MPFS_fnc_saveLoopPlayer;

} else {
	waitUntil {sleep 0.1; !(isNil {player}) && player == player && alive player};
	cutText ["Loading in...","BLACK",1];
	sleep 5;
	[player] remoteExecCall ["MPFS_fnc_initPlayer", 2];
	sleep 3;

	cutText ["","plain",1];
};
