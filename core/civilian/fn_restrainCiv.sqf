#include "..\..\script_macros.hpp"
/*
	File: fn_restrainCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the client.
*/
private["_cop","_player","_vehicle"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
_vehicle = vehicle player;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn {
	private "_time";
	while {true} do {
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if(!(player getVariable ["restrainedciv",FALSE])) exitWith {};
		if(!([civilian,getPos player,30] call life_fnc_nearUnits) && (player getVariable ["restrainedciv",FALSE]) && vehicle player == player) exitWith {
			player setVariable ["restrainedciv",FALSE,TRUE];
			player setVariable ["Escorting",FALSE,TRUE];
			player setVariable ["transporting",false,true];
			detach player;
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
		};
	};
};

[format[localize "STR_Cop_Retrained",_cop getVariable ["realname",name _cop]]] spawn life_fnc_notifKava;

life_disable_getIn = true;
life_disable_getOut = false;

while {player getVariable  "restrainedciv"} do {
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "restrainedciv") || vehicle player != _state};

	if(!alive player) exitWith {
		player setVariable ["restrainedciv",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};

	if(!alive _cop) then {
		player setVariable ["Escorting",false,true];
		detach player;
	};

	if(vehicle player != player && life_disable_getIn) then {
		player action["eject",vehicle player];
	};

	if((vehicle player != player) && (vehicle player != _vehicle)) then {
		_vehicle = vehicle player;
	};

	if(vehicle player == player && life_disable_getOut) then {
		player moveInCargo _vehicle;
	};

	if((vehicle player != player) && life_disable_getOut && (driver (vehicle player) == player)) then {
		player action["eject",vehicle player];
		player moveInCargo _vehicle;
	};
};

//disableUserInput false;

if(alive player) then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};
