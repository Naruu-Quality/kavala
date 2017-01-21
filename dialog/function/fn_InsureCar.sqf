#include "..\..\script_macros.hpp"
/*
	fn_InsureCar.sqf
	by Nark0t1k
*/

private["_action","_vehicle","_uid","_price","_dbInfo","_insureSystem","_className","_vehOwner","_vehData","_multiplicator","_sellPrice"];
disableSerialization;
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_side = _this select 1;
_sellPrice = 0;
_multiplicator = 0;
if(isNil "_vehicle") exitWith {hint parseText "Il y a une erreur dans la sélection..."};

_className = typeOf _vehicle;
_uid = getPlayerUID player;


_vehData = _vehicle getVariable["vehicle_info_owners",[]];
if(count _vehData  < 1) exitWith {hint parseText "Erreur 1";};

_vehOwner = (_vehData select 0) select 0;
if((getPlayerUID player) != _vehOwner) exitWith{hint parseText "Tu n'es pas le proprietaire";};
if(_vehicle getVariable["insured",false]) exitWith{hint parseText "Le vehicule est déja assuré";};
_sellPrice = switch(_side) do {
	case civilian: {SEL(M_CONFIG(getArray,"LifeCfgVehicles",_className,"rentalprice"),0)};
	case west: {SEL(M_CONFIG(getArray,"LifeCfgVehicles",_className,"rentalprice"),1)};
	case independent: {SEL(M_CONFIG(getArray,"LifeCfgVehicles",_className,"rentalprice"),2)};
	case east: {SEL(M_CONFIG(getArray,"LifeCfgVehicles",_className,"rentalprice"),3)};
};
_multiplicator = LIFE_SETTINGS(getNumber,"vehicleGarage_InsureMultiplicator");
_price = _multiplicator * _sellPrice;
if(_price == -1) exitWith {hint parseText "Le vehicule ne peux pas être assuré";};
if(life_KavaBank < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
_action = [
	format["L'assurance coute $%1.",[_price] call life_fnc_numberText],
	"Assurance Vehicule",
	"Payer",
	"Refuser"
] call BIS_fnc_guiMessage;
if(!(_action)) exitWith {closeDialog 0;};

if(life_HC_isActive) then {
	[player,_uid,_vehicle] remoteExecCall ["HC_fnc_InsureCar",HC_Life];
}else
{
	[player,_uid,_vehicle] remoteExecCall ["TON_fnc_InsureCar",RSERV];
};
hint parseText "Votre vehicule est desormais assure";

life_KavaBank = life_KavaBank - _price;