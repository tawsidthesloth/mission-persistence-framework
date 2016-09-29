/*
Author: Kerkkoh
Last Edit: 23.11.2015
*/
_player = _this select 0;
diag_log "**********************DEBUG1***************************";
_uid = getPlayerUID _player;
_unit = format ["%1",_player];
diag_log _unit;
_unitStr = _unit splitString "() :-";
diag_log _unitStr;
_slotStr = format ["%1%2%3%4%5", _unitStr select 0, _unitStr select 1,_unitStr select 2,_unitStr select 3,_unitStr select 4];
diag_log _slotStr;
_checkstr = format ["existSlotInfo:%1", _slotStr];
diag_log _checkstr;

_check = [0, _checkstr] call DB_fnc_ExtDBquery;
diag_log _check;
_booli = (_check select 0) select 0;
diag_log _booli;
diag_log "**********************END-DEBUG1***************************";
if (_booli) then {
	diag_log "**********************DEBUG2***************************";
	_fetchstr = format ["slotInfo:%1", _slotStr];
	diag_log _fetchstr;
	_fetch = [_fetchstr, 2] call DB_fnc_ExtDBasync;
	diag_log _fetch;
	_returned = str _fetch;
	diag_log _returned;
	_res = _fetch select 0;
diag_log "**********************END-DEBUG2***************************";
	_gear = _res select 0;
	_position = _res select 1;
	_slotNumber = _res select 2;

	_player setVariable ["slotNumber", _slotNumber, true];

	[_gear, _position, _slotNumber] remoteExecCall ["MPFC_fnc_loadInventory", _player];
} else {
	diag_log "**********************DEBUG3***************************";
	_name = name _player;
	diag_log _name;
	_gear = getUnitLoadout _player;
	diag_log _gear;
	_position = position _player;
diag_log _position;
	_insertstr = format ["insertSlotInfo:%1:%2:%3:%4", _slotStr, _name, _gear, _position];
	diag_log _insertstr;
	_insert = [0, _insertstr] call DB_fnc_ExtDBquery;
diag_log _fetch;
	[_player] spawn MPFS_fnc_initSlot;
	diag_log _player;
	diag_log "**********************END-DEBUG3***************************";
}
