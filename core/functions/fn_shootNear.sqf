/*
	fn_shootNear.sqf
	By Nark0t1k

*/

private ["_unitNear"];

_unitNear = _this select 0;

if(count _unitNear == 0) exitWith {};
if(!(player in _unitNear)) exitWith {};

[3,format[" <img size='4' image='textures\combat.paa'/>"]] remoteExecCall ["life_fnc_broadcast",player];
life_shootNearTime = time;
if(life_shootNear)exitWith {};
life_shootNear = true;

while {true} do {
	
	if((time - life_shootNearTime) > 30)exitWith {life_shootNear = false;};
	sleep 1;
};
