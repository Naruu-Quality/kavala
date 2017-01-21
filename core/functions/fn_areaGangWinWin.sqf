#include "..\..\script_macros.hpp"
/*
	fn_areaGangWinWin.sqf
*/

private ["_nbrOwner"];

if(playerSide != civilian) exitWith {};

while {true}do
{
	sleep 900;
	
	if(!(isNil {group player getVariable "gang_name"}))then
	{		
		_nbrOwner = 0;
		{
			if((_x getVariable ["gangOwnerName",""]) == (group player getVariable "gang_name"))then {_nbrOwner = _nbrOwner + 1;};
		}foreach [gang_obj_1,gang_obj_2,gang_obj_3];

		if(_nbrOwner != 0)then
		{
			ADD(life_KavaBank,(_nbrOwner * 2500));
			life_gangAreaOwner = _nbrOwner;
			hint format["Ton gang controle %1 zone de gang et cela a generer %2$ de revenu", _nbrOwner, (_nbrOwner * 2500)];
			systemChat format["Ton gang controle %1 zone de gang et cela a generer %2$ de revenu", _nbrOwner, (_nbrOwner * 2500)];
		};
	};
}; 