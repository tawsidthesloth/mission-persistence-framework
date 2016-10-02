//get all storage from DB
//spawnit
//delete all DB

//Save all to DB

_fetchstr = format ["storageInfo"];
_fetch = [_fetchstr, 2] call DB_fnc_ExtDBasync;
[_fetch] call MPFS_fnc_removeDup;
_delstr = format ["storageDelete"];
_del = [_delstr,1] call DB_fnc_ExtDBasync;
diag_log _fetch;
{
  _box = (_x select 0) createVehicle (_x select 2);

  _gear= (_x select 1);
  diag_log _gear;
  _items = _gear select 0;
  _mags = _gear select 1;
  _weapons = _gear select 2;
  _backpacks = _gear select 3;

  for "_i" from 0 to ((count (_items select 0)) - 1) do {
      _box addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
  };
  for "_i" from 0 to ((count (_mags select 0)) - 1) do{
      _box addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
  };
  for "_i" from 0 to ((count (_weapons select 0)) - 1) do{
      _box addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
  };
  for "_i" from 0 to ((count (_backpacks select 0)) - 1) do{
      _box addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
  };
} forEach _fetch;

[] call MPFS_fnc_saveStorage;
//setup loop
