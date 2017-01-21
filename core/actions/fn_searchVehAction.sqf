#include "..\..\script_macros.hpp"
/*
	File: fn_searchVehAction.sqf
	Author: 
	
	Description:
	
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then {
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {[localize "STR_NOTF_VehCheat"] spawn life_fnc_notifKava; deleteVehicle _vehicle;};
	
	life_action_inUse = true;
	[localize "STR_NOTF_Searching"] spawn life_fnc_notifKava;
	
	sleep 3;
	life_action_inUse = false;
	
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {[localize "STR_NOTF_SearchVehFail"] spawn life_fnc_notifKava;};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then {
		_owners = "No owners, impound it<br/>";
	};
	hint parseText format[localize "STR_NOTF_SearchVeh",_owners];
};
