/*
	fn_buyVisa.sqf
	By Nark0t1k
*/

if(life_inv_cartevisa != 0)exitWith {[localize "STR_Visa_already"] spawn life_fnc_notifKava;};
if(life_KavaBank < 10000)exitWith {[localize "STR_Visa_NoMoney"] spawn life_fnc_notifKava;};
life_KavaBank = life_KavaBank - 10000;
[true,"cartevisa",1] call life_fnc_handleInv;
[localize "STR_Visa_buyCarte"] spawn life_fnc_notifKava;
closeDialog 0;
[1] call SOCK_fnc_updatePartial;