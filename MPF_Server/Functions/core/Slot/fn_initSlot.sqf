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

_check = [_checkstr,2] call DB_fnc_ExtDBasync;
diag_log "--------------------hhhhhhhhhhhhhhhh-------------------";
diag_log _check;
_booli = (_check select 0) select 0;
diag_log _booli;

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
	diag_log _insertstr;
	_insert = [_insertstr,1] call DB_fnc_ExtDBasync;
	[_player] spawn MPFS_fnc_initSlot;
};
diag_log "--------------------hhhhhhhhfgdfgdfgdfgdfgdfghhhhhhhh-------------------";
