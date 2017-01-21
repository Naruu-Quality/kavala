#include "..\..\script_macros.hpp"
/*
	file: fn_smartphone.sqf	

*/

private ["_pList", "_type", "_data", "_display", "_cPlayerList", "_cFriendList", "_cMessageList", "_cMessageDetail", "_cMessageTarget", "_nameSender", "_msg", "_rowData", "_cServiceList"];

disableSerialization;
waitUntil {!isNull findDisplay 88000};
_display = findDisplay 88000;
life_messageTo = "";
_cPlayerList = _display displayCtrl 88005;
_cFriendList = _display displayCtrl 88006;
_cMessageList = _display displayCtrl 88003;
_cMessageDetail = _display displayCtrl 88004;
_cMessageTarget = _display displayCtrl 88002;
_cServiceList = _display displayCtrl 88016;
_pList = [];
ctrlShow [88009, false];
ctrlShow [88015, false];
if((call life_adminlevel) > 0) then
{
	ctrlShow [88009, true];
	ctrlShow [88015, true];
};
ctrlEnable[88008,false];
ctrlEnable[88010,false];
ctrlEnable[88011,false];

lbClear _cPlayerList;
lbClear _cServiceList;
lbClear _cFriendList;
{

	if(_x != player) then
	{
		switch(side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {
				if(str _x in life_listMedic) exitWith {_type = "Medecin";};
				if(str _x in life_listMecano) exitWith {_type = "Mecano";};
				if(str _x in life_listMerce) exitWith {_type = "Mercenaire";};
				if(str _x in life_listConces) exitWith {_type = "Concessionaire";};
			};
		};
		if(getPlayerUID _x in life_friendList) then
		{
			_cFriendList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
			_cFriendList lbSetData [(lbSize _cFriendList)-1,str(_x)];
		};
		_Plist pushBack [format["%1 (%2)",_x getVariable["realname", name _x],_type],_x];
	};
} forEach playableUnits;

_Plist sort true;
{
	_cPlayerList lbAdd format["%1",(_x select 0)];
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x select 1)];
}foreach _Plist;



if({side _x == west} count playableUnits > 0) then {
	_cServiceList lbAdd "Gendarmerie";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,"police"];
};
if({side _x == independent && (str _x in life_listMedic)} count playableUnits > 0) then {
	_cServiceList lbAdd "Medecin";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,"medic"];
};
if({side _x == independent && (str _x in life_listMecano)} count playableUnits > 0) then {
	_cServiceList lbAdd "Mecano";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,"mecano"];
};
if({side _x == independent && (str _x in life_listMerce)} count playableUnits > 0) then {
	_cServiceList lbAdd "Mercenaire";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,"merce"];
};
if({side _x == independent && (str _x in life_listConces)} count playableUnits > 0) then {
	_cServiceList lbAdd "Concessionaire";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,"conces"];
};
if((lbSize _cServiceList) == 0) then
{
	_cServiceList lbAdd "Pas de services";
	_cServiceList lbSetData [(lbSize _cServiceList)-1,""];
};
_data = life_messageList;
if(count _data == 0) exitWith {_cMessageDetail ctrlSetStructuredText parseText "Vous n'avez aucun message";};
reverse _data;
{
	_nameSender = _x select 1;
	_msg = SEL(_x,2);
	_rowData = [_x select 0,_nameSender,_msg];
	_msg = [_x select 2,40] call KRON_StrLeft;
	_cMessageList lnbAddRow[format["%1", _nameSender],format["%1 ...",_msg]];
	_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
}foreach _data;
reverse _data;
ctrlEnable[88011,true];