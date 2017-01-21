#include "..\..\script_macros.hpp"
/*
    File: fn_deviceSetupBomb.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Devilfloh
    Description:
    Starts automated mining of resource from the tempest device. Not integrated with percents.
*/
private ["_vehicle", "_bombe", "_distance", "_nearest", "_spawnPoint", "_item"];
_vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};

if (isNil {_vehicle getVariable "ToxicTruck"}) exitWith {};
_bombe = (nearestObjects[getPosATL _vehicle,["Land_BuoyBig_F"],10]);
if(count _bombe == 0)exitWith {hint parseText localize "STR_Toxic_AlreadySetup";};
_bombe = _bombe select 0;
_nearest = 999999;
{
	_distance = _vehicle distance (getMarkerPos _x);
	if(_distance < _nearest) then {_spawnPoint = _x;_nearest=_distance;};
} foreach ["toxic_areaRandom_1","toxic_areaRandom_2","toxic_areaRandom_3","toxic_areaRandom_4","toxic_areaRandom_5"];


if(_nearest > 50)exitWith {hint parseText localize "STR_Toxic_TruckNotNear";};
if(_nearest < 10)exitWith {hint parseText localize "STR_Toxic_TruckTooNear";};

deleteVehicle _bombe;
_item = createVehicle ["Land_BuoyBig_F", getMarkerPos _spawnPoint, [], 0, "NONE"];
_item allowDamage false;
_item enableSimulation false;
_item setVariable ["ToxicState", 0, true];
[_item] remoteExecCall ["life_fnc_toxicAddAction",RCLIENT];
_vehicle setVariable ["ToxicTruck",false,true]