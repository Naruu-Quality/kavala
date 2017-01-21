/*
	File: fn_toxicTruckMarkers.sqf
	Author: 

	Description:
	Add markers for civilians in groups.
*/
private["_marker"];

if((driver (vehicle player)) != player) exitWith {};
if(!((vehicle player) getVariable ["ToxicTruck",false])) exitWith {};
while {true} do
{
	sleep 0.5;
	if(visibleMap) then
	{
		_marker = createMarkerLocal [format["%1_marker",toxicTruckSpot],getMarkerPos toxicTruckSpot];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "mil_warning";
		_marker setMarkerTextLocal "!!! ZONE PLACEMENT DE BOMBE !!!";
	};
	waitUntil{!visibleMap}; 
	deleteMarkerLocal _marker;
	if(!visibleMap)exitWith{};
};
