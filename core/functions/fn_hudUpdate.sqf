#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2200) progressSetPosition (life_hunger / 100);
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (life_thirst / 100);
LIFEctrl(2203) progressSetPosition (1 / (5000 / life_blood));

LIFEctrl(1200) ctrlSetStructuredText parseText format["%1 %2</t>",round(life_hunger),"%"];
LIFEctrl(1201) ctrlSetStructuredText parseText format["%1 HP</t>",round((1 - (damage player))*100)];
LIFEctrl(1202) ctrlSetStructuredText parseText format["%1 %2</t>",round(life_thirst),"%"];
LIFEctrl(1203) ctrlsetText format["Sang: %1 L", ((round(life_blood / 100))/10)];
LIFEctrl(1205) ctrlSetStructuredText parseText format["<t size='1'><img image='icons\ico_money.paa' size='1'></img>%1 $</t>",[life_KavaCash] call life_fnc_numberText];

_state = switch(true) do
{
	case(life_isBleeding && life_isBroken): {"Saigne & Cassure"};
	case(life_isBleeding): {"Saigne"};
	case(life_isBroken): {"Cassure"};
	default{"Etat: Normal"};
};
LIFEctrl(1204) ctrlsetText format["%1", _state];