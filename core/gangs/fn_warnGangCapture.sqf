/*
	fn_warnGangCapture.sqf
*/
if(!hasInterface && !isDedicated)exitWith {};
private ["_flagName","_gangName","flag","_gangAttack"];
_flagName = _this select 0;
_gangName = _this select 1;
_gangAttack = _this select 2;

if(!alive player) exitWith {};
if(!(isNil {(group player) getVariable "gang_owner"}))exitWith {};
if(((group player) getVariable "gang_owner") != _gangName) exitWith {};
if(((group player) getVariable "gang_owner") == _gangAttack) exitWith {};

_flag = switch (_flagName) do
{
	case flag_gang1_1:{"A"};
	case flag_gang1_2:{"B"};
	case flag_gang1_3:{"C"};
	case flag_gang2_1:{"A"};
	case flag_gang2_2:{"B"};
	case flag_gang2_3:{"C"};
	case flag_gang3_1:{"A"};
	case flag_gang3_2:{"B"};
	case flag_gang3_3:{"C"};
};

[format[localize "STR_Gang_Capture",_flag]] spawn life_fnc_notifKava;