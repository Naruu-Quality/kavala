#include "..\..\script_macros.hpp"
/*
	File: fn_gangWithdraw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the gang bank.
*/
private["_value","_action"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;

//Series of stupid checks
if(_value > 999999) exitWith {[localize "STR_ATM_WithdrawMax"] spawn life_fnc_notifKava;};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {[localize "STR_ATM_notnumeric"] spawn life_fnc_notifKava;};
if(_value > _gFund) exitWith {[localize "STR_ATM_NotEnoughFundsG"] spawn life_fnc_notifKava;};
if(_val < 100 && _gFund > 20000000) exitWith {[localize "STR_ATM_WithdrawMin"] spawn life_fnc_notifKava;}; //Temp fix for something.

_action = [
	format["Attention l'argent retirer compte du gang ne subis PAS le taux de change. Somme :%1",_value],
	"Taux de change pour depot sur le compte de gang",
	"Accepter",
	"Refuser"
] call BIS_fnc_guiMessage;
if(!_action)exitWith {};

SUB(_gFund,_value);
ADD(life_KavaCash,_value);
(group player) setVariable ["gang_bank",_gFund,true];

if(life_HC_isActive) then {
	[1,(group player)] remoteExecCall ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
	[1,(group player)] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};


[format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText]] spawn life_fnc_notifKava;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
