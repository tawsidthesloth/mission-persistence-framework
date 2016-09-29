/*
Author: Kerkkoh
Last Edit: 23.11.2015
*/
_player = _this select 0;

_uid = getPlayerUID _player;
_unit = format ["%1",_player];
_unitStr = _unit splitString "() :-";
_slotStr = format ["%1%2%3%4%5", _unitStr select 0, _unitStr select 1,_unitStr select 2,_unitStr select 3,_unitStr select 4];
_checkstr = format ["existSlotInfo:%1", _slotStr];

_check = [0, _checkstr] call DB_fnc_ExtDBquery;
_booli = (_check select 0) select 0;


if (_booli) then {
	_fetchstr = format ["slotInfo:%1", _slotStr];
	_fetch = [_fetchstr, 2] call DB_fnc_ExtDBasync;
	_returned = str _fetch;
	_res = _fetch select 0;

	_gear = _res select 0;
	_position = _res select 1;
	_slotNumber = _res select 2;

	_player setVariable ["slotNumber", _slotNumber, true];

	[_gear, _position, _slotNumber] remoteExecCall ["MPFC_fnc_loadInventory", _player];
} else {
	_name = name _player;
	_gear = getUnitLoadout _player;
	_position = position _player;

	_insertstr = format ["insertSlotInfo:%1:%2:%3:%4", _slotStr, _name, _gear, _position];
	_insert = [0, _insertstr] call DB_fnc_ExtDBquery;
	[_player] spawn MPFS_fnc_initSlot;
}
