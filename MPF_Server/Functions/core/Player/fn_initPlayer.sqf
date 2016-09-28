/*
Author: Kerkkoh
Last Edit: 23.11.2015
*/
_player = _this select 0;

_uid = getPlayerUID _player;

_checkstr = format ["existPlayerInfo:%1", _uid];
_check = [0, _checkstr] call DB_fnc_ExtDBquery;
_booli = (_check select 0) select 0;

if (_booli) then {
	_fetchstr = format ["playerInfo:%1", _uid];
	_fetch = [_fetchstr, 2] call DB_fnc_ExtDBasync;
	_returned = str _fetch;
	_res = _fetch select 0;

	_gear = _res select 0;
	_position = _res select 1;
	_playerNumber = _res select 2;

	_player setVariable ["playerNumber", _playerNumber, true];

	[_gear, _position, _playerNumber] remoteExecCall ["MPFC_fnc_loadInventory", _player];
} else {
	_name = name _player;
	_gear = getUnitLoadout _player;
	_position = position _player;

	_insertstr = format ["insertPlayerInfo:%1:%2:%3:%4", _uid, _name, _gear, _position];
	_insert = [0, _insertstr] call DB_fnc_ExtDBquery;

	sleep 3;

	[_player] spawn MPFS_fnc_initPlayer;
}
