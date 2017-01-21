#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private ["_price", "_item", "_itemInfo", "_bad"];
if((lbCurSel 38403) == -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
closeDialog 0;
_price = lbValue[38403,(lbCurSel 38403)]; 
if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

if(_item in life_weaponsTracking)exitWith
{
	[_item,player,true,_price] remoteExecCall ["TON_fnc_buyWeaponMarket",RSERV];
};