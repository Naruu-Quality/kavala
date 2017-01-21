#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopSellSelection.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks the weapon & adds the price tag.
*/
private ["_control", "_index", "_priceTag", "_item", "_itemtmp", "_itemArray", "_price", "_stock", "_dispo", "_oldPrice"];
disableSerialization;
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control) exitWith {closeDialog 0;}; //Bad data
if(_index == -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(38400,38404);
_item = CONTROL_DATAI(_control,_index);
_itemArray = M_CONFIG(getArray,"WeaponShops","weaponBuy","items");
_itemtmp = [_item,_itemArray] call TON_fnc_index;
_price = SEL(SEL(_itemArray,_itemtmp),2);
if((_item in life_weaponsTracking) && (playerSide == civilian))then
{
	_stock = 0;
	{
		if(SEL(_x,0) == _item)exitWith {_stock = SEL(_x,1);};
	}foreach life_weaponMarketTrack;
}else
{
	_stock = 20;
};
_dispo = "Courant";
if((_stock >= 0) && (_stock < 3))then{
_oldPrice = _price;
_price=round(_price+(_price/4));
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix Courant: %1$<br/>Prix (Rare +25%2): <t color='#8cff9b'>%3</t></t>",[(_oldPrice)] call life_fnc_numberText,"%",[(_price)] call life_fnc_numberText];
};

if((_stock >= 3) && (_stock < 25))then{
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix Courant: <t color='#8cff9b'>%1$</t></t>",[(_price)] call life_fnc_numberText];

};
if(_stock >= 25)then{
_oldPrice = _price;
_price=round(_price-(_price/100*15));
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Prix Courant: %1$<br/>Prix (Surplus -15%2): %3</t></t>",[(_oldPrice)] call life_fnc_numberText,"%",[(_price)] call life_fnc_numberText];
};
_control lbSetValue[_index,_price];

