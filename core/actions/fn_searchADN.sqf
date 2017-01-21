#include "..\..\script_macros.hpp"
/*
	fn_searchADN.sqf
	By Nark0t1k
*/

private["_lstObj","_adn"];
if (life_action_inUse) exitWith {};
if(!([false,"adnpack",1] call life_fnc_handleInv))exitWith {hint parseText "Tu n'as pas de Kit ADN";};
life_action_inUse = true;
_lstObj = nearestObjects [player, ["Land_ClutterCutter_small_F"], 10];
hint parseText "Recherche d'ADN en cours ...";
sleep 5;
if(count _lstObj == 0) exitWith {hint parseText "Pas d'ADN";life_action_inUse = false;};
_adn = [];
{
	if(!(isNil {_x getVariable "ADN"})) exitWith {_adn = _x getVariable "ADN";deleteVehicle _x};
}foreach _lstObj;
if(count _adn == 0) exitWith {hint parseText "Pas d'ADN";life_action_inUse = false;};

hint parseText "Tu as trouvé de l'ADN analyse en cours...";
sleep 5;
hint format["L'ADN appartient à un dénommé: %1", SEL(_adn,1)];
life_action_inUse = false;