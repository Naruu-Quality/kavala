#include "..\..\script_macros.hpp"
/*
	File: fn_scalpel.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
#define SAFETY_ZONES    [["Mark_Safe_Zone_1", 550], ["Mark_Safe_Zone_2", 250], ["Mark_Safe_Zone_3", 100]]
private["_curTarget","_distance","_isVehicle","_isParaDrop","_title","_progressBar","_cP","_titleText","_sLock","_alarm","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if (({player distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) && playerSide == civilian) exitWith
{
	 hint parseText "ATTENTION ZONE SAFE, VOL D ORGANE INTERDIT!!!!";
};
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
if(!isPlayer _curTarget) exitWith {};
if(!(_curTarget getVariable ["organ",false])) exitWith {hint "La personne a deja perdu un organe..";};
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",localize "STR_ISTR_Scalpel_Process"];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 0.46;

	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",localize "STR_ISTR_Scalpel_Process"];

	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if((player getVariable ["restrained",false])) exitWith {};
	if((player getVariable ["restrainedciv",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if((player getVariable ["restrained",false])) exitWith {life_action_inUse = false;};
if((player getVariable ["restrainedciv",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
[true,"organ",1] call life_fnc_handleInv;
life_action_inUse = false;
_curTarget setVariable ["organ",false,true];
[] remoteExecCall ["life_fnc_organStole",_curTarget];
titleText[localize "STR_ISTR_Scalpel_Success","PLAIN"];
