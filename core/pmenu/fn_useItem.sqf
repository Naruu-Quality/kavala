#include "..\..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(life_is_processing)exitWith {hint "Vous ne pouvez pas faire cela pendant un traitement";};
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["coffee","waterBottle"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	case (_item == "redgull"): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			player setFatigue 0;
			[] spawn {
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				sleep 180;
				player enableFatigue true;
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"organ")): {
		closeDialog 0;
		if(player getVariable ["organ",false])exitWith{hint "Vous n avez pas besoin de ceci pour le moment";};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			player setVariable ["organ",true,true];
		};
	};
	
	case (EQUAL(_item,"atele")): {
		if(!life_isBroken)exitWith {hint parseText "Vous n'avez pas besoin d'atele pour le moment";};
		closeDialog 0;
		hint parseText "Vous êtes entrin de vous soigner...";
		sleep 3;
		if([false,_item,1] call life_fnc_handleInv) then {
			hint parseText "Vous avez soulager votre jambe cassé";
			life_isBroken = false;
		}else
		{
			hint parseText "Vous n'avez plus l'atele sur vous";
		};
	};
	
	case (EQUAL(_item,"transpack")): {
		closeDialog 0;
		hint parseText "Vous êtes entrin de vous transférer...";
		sleep 3;
		if([false,_item,1] call life_fnc_handleInv) then {
			hint parseText "Vous avez recuperer 500Ml de sang";
			life_blood = life_blood + 500;
			if(life_blood > 5000) then {life_blood = 5000;};
		}else
		{
			hint parseText "Vous n'avez plus le pack de transfusions sur vous";
		};
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (EQUAL(_item,"storagesmall")): {
		[false] call life_fnc_storageBox;
	};

	case (EQUAL(_item,"storagebig")): {
		[true] call life_fnc_storageBox;
	};
	
	case (EQUAL(_item,"illegalbox")): {
		[0] call life_fnc_illegalBox;
	};
	
	case (EQUAL(_item,"illegalboxbig")): {
		[1] call life_fnc_illegalBox;
	};
	case (EQUAL(_item,"armoire")): {
		[2] call life_fnc_illegalBox;
	};
	case (EQUAL(_item,"frigo")): {
		[3] call life_fnc_illegalBox;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_activeObj) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};
	
	case (EQUAL(_item,"scalpel")): {
		[] spawn life_fnc_scalpel;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","donuts","tbacon","peach","frite"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				if(life_blood < 5000) then
				{
					life_blood = life_blood + (_val * 2);
				};
				if(life_blood > 5000) then {life_blood = 5000;};
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	default {
		[localize "STR_ISTR_NotUsable"] spawn life_fnc_notifKava;
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
