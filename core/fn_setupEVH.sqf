/*
	File: fn_setupEVH.sqf
	Author:

	Description:
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this spawn life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Put",{_this spawn life_fnc_onPutItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["FiredNear",{_this spawn life_fnc_onFiredNear}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["GetInMan", {_this call life_fnc_getInVehicle}];
player addEventHandler["GetOutMan", {_this call life_fnc_getOutVehicle}];
[] spawn {
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	player addEventHandler["onPlayerDisconnected", {_this call SOCK_fnc_updateRequest}];
};