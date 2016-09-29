_delstr = format ["storageDelete"];
_del = [0, _delstr] call DB_fnc_ExtDBquery;
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
	_insert = [0, _insertstr] call DB_fnc_ExtDBquery;
  diag_log _insert;
} forEach (entities "ReammoBox_F");
