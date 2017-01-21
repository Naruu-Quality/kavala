#include "..\..\script_macros.hpp"
/*
	fn_showMessage.sqf
*/
private ["_index", "_display", "_cFriendList", "_cMessageList", "_cMessageDetail", "_data", "_status", "_message"];
_index = _this select 0;

disableSerialization;
waitUntil {!isNull findDisplay 88000};
_display = findDisplay 88000;
_cFriendList = _display displayCtrl 88006;
_cMessageList = _display displayCtrl 88003;
_cMessageDetail = _display displayCtrl 88004;

_data = call compile (_cMessageList lnbData[_index,0]);
_status = "[HORS LIGNE]";
{
	if(getPlayerUID _x == _data select 0) then
	{
		_status = "[EN LIGNE]";
		life_messageTo = _x;
        [8] call life_fnc_updateSender;
        ctrlEnable[88008,true];
    };
}forEach playableUnits;

_message = format["Auteur: %1 - %2<br />Message: %3", SEL(_data,1), _status, SEL(_data,2)];
_cMessageDetail ctrlSetStructuredText (parseText _message);