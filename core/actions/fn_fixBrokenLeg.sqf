/*
	File: fn_fixBrokenLeg.sqf
	Author: John "Paratus" VanderZwet
	Thanks Asylum
	Description:
	Holy crip I'm a crapple!
*/
private["_medic"];
_medic = _this select 0;

if(!life_isBroken)exitWith {[7,"La personne n'as pas les jambes cassé"] remoteExecCall ["life_fnc_broadcast",_medic];};
hint parseText "Vous êtes entrin d'etre soigner...";
[7,"Vois soigner les jambes de la personne"] remoteExecCall ["life_fnc_broadcast",_medic];
sleep 3;
["Un medecin a soigner vos jambes"] spawn life_fnc_notifKava;
life_isBroken = false;
