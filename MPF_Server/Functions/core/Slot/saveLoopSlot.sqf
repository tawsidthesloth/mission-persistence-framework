/*
Author: Kerkkoh
Last Edit: 26.11.2015
*/

for "_i" from 0 to 1 step 0 do {
	sleep 300;
	{
		_uid = getPlayerUID _x;

    _unit = format ["%1",_x];
    _unitStr = _unit splitString "() :";
    _slotStr = format ["%1%2%3%4", _unitStr select 0, _unitStr select 1,_unitStr select 2,_unitStr select 3]
    _checkstr = format ["existSlotInfo:%1", _slotStr];

		_check = [_checkstr,0] call DB_fnc_ExtDBasync;
		_booli = (_check select 0) select 0;

		_loadedIn = _x getVariable "loadedIn";

		if (!(isNil {_x}) && alive _x && _booli && _loadedIn) then {
			_gear = getUnitLoadout _x;
			_position = position _x;
      _lastName = name _x;
			_slotNumber = _x getVariable "slotNumber";

			_updatestr = format ["updateSlotInfo:%1:%2:%3:%4", _gear, _position, _lastName, _slotNumber];
			_update = [_updatestr, 0] call DB_fnc_ExtDBasync;
		};
	}forEach allPlayers;
};
