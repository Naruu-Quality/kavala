#include "..\..\script_macros.hpp"
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if(EQUAL((lbCurSel 3101),-1)) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(!(EQUAL(_x,-1))) then {
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_KavaCash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
life_KavaCash = life_KavaCash - _price;
[] call life_fnc_hudUpdate;
[0] call SOCK_fnc_updatePartial;
life_clothesPurchased = true;
[] call life_fnc_playerSkins;
closeDialog 0;