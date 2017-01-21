#include "..\..\script_macros.hpp"
/*
	File: fn_tranquilized.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_curWep","_curMags","_attach","_enduro"];
params [
	["_unit",objNull,[objNull]],
	["_shooter",objNull,[objNull]]
];

if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then {
	_enduro = getFatigue player;
	if(_enduro >= 0.75)exitWith
	{
		if(!life_istazed) then {
			life_istazed = true;
			_curWep = currentWeapon player;
			_curMags = magazines player;
			_attach = if(!(EQUAL(RIFLE,""))) then {RIFLE_ITEMS} else {[]};
			
			{player removeMagazine _x} foreach _curMags;
			player removeWeapon _curWep;
			player addWeapon _curWep;
			if(!(EQUAL(count _attach,0)) && !(EQUAL(RIFLE,""))) then {
				{
					_unit addPrimaryWeaponItem _x;
				} foreach _attach;
			};
			
			if(!(EQUAL(count _curMags,0))) then {
				{player addMagazine _x;} foreach _curMags;
			};
			
			[_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];
			_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
			_obj setPosATL ASLTOATL(visiblePositionASL player);
			[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
			[0,"STR_NOTF_Tranquilized",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
			_unit attachTo [_obj,[0,0,0]];
			disableUserInput true;
			sleep 45;
			
			[player,"AmovPpneMstpSnonWnonDnon","playNow"] remoteExecCall ["life_fnc_animSync",RCLIENT];
			
			if(!(player getVariable ["Escorting",false])) then {
				detach player;
			};
			life_istazed = false;
			player allowDamage true;
			disableUserInput false;
		};
	};
	_enduro = _enduro + 0.25;
	player setFatigue _enduro;
} else {
	_unit allowDamage true;
	life_iztazed = false;
};