#include "..\..\script_macros.hpp"
// Thanks to 
//	@file Author: Manzarek and AgentRev
// fn_vehHandleDamage.sqf

private["_vehicle", "_selection", "_damage", "_source", "_ammo", "_oldDamage"];
_vehicle = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_ammo = _this select 4;

if (_selection != "?") then
{
	if (_selection == "fuel_hit") exitWith
	{
		_damage = 0; // Block goddamn fuel leak
	};
	_oldDamage = if (_selection == "") then { damage _vehicle } else { _vehicle getHit _selection };

	if (!isNil "_oldDamage") then
	{
		if(_selection select [0,5] == "wheel") then 
		{
			if(isNull _source && _ammo == "") then //COLLISION
			{
				_damage = ((_damage - _oldDamage) * 0.7) + _oldDamage;
			}
			else
			{
				if(_ammo != "") then //BULLET
				{
					 _damage = ((_damage - _oldDamage) * 2) + _oldDamage;
				};
			};
		};
	};
};
[] call life_fnc_hudVehHealthUpdate;
_damage