#include "..\..\script_macros.hpp"
/*
    File: fn_gangKick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    32 hours...
*/
private["_unit","_unitID","_members","_online"];
disableSerialization;
_unit = objNull;
if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unitID = CONTROL_DATA(2621);
_unitID = call compile format["%1", _unitID];
_online = false;
{
	if((getPlayerUID _x) == _unitID)exitWith {_online=true;_unit=_x;};
}forEach playableUnits;
if ((_unit == player) && _online) exitWith {hint localize "STR_GNOTF_KickSelf"};

_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};
_unitIDT = getPlayerUID player;
_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];
if(_online)then
{
	[_unit,group player] remoteExec ["TON_fnc_clientGangKick",_unit]; //Boot that bitch!
};
if (life_HC_isActive) then {
    [4,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};
closedialog 0;
{
	if(life_HC_isActive) then {
		[_x,getPlayerUID _x,_members] remoteExecCall ["HC_fnc_queryPlayerFullGang",HC_Life];
	}else
	{
		[_x,getPlayerUID _x,_members] remoteExec ["TON_fnc_queryPlayerFullGang",RSERV];
	};
}foreach (units group player);
// [] call life_fnc_gangMenu;
