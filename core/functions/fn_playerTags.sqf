#include "..\..\script_macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
scopeName "main";
["playerTags", "onEachFrame", 
{
	private["_vis","_pos","_near","_name","_icon","_width","_height","_gang"];

	if (life_adminSpyName) then {
		{
			if (isPlayer _x) then {
				 _pos = visiblePosition _x;
				 _pos set[2,(getPosATL _x select 2) + 2.2];
				 _name = (_x getVariable ["realname",name _x]);
				drawIcon3D ["",[1,1,1,1],_pos,0,0,0,_name,0,0.04];
			};
		} forEach allUnits;
		breakTo "main";
	};

    _near = getPos player nearEntities [["Man","Car","Air","Ship"],10];
	SUB(_near,[player]);
    {
		if(!(_x isKindOf "Man")) then 
		{
			_smallIcon = ["B_G_Van_01_fuel_F","C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F","C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","I_SDV_01_F","O_SDV_01_F","B_SDV_01_F"];
			_icon = getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture");
			if (surfaceIsWater (position _x)) then 
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
			if((typeOf _x) in _smallIcon) then {_width = 1} else {_width = 2};
			_height = 1;
			_color = [1,1,1,0.7];
			_name = "";
			_crew = crew _x;
			if (count _crew > 0 && vehicle player != _x) then
			{
				{if((getPlayerUID _x in life_friendList) || (side _x != civilian))then{if(_name == "") then {_name = (_x getVariable ["realname",name _x])} else {_name = _name + ", " + (_x getVariable ["realname",name _x])};};} forEach _crew;
				if(_name != "") then {	drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];};};
			
		} else 
		{
			_hidden = ((goggles _x) in ["G_Balaclava_TI_G_blk_F","G_Balaclava_TI_blk_F","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
			_distance = 15;
			if (_hidden) then { _distance = 3; };
			if((player distance _x) < _distance && _x != player) then
			{
				_vis = lineIntersects [eyePos player, eyePos _x,player, _x];
				if(!_vis) then
				{
					_icon = "";
					if (surfaceIsWater (position _x)) then 
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
					_width = 0.85;
					_height = 0.85;
					_color = [1,1,1,0.7];
					if (!alive _x ) then { _color = [1,0,0,1]; };
					if(isPlayer _x)then
					{
						if((getPlayerUID _x in life_friendList) || (side _x != civilian))then
						{
							if(side _x == west) then
							{
								switch (_x getVariable["rank", 0]) do
								{
									case (0) : {_name = format["Nouveau %1", (_x getVariable ["realname",name _x])];_icon = [0,"texture"] call BIS_fnc_rankParams;};
									case (1) : {_name = format["Gav %1", (_x getVariable ["realname",name _x])];_icon = [1,"texture"] call BIS_fnc_rankParams;};
									case (2) : {_name = format["Gendarme %1", (_x getVariable ["realname",name _x])];_icon = [1,"texture"] call BIS_fnc_rankParams;};
									case (3) : {_name = format["Adjudant %1", (_x getVariable ["realname",name _x])];_icon = [2,"texture"] call BIS_fnc_rankParams;};
									case (4) : {_name = format["Major %1", (_x getVariable ["realname",name _x])];_icon = [3,"texture"] call BIS_fnc_rankParams;};
									case (5) : {_name = format["Lieutenant %1", (_x getVariable ["realname",name _x])];_icon = [4,"texture"] call BIS_fnc_rankParams;};
									case (6) : {_name = format["Capitain %1", (_x getVariable ["realname",name _x])];_icon = [5,"texture"] call BIS_fnc_rankParams;};
									case (7) : {_name = format["Commandant %1", (_x getVariable ["realname",name _x])];_icon = [6,"texture"] call BIS_fnc_rankParams;};
									case (8) : {_name = format["Lieutenant Colonel %1", (_x getVariable ["realname",name _x])];_icon = [7,"texture"] call BIS_fnc_rankParams;};
									case (9) : {_name = format["Colonel %1", (_x getVariable ["realname",name _x])];_icon = [7,"texture"] call BIS_fnc_rankParams;};
									case (10) : {_name = format["Négociateur %1", (_x getVariable ["realname",name _x])];_icon = [7,"texture"] call BIS_fnc_rankParams;};
								};
							};
							if(side _x == independent) then
							{
								if(str _x in ["medic_1","medic_2"]) exitWith {_name = format["Aide Médecin %1", (_x getVariable ["realname",name _x])];_icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";};
								if(str _x in life_listMedic) exitWith {_name = format["Médecin %1", (_x getVariable ["realname",name _x])];_icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";};
								if(str _x in life_listMecano) exitWith {_name = format["Mécano %1", (_x getVariable ["realname",name _x])];_icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";};
								if(str _x in life_listMerce) exitWith {_name = format["Mercenaire %1", (_x getVariable ["realname",name _x])];_icon = "\a3\ui_f\data\map\VehicleIcons\iconanimal_ca.paa";};
								if(str _x in life_listConces) exitWith {_name = format["Concessionaire %1", (_x getVariable ["realname",name _x])];_icon = "\a3\ui_f\data\map\MapControl\busstop_ca.paa";};
							};
							if(side _x == civilian) then
							{
								_gang = (group _x) getVariable ["gang_name",""];
								_name = (_x getVariable ["realname",name _x]);
								_width = 0;
								_height = 0;
								if (_gang != "") then {
									_pos2 = +_pos;
									_pos2 set[2,(getPosATL _x select 2) + 2];
									drawIcon3D ["",_color,_pos2,_width,_height,0,format["[%1]", _gang],0,0.03];
								};
							};
							drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
						}else
						{
							if(side _x == civilian) then
							{
								_gang = (group _x) getVariable ["gang_name",""];
								_name = (_x getVariable ["realname",name _x]);
								_width = 0;
								_height = 0;
								if (_gang != "") then {
									_pos2 = +_pos;
									_pos2 set[2,(getPosATL _x select 2) + 2];
									drawIcon3D ["",_color,_pos2,_width,_height,0,format["[%1]", _gang],0,0.03];
								};
								if(playerSide == civilian) then
								{
									if ((_x getVariable["ActiveWanted", false]) && (license_civ_chasseur)) then
									{
										_width = 0.85;
										_height = 0.85;
										_icon = "";
										
										_gang = (group _x) getVariable ["gang_name",""];
										_name = (_x getVariable ["realname",name _x]);
										_width = 0;
										_height = 0;
										if (_gang != "") then {
											_pos2 = +_pos;
											_pos2 set[2,(getPosATL _x select 2) + 2];
											drawIcon3D ["",_color,_pos2,_width,_height,0,format["[%1]", _gang],0,0.03];
										};
										_color = [1,0,0,1];
										drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
									};
								};
							};
						};
					}else
					{
						_name = (_x getVariable ["realname",""]);
						drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
					};
				};
			};
		};
    } forEach _near;
}] call BIS_fnc_addStackedEventHandler;