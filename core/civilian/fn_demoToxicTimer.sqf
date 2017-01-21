#include "..\..\script_macros.hpp"
/*
	File: fn_demoToxicTimer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the "Demo" timer for the police.
*/
private ["_time", "_uiDisp", "_timer", "_bombe"];
_time = _this select 0;
disableSerialization;
6 cutRsc ["life_timer","PLAIN"];
_uiDisp = GVAR_UINS "life_timer";
_timer = _uiDisp displayCtrl 38301;
_bombe = (nearestObjects[getPosATL player,["Land_BuoyBig_F"],15]) select 0;

while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = GVAR_UINS "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(isNull _bombe)exitWith {};
	if((_bombe getVariable ["ToxicID",0]) != (getPlayerUID player)) exitWith {[localize "STR_Toxic_LoseOwner"] spawn life_fnc_notifKava;};
	if(round(_time - time) < 1) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
6 cutText["","PLAIN"];