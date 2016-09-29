params ["_array"];
_return=_array;

{
  _class = (_x select 0);
  _loc = (_x select 2);
  _gear= (_x select 1);
  {
    _items = getItemCargo _x;
    _mags=getMagazineCargo _x;
    _weps=getWeaponCargo _x;
    _backs=getBackpackCargo _x;
    _gearr=[_items,_mags,_weps,_backs];

    if(_class == (typeOf _x) && _gear==_gearr && _loc == position _x) then {
       deleteVehicle _x;
    };

  } forEach (entities "ReammoBox_F");
} forEach _array;
