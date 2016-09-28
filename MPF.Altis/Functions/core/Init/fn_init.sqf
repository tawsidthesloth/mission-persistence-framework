#include "..\..\..\script_macros.hpp"
enableSaving [false, false];

sleep 1;

if (isServer) then {
	["MPF", "SQL_CUSTOM", "MPF.ini"] spawn DB_fnc_ExtDBinit;
	sleep 3;
  if(MPF_SETTINGS(getNumber,"player_track")==1) then {
    [] call MPFS_fnc_handleDisconnectPlayer;
    [] spawn MPFS_fnc_saveLoopPlayer;
  }else{
    [] call MPFS_fnc_handleDisconnectPlayer;
    [] spawn MPFS_fnc_saveLoopPlayer;
  };

} else {
	waitUntil {!isNull player && player == player};
	cutText ["Loading in...","BLACK",1];
  waitUntil {!isNil "MPF_server_isReady"};
	sleep 5;
	[player] remoteExecCall ["MPFS_fnc_initPlayer", 2];
	sleep 3;

	cutText ["","plain",1];
};
