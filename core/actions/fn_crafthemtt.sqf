#include "..\..\script_macros.hpp"
/*
	fn_craftHemtt.sqf
	by Nark0t1k for Kavalash
	
	_unit addAction[localize"STR_gatherDisplay",life_fnc_gatherMeca,"",0,false,false,"",' vehicle player == player && player distance _target < 10 && playerSide == civilian && license_civ_rebel && !life_action_inUse '];
*/

private ["_spawnPoint", "_speed", "_exit", "_action", "_handle"];

_spawnPoint = _this select 0;
_speed = 3;
_exit = false;
_action = false;
if(life_vehGarage >= life_vehGarageMax) exitWith {[format["Tu ne peux avoir que %1 véhicule dans ton garage.",life_vehGarageMax]] spawn life_fnc_notifKava;};
if(count (nearestObjects[getPos player,["B_Slingload_01_Ammo_F"],25]) == 0)exitWith {[localize "STR_needPieceMeca"] spawn life_fnc_notifKava;};
if(count (nearestObjects[getPos player,["CargoNet_01_box_F"],25]) < 2) exitWith{[localize "STR_needWheels"] spawn life_fnc_notifKava;};


if(!license_civ_hemttplan)exitWith{[localize "STR_needPlanHemtt"] spawn life_fnc_notifKava;};


life_action_inUse = true;

_handle = [localize "STR_craftHemttHeader",true,5,0.01,_speed,""] spawn life_fnc_handleProgressBar;
waitUntil { scriptDone _handle; }; 
if(errorProgress > 0) exitWith {life_action_inUse = false;life_interrupted = false;life_is_processing=false;};


if(count (nearestObjects[getPos player,["B_Slingload_01_Ammo_F"],25]) == 0)exitWith {[localize "STR_needPieceMeca"] spawn life_fnc_notifKava;life_action_inUse = false;};
if(count (nearestObjects[getPos player,["CargoNet_01_box_F"],25]) < 2) exitWith{[localize "STR_needWheels"] spawn life_fnc_notifKava;life_action_inUse = false;};


deleteVehicle ((nearestObjects[getPos player,["B_Slingload_01_Ammo_F"],25]) select 0);

deleteVehicle ((nearestObjects[getPos player,["CargoNet_01_box_F"],25]) select 0);
sleep 0.3;
deleteVehicle ((nearestObjects[getPos player,["CargoNet_01_box_F"],25]) select 0);

license_civ_hemttplan=false;
["B_Truck_01_box_F"] remoteExecCall ["life_fnc_vehicleCraft",player];
[localize "STR_craftHemttEnd"] spawn life_fnc_notifKava;
life_action_inUse = false;