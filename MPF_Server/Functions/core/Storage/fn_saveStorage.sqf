_delstr = format ["storageDelete"];
_del = [_delstr,1] call DB_fnc_ExtDBasync;
sleep 1;
{
  _items = getItemCargo _x;
  _mags=getMagazineCargo _x;
  _weps=getWeaponCargo _x;
  _backs=getBackpackCargo _x;
  _gear=[_items,_mags,_weps,_backs];

  sleep 1;
  _insertstr = format ["insertStorageInfo:%1:%2:%3", typeOf _x, _gear, position _x];
  diag_log _insertstr;
	_insert = [_insertstr,1] call DB_fnc_ExtDBasync;
  diag_log _insert;
} forEach (entities "ReammoBox_F");
