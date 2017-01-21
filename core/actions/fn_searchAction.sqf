/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
params [
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};
[localize "STR_NOTF_Searching"] spawn life_fnc_notifKava;
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {[localize "STR_NOTF_CannotSearchPerson"] spawn life_fnc_notifKava;};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;