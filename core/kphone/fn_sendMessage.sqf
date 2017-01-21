#include "..\..\script_macros.hpp"
/*
	fn_sendMessage.sqf
*/
private ["_type", "_msg", "_target"];

_type = _this select 0;
_target = life_messageTo;
// if(life_messageTo == "")exitWith {};
_msg = ctrlText 88007;
if(_msg == "") exitWith {hint parseText "Tu dois ecrire un message!";};
closeDialog 0;
if(typeName _target == "STRING")then
{
	if(_target == "police")exitWith {[2,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",west];hint format["Tu as envoyer un message à la police: %1", _msg];[] spawn life_fnc_callCop;};
	if(_target == "medecin")exitWith {[3,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au médecins: %1", _msg];};
	if(_target == "mecano")exitWith {[8,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au mecano: %1", _msg];};
	if(_target == "merce")exitWith {[11,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au mercenaire: %1", _msg];};
	if(_target == "conces")exitWith {[12,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au concesionnaire: %1", _msg];};
	if(_target == "worker")exitWith {[13,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au fabricant: %1", _msg];};
	if(_target == "mineur")exitWith {[14,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",independent];hint format["Tu as envoyer un message au mineur: %1", _msg];};
	if(_target == "admin")exitWith {[5,_msg,name player,player,mapGridPosition player] remoteExec ["life_fnc_receiveMessage",RCLIENT];hint format["Tu as envoyer un message aux Admins: %1", _msg];};
	if(_target == "adminAll")exitWith {[6,_msg,name player,player] remoteExec ["life_fnc_receiveMessage",RCLIENT];hint format["Tu as envoyer un message admin à tout les joueurs: %1", _msg];};
}else
{
	_target = call compile format["%1",_target];
	if(_type)then
	{
		[7,_msg,name player,player] remoteExec ["life_fnc_receiveMessage",_target];
		hint format["Tu as envoyer un message Admin à %1 Message: %2",name _target, _msg];
	}else
	{
		[0,_msg,name player,player] remoteExec ["life_fnc_receiveMessage",_target];
		hint format["Tu as envoyer un message à %1 Message: %2",name _target, _msg];
	};
};
life_messageTo = "";