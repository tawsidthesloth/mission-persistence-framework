/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

for "_i" from 0 to 1 step 0 do {
	sleep 300;
	{
		_uid = getPlayerUID _x;

		_checkstr = format ["existPlayerInfo:%1", _uid];
		_check = [_checkstr,1] call DB_fnc_ExtDBasync;
		_booli = (_check select 0) select 0;

		_loadedIn = _x getVariable "loadedIn";

		if (!(isNil {_x}) && alive _x && _booli && _loadedIn) then {
			_gear = getUnitLoadout _x;
			_position = position _x;
			_playerNumber = _x getVariable "playerNumber";

			_updatestr = format ["updatePlayerInfo:%1:%2:%3", _gear, _position, _uid];
			_update = [_updatestr,1] call DB_fnc_ExtDBasync;
		};
	}forEach allPlayers;
};
