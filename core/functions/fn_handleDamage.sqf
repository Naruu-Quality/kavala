#include "..\..\script_macros.hpp"
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	Thanks Asylum for some script
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private ["_unit", "_part", "_newDamage", "_source", "_projectile", "_oldDamage", "_curWep", "_curMag", "_resist", "_selfDamage", "_inVehicle", "_vehicleHit", "_isCops", "_isTaser", "_canTaser", "_luck"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_newDamage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);
if(_part == "") then
{
	_oldDamage = (getDammage _unit);
}else
{
	_oldDamage = (_unit getHit _part);
};
if(life_is_arrested)then{_newDamage = 0;};

_curWep = "";
_curMag = "";
_resist = 100-(ceil(life_blood / 200));
_selfDamage = true;
_inVehicle = false;
_vehicleHit = false;
_isCops = false;
_isTaser = false;
_canTaser = false;
// if(((_source isKindOf "Man") && (vehicle _source isKindOf "LandVehicle") && (_projectile == "")) || {(_source isKindOf "Ship") || (vehicle _source isKindOf "Ship")}) then
// {
	// _newDamage = _oldDamage;
// };

_newDamage = _oldDamage+(((_newDamage - _oldDamage)*_resist)/100);

if (!alive _unit) exitWith {};
if(!(isNull _source) && _source != _unit)then{
	_selfDamage = false;
	if((vehicle _source != _source) && (driver (vehicle _source) == _source))then{_vehicleHit = true;};
	if(isPlayer _source && _source isKindOf "Man") then {
		_curWep = currentWeapon _source;
		_curMag = currentMagazine _source;
	};
	if(side _source == west) then {_isCops = true;};
	if(_curMag in ["16Rnd_9x21_Mag","30Rnd_9x21_Mag"] && _curWep == "hgun_P07_snds_F")then {_isTaser = true;};
	if(!life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false]) && !(_unit getVariable ["restrainedciv",false])) then {_canTaser=true;};
};
if(vehicle _unit != player) then {_inVehicle=true;};
// if(isNull _source && !_inVehicle && _projectile == "") exitWith {_newDamage = _oldDamage;_newDamage};

if (_vehicleHit && driver (vehicle _source) == _source && !_inVehicle) exitWith
{
	_newDamage = _oldDamage;
	_newDamage
};
if (_newDamage > 0.4 && !_inVehicle && _vehicleHit && (_part == "legs")) then
{
		systemChat "Quelqu'un vous à lourdement renversé avec un véhicule.";
		[true] spawn life_fnc_brokenLeg;
		_newDamage = _oldDamage;
};

if(!_inVehicle && !_vehicleHit)then
{
	_luck = round(random(100));
	if(_luck < 5)then
	{
		life_isBleeding = true;
	};
};

if(_isTaser) then {
	if(_canTaser) then {
		if (_inVehicle) then {
			if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
				player action ["Eject",vehicle player];
				[_unit,_source] spawn life_fnc_tazed;
			};
		} else {
			[_unit,_source] spawn life_fnc_tazed;
		};
	};
	_newDamage = _oldDamage;
};
if(_inVehicle && life_seatbelt && _selfDamage)then{_newDamage = _oldDamage+((_newDamage - _oldDamage)/2);};

if(_selfDamage && (_part == "legs") && _newDamage > 0.5)then
{
	_luck = floor (random 3);
	if(_luck == 0)then
	{
		[true] spawn life_fnc_brokenLeg;
	};
};

[] call life_fnc_hudUpdate;
[] call life_fnc_hudHealthUpdate;
_newDamage

