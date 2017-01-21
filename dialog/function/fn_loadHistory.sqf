/*
	File: fn_loadHistory.sqf
*/
private["_lst","_ctrl"];
disableSerialization;
closeDialog 0;
if(!(createDialog "Life_NotifHistory")) exitWith {[] call life_fnc_loadHistory;};

_lst = _this select 0;
_ctrl = ((findDisplay 50000) displayCtrl 50001);
lbClear _ctrl;
if((count _lst) != 0)then
{
	reverse _lst;
	{
		_ctrl lnbAddRow[format["%1", _x]];
	} foreach _lst;
	reverse life_KavaNotif;
}else
{
	_ctrl lnbAddRow[localize "STR_History_Empty"];
};