/*
	fn_organStole.sqf
*/

[localize "STR_Scalpel_Stole"] spawn life_fnc_notifKava;
life_blood = round (life_blood/2);
life_isBleeding = true;
[] call life_fnc_hudUpdate;
[] call SOCK_fnc_updateRequest;