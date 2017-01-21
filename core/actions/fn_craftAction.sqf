#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private ["_dialog", "_item", "_allMaterial", "_itemFilter", "_weight", "_matsNeed", "_config", "_invSize", "_itemNbr", "_itemInfo", "_itemName", "_ui", "_progress", "_pgText", "_cP", "_itemVar"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {[localize "STR_ISTR_SelectItemFirst"] spawn life_fnc_notifKava;};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_weight = 0;
_matsNeed = 0;
_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == (_x select 0))exitWith
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		{
			_itemNbr = ITEM_VALUE(_x select 0);
			if(_itemNbr < (_x select 1)) exitWith {_allMaterial = false;};

		}foreach _matsNeed;
	};
} foreach (_config);

if(!_allMaterial) exitWith {[localize "STR_PM_NoMaterial"] spawn life_fnc_notifKava;};

//Some checks
if((count _matsNeed) == 0) exitWith {};
if(_itemFilter == "backpack" && backpack player != "") exitWith{[localize "STR_CRAFT_AR_Backpack"] spawn life_fnc_notifKava;};
if(_itemFilter == "uniform" && uniform player != "") exitWith{[localize "STR_CRAFT_AR_Uniform"] spawn life_fnc_notifKava;};
if(_itemFilter in ["weapon","weaponLeg"] && (!(player canAdd _item) && currentWeapon player != "")) exitWith {[localize "STR_NOTF_NoRoom"] spawn life_fnc_notifKava;};

_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_itemName = _itemInfo select 1;;
closeDialog 0;

[] call life_fnc_p_updateMenu;
life_is_processing = true;
_handle = [format["Craft %1",_itemName],true,10,0.01,0.3,""] spawn life_fnc_handleProgressBar;
waitUntil { scriptDone _handle; }; 
if(errorProgress > 0) exitWith {life_action_inUse = false;life_interrupted = false;life_is_processing=false;}; 

{
	_itemNbr = ITEM_VALUE(_x select 0);
	if(_itemNbr < SEL(_x,1)) exitWith {_allMaterial = false;};
	[false,SEL(_x,0),SEL(_x,1)] call life_fnc_handleInv;
}foreach _matsNeed;
if(!_allMaterial) exitWith {5 cutText ["","PLAIN"]; [localize "STR_PM_NoMaterial"] spawn life_fnc_notifKava; life_is_processing = false;};

if(_itemFilter == "backpack") then{
	if(backpack player == "") then{
		player addBackpack _item;
	}else{
		[localize "STR_CRAFT_AR_Backpack"] spawn life_fnc_notifKava;
		life_is_processing = false;
	};
};
if(_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player addUniform _item;
	}else{
		[localize "STR_CRAFT_AR_Uniform"] spawn life_fnc_notifKava;
		life_is_processing = false;
	};
};
if(_itemFilter in ["weapon","weaponLeg"]) then{

	[format["[CRAFT-WEAPONS] %1(%2) a fabriquer un(e): %3",name player, getPlayerUID player,_item]] remoteExecCall ["A3Log", 2];
	if(player canAdd _item) then{
		player addItem _item;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _item;
		}else{
			{
				_itemNbr = ITEM_VALUE(_x select 0);
				_itemVar = (_x select 1);
				[true,_itemVar,_itemNbr] call life_fnc_handleInv;
			}foreach _matsNeed;
			life_is_processing = false;
		};
	};

};
5 cutText ["","PLAIN"];
[format[localize "STR_CRAFT_Process"]] spawn life_fnc_notifKava;
life_is_processing = false;