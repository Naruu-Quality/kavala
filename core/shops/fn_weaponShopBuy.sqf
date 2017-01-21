#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private ["_price", "_item", "_itemInfo", "_shop", "_stock", "_funds", "_reduc","_nbrMeca"];
if((lbCurSel 39503) == -1) exitWith {[localize "STR_Shop_Weapon_NoSelect"] spawn life_fnc_notifKava;};
_price = lbValue[39503,(lbCurSel 39503)]; if(isNil "_price") then {_price = 0;};
_item = lbData[39503,(lbCurSel 39503)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
_nbrMeca = 0;
if((_itemInfo select 6) != "CfgVehicles") then {
	if((_itemInfo select 4) in [4096,131072]) then {
		if(!(player canAdd _item)) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(playerSide == civilian)then
{
	if(_item == "ToolKit") then
	{
		_nbrMeca = {(str _x in life_listMecano) && (alive _x) && (side _x == independent)} count playableUnits;
		if(_nbrMeca > 0) then{_price = round(_price*2);};
	}else
	{
		_stock = 20;
	};
};


if(_shop == "gangShop") then {
	_funds = (group player) getVariable "gang_bank";
	_reduc = 0;
	if(life_gangAreaOwner != 0) then
	{
		_reduc = life_gangAreaOwner*10;
		_price = _price-(round(_price/100*_reduc));
	};
	if(_price > _funds) exitWith {[localize "STR_NOTF_NotEnoughMoney"] spawn life_fnc_notifKava;};
	if((_item in life_weaponsTracking) && (playerside == civilian))exitWith
	{
		closedialog 0;
		if((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay";};
		life_action_delay = time;
		sleep 1;
		[_item,player,false,_price,true] remoteExecCall ["TON_fnc_buyWeaponMarket",RSERV];
	};
	_funds = _funds - _price;
	[format[localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call life_fnc_numberText]] spawn life_fnc_notifKava;
	(group player) setVariable["gang_bank",_funds,true];
	[_item,true] spawn life_fnc_handleItem;
	
	if(life_HC_isActive) then {
		[1,(group player)] remoteExecCall ["HC_fnc_updateGang",HC_Life];
	} else {
		[1,(group player)] remoteExecCall ["TON_fnc_updateGang",RSERV];
	};
	[format["[ACHATOBJETREEL.GANG] %1(%2) -BANK.GANG AVANT: %3 -ITEM: %4 -PRIX: %5 -BANK.GANG APRES: %6",name player, getPlayerUID player,[_funds+_price] call life_fnc_numberText,_item,_price,[_funds] call life_fnc_numberText]] remoteExecCall ["A3Log", 2];
	
} else {
	if(_price > life_KavaCash) exitWith {[localize "STR_NOTF_NotEnoughMoney"] spawn life_fnc_notifKava;};
	if((_item in life_weaponsTracking) && (playerside == civilian))exitWith
	{
		closedialog 0;
		hint parseText "Vérification des stocks...";
		sleep (random 3);
		[_item,player,false,_price] remoteExecCall ["TON_fnc_buyWeaponMarket",RSERV];
	};
	[format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call life_fnc_numberText]] spawn life_fnc_notifKava;
	SUB(life_KavaCash,_price);
	[_item,true] spawn life_fnc_handleItem;
	[format["[ACHATOBJETREEL] %1(%2) -CASH AVANT: %3 -ITEM: %4 -PRIX: %5 -CASH APRES: %6",name player, getPlayerUID player,[life_KavaCash+_price] call life_fnc_numberText,_item,_price,[life_KavaCash] call life_fnc_numberText]] remoteExecCall ["A3Log", 2];
};
[] call life_fnc_saveGear;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;