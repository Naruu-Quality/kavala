/*
	fn_toxicAddAction.sqf
*/
if(!hasInterface && !isDedicated)exitWith {};
_bombe = param [0,ObjNull,[ObjNull]];

private["_item"];
if(isNull _bombe) exitWith {};
_bombe addAction[localize "STR_Toxic_BombActionMelange",life_fnc_commandToxic,0,0,false,false,"",'playerSide == Civilian && !life_action_inUse'];
_bombe addAction[localize "STR_Toxic_BombActionOwner",life_fnc_commandToxic,1,0,false,false,"",'playerSide == Civilian && !life_action_inUse'];
_bombe addAction[localize "STR_Toxic_BombActionDisarm",life_fnc_commandToxic,2,0,false,false,"",'!life_action_inUse'];
_bombe addAction[localize "STR_Toxic_BombActionActive",life_fnc_commandToxic,3,0,false,false,"",'playerSide == Civilian && !life_action_inUse'];
