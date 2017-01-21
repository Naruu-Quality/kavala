/*
	fn_onFiredNear.sqf
	By Nark0t1k

*/

private ["_unitNear"];

_distance  = _this select 2;

if(_distance > 50) exitWith {};

[3,format[" <img size='4' image='textures\combat.paa'/>"]] remoteExecCall ["life_fnc_broadcast",player];
life_shootNearTime = time;
if(life_shootNear)exitWith {};
life_shootNear = true;

while {true} do {
	
	if((time - life_shootNearTime) > 30)exitWith {life_shootNear = false;};
	sleep 1;
};
