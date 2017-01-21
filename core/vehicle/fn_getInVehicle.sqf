/*
	fn_getInVehicle.sqf
	manual getin to replace with new getin in 1.58
*/

private "_veh";
_veh = _this select 2;

if (isNil {_veh getVariable "KAV_handleDamageEH"}) then
{
	_veh setVariable ["KAV_handleDamageEH", _veh addEventHandler ["HandleDamage", life_fnc_vehHandleDamage]];
};

if(!(_veh getVariable["insured",false]) && (driver _veh == player)) then 
{
    // ["WarningNotification", ["Assurance","Attention ce véhicule n'est pas assuré"]] call bay_fnc_notification;
	["NoInsured",["Le vehicule n'est pas assuré"]] call bis_fnc_showNotification;
};

