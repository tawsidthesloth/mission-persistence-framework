/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

addMissionEventHandler ["HandleDisconnect",{ _this call MPFS_fnc_savePlayer; deleteVehicle (_this select 0); }];
