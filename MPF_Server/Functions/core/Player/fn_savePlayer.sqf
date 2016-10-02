/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

params ["_player", "_id", "_uid", "_name"];

_playerNumber = _player getVariable "playerNumber";

_gear = getUnitLoadout _player;
_position = position _player;

_updatestr = format ["updatePlayerInfo:%1:%2:%3", _gear, _position, _uid];
_update = [_updatestr,1] call DB_fnc_ExtDBasync;
