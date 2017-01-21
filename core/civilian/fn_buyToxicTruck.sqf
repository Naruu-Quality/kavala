#include "..\..\script_macros.hpp"
/*
	fn_buyToxicTruck.sqf

*/

private ["_spawnPointTruck", "_nearVehicles", "_action", "_vehicle", "_spawnPoint", "_item"];
_spawnPointTruck = _this select 3;
if((time - toxicTruckTimer) < 3600)exitWith {[localize "STR_Toxic_NoOffer"] spawn life_fnc_notifKava;};
if(!license_civ_rebel) exitWith {[localize "STR_Toxic_DontTalk"] spawn life_fnc_notifKava;};
_nearVehicles = nearestObjects[(getMarkerPos _spawnPointTruck),["Car","Air","Ship"],10];
if((count _nearVehicles) > 0)exitWith {[localize "STR_Shop_Veh_Block"] spawn life_fnc_notifKava;};
if(life_KavaCash < 200000)exitWith {[localize "STR_Toxic_NoMoney"] spawn life_fnc_notifKava;};

_action = [
localize "STR_Toxic_Sure",
"Lancement de mission",
"Oui",
"Non"
] call BIS_fnc_guiMessage;
if(!_action) exitWith {};
if((time - toxicTruckTimer) < 3600)exitWith {[localize "STR_Toxic_NoOffer"] spawn life_fnc_notifKava;};
_nearVehicles = nearestObjects[(getMarkerPos _spawnPointTruck),["Car","Air","Ship"],10];
if((count _nearVehicles) > 0)exitWith {[localize "STR_Shop_Veh_Block"] spawn life_fnc_notifKava;};

SUB(life_KavaCash,200000);
_vehicle = createVehicle ["B_Truck_01_transport_F", (getMarkerPos _spawnPointTruck), [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle setPos (getMarkerPos _spawnPointTruck);
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPointTruck));
_vehicle setDir (markerDir _spawnPointTruck);

_vehicle lock 2;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
_vehicle setVariable ["KAV_handleDamageEH", _vehicle addEventHandler ["HandleDamage", life_fnc_vehHandleDamage]];
_vehicle allowDamage true;
life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
_vehicle enableRopeAttach false;
_vehicle setVariable ["ToxicTruck",true,true];

_item = createVehicle ["Land_BuoyBig_F", [0,0,0], [], 0, "NONE"];
_item allowDamage false;
_item enableSimulation false;
_item AttachTo [_vehicle, [0,-2,3]];

toxicTruckTimer = time;
publicVariable "toxicTruckTimer";
toxicTruckSpot = ["toxic_areaRandom_1","toxic_areaRandom_2","toxic_areaRandom_3","toxic_areaRandom_4","toxic_areaRandom_5"] call BIS_fnc_selectRandom;
publicVariable "toxicTruckSpot";
[6] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
[[0,1,2,7],localize "STR_Toxic_Warn1"] remoteExecCall ["life_fnc_broadcast",RCLIENT];