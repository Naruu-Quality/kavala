#include "..\..\script_macros.hpp"
/*
    File: fn_gangMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    31 hours of no sleep screw your description.
*/
private ["_ownerID", "_gangName", "_gangBank", "_gangMax", "_members", "_online", "_grpMembers", "_allUnits", "_ctrl"];
disableSerialization;
if (isNull (findDisplay 2620)) then {
    if (!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = group player getVariable ["gang_owner",""];
if (_ownerID isEqualTo "") exitWith {closeDialog 0;}; //Bad juju

_gangName = group player getVariable "gang_name";
_gangBank = GANG_FUNDS;
_gangMax = group player getVariable "gang_maxMembers";

if (_ownerID != getPlayerUID player) then {
    (CONTROL(2620,2622)) ctrlEnable false; //Upgrade
    (CONTROL(2620,2624)) ctrlEnable false; // Kick
    (CONTROL(2620,2625)) ctrlEnable false; //Set New Leader
    (CONTROL(2620,2630)) ctrlEnable false; //Invite Player
    (CONTROL(2620,2631)) ctrlEnable false; //Disband Gang
};

(CONTROL(2620,2629)) ctrlSetText _gangName;
(CONTROL(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " K$%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,2621);
lbClear _members;

{
	_uid = _x select 0;
	_name = _x select 1;
	_online = false;
	{
		if((getPlayerUID _x) == _uid)exitWith {_online = true;};
	}forEach (units group player);
	if(_online)then
	{
		{
			if ((getPlayerUID _x) == _uid) then {
				if ((getPlayerUID _x) == _ownerID) then {
					_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader")+" - En Ligne",(_x getVariable ["realname",name _x])];
					_members lbSetData [(lbSize _members)-1,str(getPlayerUID _x)];
				} else {
					_members lbAdd format["%1 - En Ligne",(_x getVariable ["realname",name _x])];
					_members lbSetData [(lbSize _members)-1,str(getPlayerUID _x)];
				};
			};
		} forEach (units group player);
	}else
	{
		if (_uid == _ownerID) then {
			_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader")+" - Hors Ligne",_name];
			_members lbSetData [(lbSize _members)-1,str(_uid)];
		} else {
			_members lbAdd format["%1 - Hors Ligne",_name];
			_members lbSetData [(lbSize _members)-1,str(_uid)];
		};
	};

}forEach life_fullGangList;


_grpMembers = units group player;
_allUnits = playableUnits;

//Clear out the list..
{
    if (_x in _grpMembers || side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
        _allUnits deleteAt _forEachIndex;
    };
} forEach _allUnits;

_ctrl = CONTROL(2620,2632);
lbClear _ctrl; //Purge the list
{
    _ctrl lbAdd format["%1",_x getVariable ["realname",name _x]];
    _ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} forEach _allUnits;
