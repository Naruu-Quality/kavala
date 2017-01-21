#include "..\..\script_macros.hpp"
/*
	File: fn_captureHideoutCustom.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah blah.
*/
private ["_group","_hideout", "_gangMark", "_myGang", "_posHide", "_gangName", "_action", "_cpRate", "_nbrMbr", "_title", "_ui", "_progressBar", "_titleText", "_cP", "_i", "_dcpRate", "_flagTexture", "_marker"];
_hideout = (nearestObjects[getPosATL player,["Land_Castle_01_tower_F"],75]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];
if(life_action_inUse)exitWith {};
_gangMark = _this select 3;
if(isNil {(group player) getVariable "gang_name"}) exitWith {[localize "STR_GNOTF_CreateGang"] spawn life_fnc_notifKava;};
_myGang = (group player) getVariable "gang_name";
if(_group == (group player)) exitWith {[localize "STR_GNOTF_Controlled"] spawn life_fnc_notifKava;};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {[localize "STR_GNOTF_Captured"] spawn life_fnc_notifKava;};
_posHide = getPos _hideout;
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.0006;
} else {
	_cpRate = 0.0008;
};

if(!isNil "_action" && {!_action}) exitWith {[localize "STR_GNOTF_CaptureCancel"] spawn life_fnc_notifKava;};
life_action_inUse = true;
[[0,7],"STR_GNOTF_CaptureCustomStart",true,[(group player) getVariable "gang_name"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
_nbrMbr = 1;
_nbrMbr = {(((group _x) getVariable "gang_name") ==  _myGang) && (alive _x) && (_x distance _posHide < 100)} count playableUnits;
//Setup the progress bar
disableSerialization;
_title = format ["Capture de zone (%1 Membres actif)",_nbrMbr];
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_i = 0;
_dcpRate = _cpRate;
_cpRate = _dcpRate * _nbrMbr;
while {true} do {
	if(_i >= 10) then
	{
		_nbrMbr = {(((group _x) getVariable "gang_name") ==  _myGang) && (alive _x) && (_x distance _posHide < 100)} count playableUnits;
		_title = format ["Capture de zone (%1 Membres actif)",_nbrMbr];
		_i = 0;
		_cpRate = _dcpRate * _nbrMbr;
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout setVariable ["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable ["inCapture",false,true];};
	if(_nbrMbr == 0)exitWith {};
	if(life_istazed) exitWith {_hideout setVariable ["inCapture",false,true];}; //Tazed
	if(life_isknocked) exitWith {_hideout setVariable ["inCapture",false,true];}; //Knocked
	_i = _i + 1;
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(_nbrMbr == 0)exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if((player getVariable["restrainedciv",false])) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
life_action_inUse = false;

titleText["Usine d'arme capturé.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[0,7],"STR_GNOTF_CaptureCustomSuccess",true,[name player,(group player) getVariable "gang_name"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
_hideout setVariable ["inCapture",false,true];
_hideout setVariable ["gangOwner",group player,true];


deleteMarker _gangMark;
_marker = createMarker [_gangMark,getPos _hideout];
_marker setMarkerType "mil_triangle";
_marker setMarkerPos getPos _hideout;
_marker setMarkerText format['Usine Arme Control: %1',(group player) getVariable "gang_name"];
_marker setMarkerColor ("ColorRed");

