/*
	File: fn_brokenLeg.sqf
	Author: John "Paratus" VanderZwet
	Thanks Asylum
	Description:
	Holy crip I'm a crapple!
*/

_broken = [_this,0,false,[false]] call BIS_fnc_param;

if (_broken) then
{
	if (life_isBroken) exitWith {};
	PlaySound "bonebreak";
	systemChat "Tu as sentit et entendu tes jambes se briser!";
	player playActionNow "PlayerProne";
};

life_isBroken = _broken;

[] call life_fnc_hudUpdate;
[] call SOCK_fnc_updateRequest;
if (_broken) then
{
	while {life_isBroken} do
	{
		if (stance player != "PRONE" && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false])) then { player playActionNow "PlayerProne"; };
		sleep 2;
	};
};