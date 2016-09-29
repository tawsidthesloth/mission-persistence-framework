#include "..\..\..\script_macros.hpp"
enableSaving [false, false];

sleep 1;

if (isServer) then {
	["MPF", "SQL_CUSTOM", "MPF.ini"] spawn DB_fnc_ExtDBinit;
	sleep 3;
  if(MPF_SETTINGS(getNumber,"player_track")==1) then {
    [] call MPFS_fnc_handleDisconnectPlayer;
    [] spawn MPFS_fnc_saveLoopPlayer;
		[] call MPFS_fnc_saveStorage;
  }else{
    [] call MPFS_fnc_handleDisconnectSlot;
    [] spawn MPFS_fnc_saveLoopSlot;
		[] call MPFS_fnc_initStorage;
		[] spawn MPFS_fnc_saveLoopStorage;
  };

} else {
	waitUntil {!isNull player && player == player};
	cutText ["Loading in...","BLACK",1];
  waitUntil {!isNil "MPF_server_isReady"};
	sleep 5;
	if(MPF_SETTINGS(getNumber,"player_track")==1) then {
    [player] remoteExecCall ["MPFS_fnc_initPlayer", 2];
  }else{
    [player] remoteExecCall ["MPFS_fnc_initSlot", 2];
  };

	sleep 3;

	cutText ["","plain",1];
};
