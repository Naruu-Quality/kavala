#include "..\..\script_macros.hpp"
/*
	File: fn_copMarkAsk.sqf

*/
private ["_fullList","_markCriminal"];
_fullList = [];

while {true} do
{
	waitUntil {visibleMap};
	{
		if(_x getVariable["askHelp",FALSE])then
		{
			_markCriminal = createMarkerLocal [format["%1_markerAskCop",getPlayerUID _x],getPos _x];
			_markCriminal setMarkerColorLocal "ColorBlue";
			_markCriminal setMarkerTypeLocal "mil_warning";
			_markCriminal setMarkerTextLocal format["HELP: %1", _x getVariable["realname", name _x]];
			_fullList pushBack format["%1_markerAskCop",getPlayerUID _x];
		};
	}foreach playableUnits;
	
	waitUntil {!visibleMap};
	{
		deleteMarkerLocal _x;
	}foreach _fullList;
};