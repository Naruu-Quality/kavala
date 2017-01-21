#include "..\..\script_macros.hpp"
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_KavaCash < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];

uiSleep 8;

if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setDamage 0;
life_isBleeding = false;
life_isBroken = false;
life_blood = 5000;
SUB(life_KavaCash,100);
if(!(player getVariable ["organ",false])) then
{
	if(life_KavaCash < 10000) exitWith {[format[localize "STR_NOTF_HS_NoCashOrgan",10000]] spawn life_fnc_notifKava;};
	SUB(life_KavaCash,10000);
	player setVariable ["organ",true,true];
};
[] call life_fnc_hudUpdate;