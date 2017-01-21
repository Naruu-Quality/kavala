#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {[localize "STR_ATM_NoneSelected"] spawn life_fnc_notifKava;};
if(isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist"] spawn life_fnc_notifKava;};
if(_val > 999999) exitWith {[localize "STR_ATM_TransferMax"] spawn life_fnc_notifKava;};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {[localize "STR_ATM_notnumeric"] spawn life_fnc_notifKava;};
if(_val > life_KavaBank) exitWith {[localize "STR_ATM_NotEnough"] spawn life_fnc_notifKava;};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_KavaBank) exitWith {[format[localize "STR_ATM_SentMoneyFail",_val,_tax]] spawn life_fnc_notifKava;};

life_KavaBank = life_KavaBank - (_val + _tax);

[_val,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
[format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText]] spawn life_fnc_notifKava;
[1] call SOCK_fnc_updatePartial;
[format["[BANKTRANS] %1(%2) -BANK AVANT: %3 -MONTANT.TTC: %4 -TAX: %5 -CIBLE: %6(%7) -BANK APRES: %8", name player, getPlayerUID player, [BANK + (_val + _tax)] call life_fnc_numberText,[_val] call life_fnc_numberText,_tax ,_unit getVariable["realname",name _unit], getPlayerUID _unit,[BANK] call life_fnc_numberText]] remoteExecCall ["A3Log", 2];