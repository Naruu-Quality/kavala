/*
	File: fn_adminPardonRapport.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches an id?
*/
private "_unit";
_unit = lbData[22231,lbCurSel (22231)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
[_unit] remoteExecCall ["TON_fnc_pardonRapport",2];