/*
Author: Kerkkoh
First Edit: 22.4.2016
*/

params ["_class"];

_return = getText(configFile >> "CfgMagazines" >> _class >> "displayName");

_return