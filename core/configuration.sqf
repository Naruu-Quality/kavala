#include "..\script_macros.hpp"
/*
	File: configuration.sqf
	Author:

	Description:
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*/

//
// System Variable
//
life_session_completed = false;
life_trunk_vehicle = Objnull;
life_sitting = objNull;
life_session_tries = 0;
life_pos_exist = false;
life_pos_attach = [];
life_markerDeath = "med_car_1";
life_pickup_item_array = [];
life_fed_break = 0;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_activeObj = ObjNull;
life_clothing_filter = 0;
errorProgress = 0;
life_noSound = 0;
life_KavaNotif = [];
life_KavaNotif1 = [0,""];
life_KavaNotif2 = [0,""];
life_KavaNotif3 = [0,""];
life_KavaNotif4 = [0,""];
life_KavaNotif5 = [0,""];
life_KavaNotif6 = [0,""];

//
//	Check Variable
//
life_action_delay = time;
life_garage_store = false;
life_action_inUse = false;
life_interrupted = false;
life_siren_active = false;
life_is_processing = false;
life_bail_paid = false;
life_disable_getIn = false;
life_disable_getOut = false;

//
//	Admin Variable
//
life_god = false;
life_frozen = false;
life_admin_debug = false;
life_markersvaar = false;
life_adminSpyName = false;
life_adminESP = false;

//
// Config Player Variable
//
life_respawnTimer = 0;
life_toxicArea = false;
life_messageList = [];
life_messageTo = "";
if(count (profileNamespace getVariable ["life_KavaFilter",[]]) == 0)then
{
	life_filter = [true,true,true,true,true,false,true,true,true,true];
	profileNamespace setVariable ["life_KavaFilter",life_filter];
}else
{
	life_filter = (profileNamespace getVariable "life_KavaFilter");
};

//
//	Skills Info
//
life_skillGather = 0;
life_skillGatherCount = 0;
life_skillProcess = 0;
life_skillProcessCount = 0;
life_skillRepair = 0;
life_skillRepairCount = 0;
life_skillLock = 0;
life_skillLockCount = 0;


life_shootNear = false;
life_shootNearTime = time;
life_gangAreaOwner = 0;
life_isImpound = false;
life_RadarActive = true;
life_RadarNumber = 0;
life_corpse = objNull;
life_weaponsTracking = 
[
	"hgun_P07_snds_F",
	"arifle_SDAR_F",
	"hgun_PDW2000_F",
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_02_F",
	"SMG_02_F",
	"srifle_LRR_camo_F",
	"srifle_EBR_F",
	"arifle_Katiba_F",
	"arifle_MX_F",
	"LMG_Mk200_F",
	"arifle_TRG21_F",
	"arifle_Mk20_plain_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_06_camo_F",
	"srifle_GM6_F",
	"arifle_Mk20C_F",
	"arifle_MX_Black_F",
	"arifle_MXM_Black_F",
	"arifle_MX_SW_Black_F",
	"srifle_LRR_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_03_khaki_F",
	"arifle_AKM_F",
	"arifle_SPAR_03_snd_F",
	"arifle_AKS_F",
	"arifle_CTAR_hex_F"
];

//Settings
life_settings_viewDistanceFoot = GVAR_PNAS["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = GVAR_PNAS["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = GVAR_PNAS["life_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_seatbelt = false;
life_save_gear = [];
life_civ_position = [];
life_WhiteList = false;
life_vehGarage = 0;
life_vehGarageMax = 8;
life_houseMax = 4;
life_friendList = [];
life_spotDrugs = [false,false,false,false];
life_jailTimer = 0;
life_HackRadio = false;
life_toxicPaid = false;
life_use_atm = true;
life_is_arrested = false;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
life_blood = 5000;
life_isBleeding = false;
life_isBroken = false;
life_KavaCash = 0;
life_showHealth = false;
life_showVehHealth = false;
life_curWep_h = "";
life_istazed = false;
life_isknocked = false;
life_vehicles = [];
life_chomage = true;
life_makeRapport = false;
life_indep_active = false;


life_listMedic = ["medic_1","medic_2","medic_3","medic_4","medic_5","medic_6","medic_7","medic_8","medic_9","medic_10"];
life_listMecano = ["mecano_1","mecano_2","mecano_3","mecano_4","mecano_5"];
life_listMerce = ["merce_1","merce_2","merce_3","merce_4","merce_5","merce_6","merce_7","merce_8","merce_9","merce_10","merce_11","merce_12","merce_13","merce_14","merce_15"];
life_listConces = ["conces_1","conces_2","conces_3"];

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");

	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));

{
	if(!_x)then
	{
		[_forEachIndex+1,0] call life_fnc_s_onCheckedFilter;
	};
}foreach life_filter;