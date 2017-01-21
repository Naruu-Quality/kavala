#include "..\..\script_macros.hpp"
/*
	fn_notifKava.sqf
	["TEST 1"] spawn life_fnc_notifKava;
*/

private ["_message","_time","_number","_empty"];
if(!hasInterface && !isDedicated)exitWith {};
_message = _this select 0;

diag_log "Kavalog NotifKava Start";

10 cutRsc ["playerKAVAnotif","PLAIN"];

_random = round(random 10000);

LIFEKavaNotifctrl(5000) ctrlSetStructuredText parseText format["<t size='1.12' color='#FF0000'>%1</t>",_message];

LIFEKavaNotifctrl(5001) ctrlSetStructuredText parseText format["<t size='1.12'>%1</t>",life_KavaNotif1 select 1];

LIFEKavaNotifctrl(5002) ctrlSetStructuredText parseText format["<t size='1.12' color='#0101DF'>%1</t>",life_KavaNotif2 select 1];

LIFEKavaNotifctrl(5003) ctrlSetStructuredText parseText format["<t size='1.12' color='#FF0000'>%1</t>",life_KavaNotif3 select 1];

LIFEKavaNotifctrl(5004) ctrlSetStructuredText parseText format["<t size='1.12' color='#D7DF01'>%1</t>",life_KavaNotif4 select 1];

LIFEKavaNotifctrl(5005) ctrlSetStructuredText parseText format["<t size='1.12' color='#000000'>%1</t>",life_KavaNotif5 select 1];

life_KavaNotif6 = life_KavaNotif5;
life_KavaNotif5 = life_KavaNotif4;
life_KavaNotif4 = life_KavaNotif3;
life_KavaNotif3 = life_KavaNotif2;
life_KavaNotif2 = life_KavaNotif1;
life_KavaNotif1 = [_random,format["%1", _message]];
life_KavaNotif pushBack format["%1", _message];

diag_log format ["Kavalog NotifKava NOTIF1: %1", life_KavaNotif1];

_time = time;
_empty = "";
_i = 5000;
waitUntil {(time - _time) > 15};
{
	if(_random == (_x select 0))then
	{
		LIFEKavaNotifctrl(_i) ctrlSetStructuredText parseText (_empty);
		_i = _i - 5000;
		switch (_forEachIndex) do
		{
			case 0:{life_KavaNotif1=[0,""];};
			case 1:{life_KavaNotif2=[0,""];};
			case 2:{life_KavaNotif3=[0,""];};
			case 3:{life_KavaNotif4=[0,""];};
			case 4:{life_KavaNotif5=[0,""];};
			case 5:{life_KavaNotif6=[0,""];};
		};
	};
_i = _i + 1;
}foreach [life_KavaNotif1,life_KavaNotif2,life_KavaNotif3,life_KavaNotif4,life_KavaNotif5,life_KavaNotif6];

