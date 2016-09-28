/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

for "_i" from 0 to 1 step 0 do {
	sleep 300;
	{
		_uid = getPlayerUID _x;

		_checkstr = format ["existPlayerInfo:%1", _uid];
		_check = [0, _checkstr] call DB_fnc_ExtDBquery;
		_booli = (_check select 0) select 0;

		_loadedIn = _x getVariable "loadedIn";

		if (!(isNil {_x}) && alive _x && _booli && _loadedIn) then {
			_gear = getUnitLoadout _x;
			_position = position _x;
			_playerNumber = _x getVariable "playerNumber";

			_updatestr = format ["updatePlayerInfo:%1:%2:%3", _gear, _position, _uid];
			_update = [0, _updatestr] call DB_fnc_ExtDBquery;
		};
	}forEach allPlayers;
};
