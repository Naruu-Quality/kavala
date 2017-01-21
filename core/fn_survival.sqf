#include "..\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private ["_fnc_blood", "_health", "_healthMore", "_loseBlood", "_damage", "_mess", "_showMess", "_i", "_fnc_food", "_fnc_water", "_fnc_toxic", "_veh", "_velocityOfVehicle", "_fuelConsumption", "_foodTime", "_waterTime", "_bloodTime", "_uniformTime", "_vehTime", "_toxicTime", "_walkDis", "_bp", "_lastPos", "_lastState", "_curPos"];
_fnc_blood =  {
	if(!life_is_alive) exitWith {};
	if(life_blood < 200) then {
		player setdamage 1; hint localize "STR_NOTF_BloodMSG_Death";[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE SON SANG",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];
	}else
	{
		_health = damage player;
		_health = ((1 - _health) * 100);
		_healthMore = SEL(getAllHitPointsDamage player,2);
			
		_loseBlood = switch (true) do {
			case ((_health <= 100) && (_health > 95)) : {75;};
			case ((_health <= 95) && (_health > 85)) : {125;};
			case ((_health <= 85) && (_health > 65)) : {200;};
			case ((_health <= 65) && (_health > 40)) : {300;};
			case ((_health <= 40) && (_health > 20)) : {350;};
			case (_health <= 20) : {400;};
			default {50};
		};
		SUB(life_blood,_loseBlood);
		[] call life_fnc_hudUpdate;
		_damage = 0;
		_mess = "";
		if(life_blood < 500) then {hint localize "STR_NOTF_BloodMSG_Death";_damage = 0.20;};
		if((life_blood >= 500) && (life_blood < 1000)) then {_mess = "Vous n'avez presque plus de sang vous commencez à vous sentir partir";_damage = 0.15;};
		if((life_blood >= 1000) && (life_blood < 2000)) then {_mess = "Vous avez perdu pas mal de sang il faudrait penser à faire une transfusion.";_damage = 0.1;};
		if((life_blood >= 2000) && (life_blood < 4000)) then {_mess = "Vous avez legerement la tête qui tourne suite à votre saignement. Pensez à vous soigner.";_damage = 0.05;};
		if(life_blood >= 4000) then {_mess = "Vous perdez votre sang, rien de grave mais ne laisser pas cela trainer.";_damage = 0.01;};
		if(_showMess)then
		{
			titleText [_mess, "PLAIN"];
		};
		_showMess = !_showMess;
		_health = ((getDammage player) + _damage);
		
		if(_health > 1) exitWith {player setdamage 1;[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE SON SANG",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];};
		player setDamage _health;
		for "_i" from 0 to 10 do {
			player setHitIndex [_i, SEL(_healthMore,_i)];
		};
	};
};

_fnc_food =  {
	if(!life_is_alive) exitWith {};
	if(life_hunger < 2) then {player setdamage 1; hint localize "STR_NOTF_EatMSG_Death";[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE LA NOURRITURE",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];}
	else
	{
		SUB(life_hunger,10);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setdamage 1; hint localize "STR_NOTF_EatMSG_Death";[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE LA NOURRITURE",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];};
		switch(life_hunger) do {
			case 30: {[localize "STR_NOTF_EatMSG_1"] spawn life_fnc_notifKava;};
			case 20: {[localize "STR_NOTF_EatMSG_2"] spawn life_fnc_notifKava;};
			case 10: {
				[localize "STR_NOTF_EatMSG_3"] spawn life_fnc_notifKava;
				player setFatigue 1;
			};
		};
	};
};
	
_fnc_water = {
	if(!life_is_alive) exitWith {};
	if(life_thirst < 2) then {player setdamage 1; hint localize "STR_NOTF_DrinkMSG_Death";[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE L EAU",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];}
	else
	{
		SUB(life_thirst,10);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setdamage 1; hint localize "STR_NOTF_DrinkMSG_Death";[format["[COMA.INFO] %1(%2) -TOMBE DANS LE COMA A CAUSE DE L EAU",name player, getPlayerUID player]] remoteExecCall ["A3Log", 2];};
		switch(life_thirst) do  {
			case 30: {[localize "STR_NOTF_DrinkMSG_1"] spawn life_fnc_notifKava;};
			case 20: {
				[localize "STR_NOTF_DrinkMSG_2"] spawn life_fnc_notifKava;
				player setFatigue 1;
			};
			case 10: {
				[localize "STR_NOTF_DrinkMSG_3"] spawn life_fnc_notifKava;
				player setFatigue 1;
			};
		};
	};
};
	
_fnc_toxic = {
	if(!life_is_alive) exitWith {};
	if(life_toxicArea) exitWith {};
	if(uniform player == "U_C_Scientist") exitWith {};
	if((player distance (getMarkerPos "fred_reserve")) > 325) exitWith {};
	[] spawn life_fnc_toxicArea;
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_uniformTime = time;
_bloodTime = time;
_toxicTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;
_showMess = true;

while {true} do {
	if((time - _toxicTime) > 60) then {[] call _fnc_toxic; _toxicTime = time;};
	if(((time - _bloodTime) > 60) && life_isBleeding) then {[] call _fnc_blood; _bloodTime = time;};
	if((time - _uniformTime) > 180) then {[] call life_fnc_playerSkins; _uniformTime = time;};
	if((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};
	
	
	/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
		};
	};
	
	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call life_fnc_updateViewDistance;
		_lastState = vehicle player;
	};
	
	/* Check if the weight has changed and the player is carrying to much */
	if(life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		player setFatigue 1;
		hint localize "STR_NOTF_MaxWeight";
	} else {
		if(isForcedWalk player) then {
			player forceWalk false;
		};
	};
	
	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(vehicle player == player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
				[] call life_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	uiSleep 1;
};
	
	
	
