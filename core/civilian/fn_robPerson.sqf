#include "..\..\script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
params [
	["_robber",objNull,[objNull]]
];
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_KavaCash > 0) then {
	[life_KavaCash,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];
	
	// [4] remoteExec ["life_fnc_removeLicenses",_robber];
	if(life_HC_isActive) then {
		[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	
	[7,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[life_KavaCash] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	life_KavaCash = 0;
} else {
	[7,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};
[] call life_fnc_hudUpdate;
[0] call SOCK_fnc_updatePartial;
