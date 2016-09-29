/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

params ["_player", "_id", "_uid", "_name"];

_slotNumber = _player getVariable "slotNumber";

_gear = getUnitLoadout _player;
_position = position _player;
_lastName = name _player;
_updatestr = format ["updateSlotInfo:%1:%2:%3:%4", _gear, _position, _lastName,_slotNumber];
_update = [0, _updatestr] call DB_fnc_ExtDBquery;
