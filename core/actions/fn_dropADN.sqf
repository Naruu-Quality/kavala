#include "..\..\script_macros.hpp"
/*
	fn_dropADN.sqf
	By Nark0t1k
*/

private["_obj","_data"];

_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_obj setPosATL ASLTOATL(visiblePositionASL player);

_data = [getPlayerUID player,name player];
_obj setVariable ["ADN",_data,true];

if(life_HC_isActive) then {
	[_obj] remoteExec ["HC_fnc_checkADN",HC_Life];
} else {
	[_obj] remoteExec ["TON_fnc_checkADN",RSERV];
};