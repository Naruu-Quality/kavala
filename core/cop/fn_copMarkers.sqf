#include "..\..\script_macros.hpp"
/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops"];
_markers = [];
_cops = [];
_stealMark = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == west) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor

	//Create markers
	{
		if(_x != player) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorBLUFOR";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];

			_markers pushBack [_marker,_x];
		};
	} foreach _cops;

	{
		if(_x getVariable ["steal", FALSE])then
		{
			_marker = createMarkerLocal [format["%1_markerBracage",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "mil_warning";
			_marker setMarkerTextLocal "Braquage en cours!";
			
			_stealMark pushBack [_marker,_x];
		};
	} foreach allUnits;
	
	while {visibleMap} do {
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit" && !isNull _unit) then {
				_marker setMarkerPosLocal (visiblePosition _unit);
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	{deleteMarkerLocal (_x select 0);} foreach _stealMark;
	_markers = [];
	_cops = [];
};