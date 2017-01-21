#include "..\..\script_macros.hpp"
/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private ["_vehicle", "_method"];

if (life_action_inUse) exitwith {};
if(dialog) exitWith {};
if(life_is_processing) exitwith {};
if(vehicle player != player)then
{
	_vehicle = vehicle player;
}else
{
	_vehicle = (nearestObjects [player, ["Car"], 500]) select 0;
};
if(isNull _vehicle)exitWith {hint parseText localize "STR_Vehicle_Notin_Notnear";};
if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {hint parseText localize "STR_Vehicle_Need_Stop";};
if(life_KavaCash < 2500) then
{
	if(life_KavaBank < 3000) exitWith {_method = 0;};
	if(life_inv_cartevisa == 0) exitWith {_method = 1;};
	_method = 3;
}
	else
{
	_method = 2;
};

life_action_inUse = true;
if(_method > 1)then
{
	[localize "STR_Vehicle_Repair_1"] spawn life_fnc_notifKava;
	sleep 15;
	if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {hint parseText localize "STR_Vehicle_Need_Stop";};
	[localize "STR_Vehicle_Repair_2"] spawn life_fnc_notifKava;
	sleep 10;
	if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {hint parseText localize "STR_Vehicle_Need_Stop";};
	[localize "STR_Vehicle_Repair_3"] spawn life_fnc_notifKava;
	sleep 5;
	if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {hint parseText localize "STR_Vehicle_Need_Stop";};
};
if((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {life_action_inUse = false;};
switch (_method) do
{
	case 0: {["Vous n'avez pas 2500€ en cash ou sur votre compte."] spawn life_fnc_notifKava;};
	case 1: {["Vous n'avez pas 2500€ en cash et vous n'avez pas de carte VISA."] spawn life_fnc_notifKava;};
	case 2: {_vehicle setDamage 0; SUB(life_KavaCash,2500); ["Vous avez réparez votre véhicule pour 2500€"] spawn life_fnc_notifKava;};
	case 3: {_vehicle setDamage 0; SUB(life_KavaBank,2500); ["Vous avez réparez votre véhicule pour 2500€"] spawn life_fnc_notifKava;};
};
[] call life_fnc_hudUpdate;
life_action_inUse = false;