/*
	File: fn_fixBloodPack.sqf
	Author: John "Paratus" VanderZwet
	Thanks Asylum
	Description:
	Holy crip I'm a crapple!
*/
private["_medic"];
_medic = _this select 0;
if(life_blood >= 5000)exitWith {[7,"La personne a assez de sang"] remoteExecCall ["life_fnc_broadcast",_medic];};
["Vous êtes entrin d'etre soigner..."] spawn life_fnc_notifKava;
[7,"Vous rendez du sang à la personne"] remoteExecCall ["life_fnc_broadcast",_medic];
sleep 3;
life_blood = life_blood + 500;
if(life_blood >= 5000) then {life_blood = 5000;};
if(!life_isBleeding)exitWith {["Vous avez récuperez du sang"] spawn life_fnc_notifKava;};
["Vous avez récuperez du sang et votre saignement à ete stabiliser temporairement"] spawn life_fnc_notifKava;
[] spawn
{
	life_isBleeding = false;
	sleep 240;
	["Vous sentez que votre saignement recommence pensez à vous soigner à l'hopital"] spawn life_fnc_notifKava;
	sleep 60;
	["Votre saignement à recommencez !"] spawn life_fnc_notifKava;
	life_isBleeding = true;
};