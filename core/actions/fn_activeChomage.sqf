#include "..\..\script_macros.hpp"
/*
	File: fn_activeChomage.sqf
*/
private["_type","_varName","_displayName","_sideFlag","_price"];


if(life_chomage)exitWith {hint parseText "Tu es déja inscrit au chomage.";};
if(life_KavaCash < 500000)then
{
	if(life_KavaBank < 500000)then
	{
		hint parseText "Tu es maintenant inscrit au service du chomage et tu touchera bientôt ton prochain salaire";
		life_chomage = true;
	}else
	{
		hint parseText "Tu as trop d'argent et ne peux pas bénéficier des services du chomage";
	};
}else
{
	hint parseText "Tu as trop d'argent et ne peux pas bénéficier des services du chomage";
};
