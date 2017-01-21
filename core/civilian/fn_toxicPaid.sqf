#include "..\..\script_macros.hpp"
/*
	fn_toxicPaid.sqf
*/
private ["_nbrCiv", "_money"];

_type = _this select 3;

if(_type == "arme")then
{
	if(!life_toxicPaid)exitWith {hint parseText localize "STR_Toxic_PaidNoTalkArme";};
	life_action_inUse = true;
	_nbrCiv = 0;
	_money = 0;

	hint parseText localize "STR_Toxic_PaidTalk1";
	sleep 3;
	hint parseText localize "STR_Toxic_PaidTalk2";
	sleep 5;
	hint parseText localize "STR_Toxic_PaidTalk3";

	_nbrCiv = [civilian] call life_fnc_playerCount;
	switch (true) do
	{
		case ((_nbrCiv > 0) && (_nbrCiv <= 10)):{_money = 500000; hint parseText localize "STR_Toxic_PaidTalk4";};
		case ((_nbrCiv > 10) && (_nbrCiv <= 30)): {_money = 1000000; hint parseText  localize "STR_Toxic_PaidTalk5";};
		case ((_nbrCiv > 30) && (_nbrCiv <= 60)): {_money = 2000000; hint parseText localize "STR_Toxic_PaidTalk6";};
		case (_nbrCiv > 60): {_money = 4000000; hint parseText localize "STR_Toxic_PaidTalk7";};
	};
	life_toxicPaid = false;
	life_KavaCash = life_KavaCash + _money;
	[] call life_fnc_hudUpdate;
	deleteMarkerLocal "toxicpaid";
}else
{
	if(!life_toxicPaid)exitWith {hint parseText localize "STR_Toxic_PaidNoTalkDisarm";};
	life_action_inUse = true;
	hint parseText localize "STR_Toxic_PaidDisarmTalk1";
	sleep 3;
	hint parseText localize "STR_Toxic_PaidDisarmTalk2";
	sleep 5;
	hint parseText localize "STR_Toxic_PaidDisarmTalk3";
	ADD(life_KavaBank,500000);
	life_toxicPaid = false;
};
life_action_inUse = false;