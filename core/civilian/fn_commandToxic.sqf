#include "..\..\script_macros.hpp"
/*
	fn_commandToxic.sqf
	0 active melange
	1 reprograme ID
	2 desamorce
	3 active explosion
*/

private ["_type", "_bombe", "_state", "_fail", "_ui", "_progress", "_pgText", "_cP", "_tmp"];
_type = _this select 3;
if(_type == 4)exitWith
{
	 _marker = createMarker ["toxicpaid", (_this select 2)];
	"toxicpaid" setMarkerColorLocal "ColorRed";
	"toxicpaid" setMarkerTextLocal "Commenditaire attaque toxic";
	"toxicpaid" setMarkerTypeLocal "mil_dot";
	deleteMarker "toxicWarn";
	life_toxicPaid = true;
	sleep (45*60);
	life_toxicPaid = false;
	deleteMarkerLocal "toxicpaid";
};

_bombe = (nearestObjects[getPosATL player,["Land_BuoyBig_F"],15]) select 0;
_state = _bombe getVariable ["ToxicState", 0];
if(_state == 4)exitWith {[localize "STR_Toxic_AlreadyReprog"] spawn life_fnc_notifKava;};
_fail = false;

if(_type == 3)exitWith
{
	if(_state != 2)exitWith {[localize "STR_Toxic_NoActive"] spawn life_fnc_notifKava;};
	if((_bombe getVariable ["ToxicID", 0]) != (getPlayerUID player)) exitWith {[localize "STR_Toxic_OnnlyOwnerActive"] spawn life_fnc_notifKava;}; 
	_bombe setVariable ["ToxicState", 3, true];
	[localize "STR_Toxic_WorkActive"] spawn life_fnc_notifKava;
	if(life_HC_isActive) then {
		[_bombe,player,3] remoteExec ["HC_fnc_manageToxic",HC_Life];
	}else
	{
		[_bombe,player,3] remoteExec ["TON_fnc_manageToxic",RSERV];
	};
};

if(_type == 0)then
{
	if(_state != 0)exitWith {[localize "STR_Toxic_NoMix"] spawn life_fnc_notifKava;};
	[localize "STR_Toxic_ActiveMix"] spawn life_fnc_notifKava;
	life_action_inUse = true;
	_tmp = _bombe getVariable ["ToxicState",0];
	_bombe setVariable ["ToxicState", 4, true];
	
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = GVAR_UINS "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",localize "STR_Toxic_DispMix"];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	[player,"Acts_carFixingWheel","playMove",true] remoteExec ["life_fnc_animSync",RCLIENT];
	while{true} do {
		sleep 0.45;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",localize "STR_Toxic_DispMix"];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {_fail};
		if(player != vehicle player) exitWith {_fail};
		if(life_interrupted) exitWith {_fail=true;};
	};
	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	[player,""]  remoteExec ["life_fnc_animSync",RCLIENT];
	player playActionNow "stop";
	player switchMove "";
	_bombe setVariable ["ToxicState", _tmp, true];
	if(_fail)exitWith {[localize "STR_NOTF_ActionCancel"] spawn life_fnc_notifKava;};
	[_bombe,"toxicArm",25] remoteExec ["life_fnc_playSound",RCLIENT];
	 _marker = createMarker ["toxicWarn", (position _bombe)];
	"toxicWarn" setMarkerColor "ColorRed";
	"toxicWarn" setMarkerText "!!! Zone Explosion Toxic!!!";
	"toxicWarn" setMarkerType "mil_dot";
	
	_bombe setVariable ["ToxicID", (getPlayerUID player), true];
	if(life_HC_isActive) then {
		[_bombe,player,0] remoteExec ["HC_fnc_manageToxic",HC_Life];
	}else
	{	
		[_bombe,player,0] remoteExec ["TON_fnc_manageToxic",RSERV];
	};
	
}else
{
	if(_type == 1)then
	{
		if(!(_state in [1,2]))exitWith {[localize "STR_Toxic_NoReprog"] spawn life_fnc_notifKava;};
		if((getPlayerUID player) == (_bombe getVariable ["ToxicID",0]))exitWith {[localize "STR_Toxic_AlreadyOwner"] spawn life_fnc_notifKava;};
		[localize "STR_Toxic_StartReprog"] spawn life_fnc_notifKava;
		_tmp = _bombe getVariable ["ToxicState",0];
		_bombe setVariable ["ToxicState", 4, true];
		life_action_inUse = true;
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%", localize "STR_Toxic_DispReprog"];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		[player,"Acts_carFixingWheel","playMove",true] remoteExec ["life_fnc_animSync",RCLIENT];
		while{true} do {
			sleep 0.45;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",localize "STR_Toxic_DispReprog"];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {_fail};
			if(player != vehicle player) exitWith {_fail};
			if(life_interrupted) exitWith {_fail=true;};
		};
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		[player,""]  remoteExec ["life_fnc_animSync",RCLIENT];
		player playActionNow "stop";
		player switchMove "";
		_bombe setVariable ["ToxicState", _tmp, true];
		if(_fail)exitWith {[localize "STR_NOTF_ActionCancel"] spawn life_fnc_notifKava;};
		[_bombe,"toxicArm",25] remoteExec ["life_fnc_playSound",RCLIENT];
		[localize "STR_Toxic_WorkReprog"] spawn life_fnc_notifKava;
		
		_bombe setVariable ["ToxicID", (getPlayerUID player), true];
		if(life_HC_isActive) then {
			[_bombe,player,1] remoteExec ["HC_fnc_manageToxic",HC_Life];
		}else
		{
			[_bombe,player,1] remoteExec ["TON_fnc_manageToxic",RSERV];
		};
		
	}else
	{
		[localize "STR_Toxic_StartDisarm"] spawn life_fnc_notifKava;
		_tmp = _bombe getVariable ["ToxicState",0];
		_bombe setVariable ["ToxicState", 4, true];
		life_action_inUse = true;
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",localize "STR_Toxic_DispDisarm"];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		[player,"Acts_carFixingWheel","playMove",true]  remoteExec ["life_fnc_animSync",RCLIENT];
		while{true} do {
			sleep 0.45;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",localize "STR_Toxic_DispDisarm"];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {_fail};
			if(player != vehicle player) exitWith {_fail};
			if(life_interrupted) exitWith {_fail=true;};
		};
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		[player,""]  remoteExec ["life_fnc_animSync",RCLIENT];
		player playActionNow "stop";
		player switchMove "";
		_bombe setVariable ["ToxicState", _tmp, true];
		if(_fail)exitWith {[localize "STR_NOTF_ActionCancel"] spawn life_fnc_notifKava;};
		[_bombe,"toxicArm",25] remoteExec ["life_fnc_playSound",RCLIENT];
		life_toxicPaid = true;
		_bombe setVariable ["ToxicID", (getPlayerUID player), true];
		[localize "STR_Toxic_WorkDisarm"] spawn life_fnc_notifKava;
		if(life_HC_isActive) then {
			[_bombe,player,2] remoteExec ["HC_fnc_manageToxic",HC_Life];
		}else
		{
			[_bombe,player,2] remoteExec ["TON_fnc_manageToxic",RSERV];
		};
	};
};
life_interrupted =false;