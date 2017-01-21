#include "..\..\script_macros.hpp"
/*
	file: fn_smartphoneUpdate.sqf
*/

private ["_data"];
_data = _this select 0;
if(count _data == 0) exitWith {};
life_messageList = _data;