#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

life_garage_sp = [(_spawnPos modelToWorld [-11.5,0,0]),(getDir _spawnPos)-90];
life_garage_type = _type;
life_isImpound = false;
if(life_HC_isActive) then {
	[false,getPlayerUID player,playerSide,_type,player] remoteExecCall ["HC_fnc_getVehicles",HC_Life];
} else {
	[false,getPlayerUID player,playerSide,_type,player] remoteExec ["TON_fnc_getVehicles",RSERV];
};

createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];