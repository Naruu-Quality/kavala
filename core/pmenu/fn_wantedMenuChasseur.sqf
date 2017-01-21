#include "..\..\script_macros.hpp"
/*
	File: fn_wantedMenuChasseur.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;
createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list

_crimes = LIFE_SETTINGS(getArray,"crimes");

{
	_list2 lbAdd format["%1 - %2€ (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Connexion au systeme interpole..."];

ctrlShow[2405,false];
ctrlShow[9800,false];

if(life_HC_isActive) then {
	[player,life_friendList,getPlayerUID player] remoteExecCall ["HC_fnc_wantedFetch",HC_Life];
} else {
	[player,life_friendList,getPlayerUID player] remoteExec ["life_fnc_wantedFetch",RSERV];
};
