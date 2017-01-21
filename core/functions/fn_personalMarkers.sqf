/*
	File: fn_personalMarkers.sqf
	Author: Nark0t1K inspired by Tonics
	
	Description:
	player on the map if you get GPS.
*/
while {true} do
{
	waitUntil {visibleMap};
	if("ItemGPS" in (assignedItems player)) then
	{
		//Create markers
		/*
		_mymark = createMarkerLocal [format["%1_marker",player],getPos player];
		_mymark setMarkerColorLocal "ColorBlue";
		_mymark setMarkerTypeLocal "hd_arrow";
		_mymark setMarkerDirLocal (getDir player);
		_mymark setMarkerTextLocal "Vous";
		*/
		
		_mymark = createMarkerLocal [format ["%1_markerPerso", player], getPos player];
		_mymark setMarkerShapeLocal "ICON";
		_mymark setMarkerSize [2,2];
		_mymark setMarkerTypeLocal "mil_triangle";
		_mymark setMarkerColorLocal ("ColorBLUFOR");
		_mymark setMarkerDirLocal (getDir player);
		_mymark setMarkerAlphaLocal 0.75;
		
				
		while {visibleMap} do
		{
			_mymark setMarkerPosLocal (getPos player);
			if(!visibleMap) exitWith {};
			sleep 0.02;
		};
		deleteMarkerLocal format["%1_markerPerso",player];
	};
};