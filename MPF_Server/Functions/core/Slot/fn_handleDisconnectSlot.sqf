/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

addMissionEventHandler ["HandleDisconnect",{ _this call MPFS_fnc_saveSlot; deleteVehicle (_this select 0); }];
