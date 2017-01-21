#include "..\..\script_macros.hpp"
/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (CONTROL(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {[localize "STR_GNOTF_Over32"] spawn life_fnc_notifKava;};
_badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {[localize "STR_GNOTF_IncorrectChar"] spawn life_fnc_notifKava;};
if (life_KavaBank < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {[format[localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price")) - life_KavaBank)] call life_fnc_numberText]] spawn life_fnc_notifKava;};

if (life_HC_isActive) then {
    [player,getPlayerUID player,_gangName] remoteExec ["HC_fnc_insertGang",HC_Life];
} else {
    [player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",RSERV];
};

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;