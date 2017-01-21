#include "..\..\script_macros.hpp"
/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
private ["_serviceCost"];
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText"];
if(life_action_inUse) exitWith {[localize "STR_NOTF_Action"] spawn life_fnc_notifKava;};

_serviceCost = 5000;
_search = nearestObjects[getPos player, ["Air"],15];

if(EQUAL(count _search,0)) exitWith {[localize "STR_Service_Chopper_NoAir"] spawn life_fnc_notifKava;};
if(life_KavaCash < _serviceCost) exitWith {[localize "STR_Serive_Chopper_NotEnough"] spawn life_fnc_notifKava;};

life_action_inUse = true;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format[localize "STR_Service_Chopper_Servicing","en cours..."];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do {
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format[localize "STR_Service_Chopper_Servicing",round(_cP * 100)];
	if(_cP >= 1) exitWith {};
};

if(!alive SEL(_search,0) || SEL(_search,0) distance (getPos player) > 15) exitWith {life_action_inUse = false; [localize "STR_Service_Chopper_Missing"] spawn life_fnc_notifKava;};

SUB(life_KavaCash,_serviceCost);
if(!local SEL(_search,0)) then {
	[SEL(_search,0),1] remoteExecCall ["life_fnc_setFuel",SEL(_search,0)];
} else {
	SEL(_search,0) setFuel 1;
};

SEL(_search,0) setDamage 0;
[] call life_fnc_hudUpdate;
5 cutText ["","PLAIN"];
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
life_action_inUse = false;
