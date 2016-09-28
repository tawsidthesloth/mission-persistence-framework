/*
Author: Kerkkoh
First Edit: 23.11.2015
*/
params ["_gear", "_position", "_playerNumber"];

player setPos _position;

player setUnitLoadout _gear;

player setVariable ["loadedIn", true, true];
player setVariable ["playerNumber", _playerNumber, true];
