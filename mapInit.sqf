/*
	by Nark0t1k
	Init NPC
	[this,0] execVM "mapInit.sqf";
	null = [this,1000] execVM "mapInit.sqf";
*/
private["_unit","_type","_b"];
_unit = _this select 0;
_type = _this select 1;
switch (_type) do
{
	// 0 - Market Civile
	case 0:{_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"market"]; _unit setVariable["realname","Marché"];};
	// 1 - General Store
	case 1:{_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore"]; _unit setVariable["realname","Magasin Equipement"];_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "hemttplan" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "hemttplan" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"hemttplan",0,false,false,"",'!license_civ_rebel &&  license_civ_trucking && playerSide == civilian '];_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "tempest" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "tempest" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"tempest",0,false,false,"",'!license_civ_rebel &&  license_civ_trucking && playerSide == civilian '];};
	// 2 - Clothing Store Civile
	case 2:{_unit addAction[localize"STR_MAR_Clothing_Store",life_fnc_clothingMenu,"bruce"]; _unit setVariable["realname","Vendeur Vêtement"];};
	// 3 - Fish Shop
	case 3:{_unit addAction[localize "STR_MAR_Fish_Market",life_fnc_virt_menu,"fishmarket"]; _unit setVariable["realname","Marchand Poisson"];};
	// 4 - Station Service Shop NON BRAQUABLE
	case 4:{_unit addAction[localize"STR_MAR_Station_Shop",life_fnc_weaponShopMenu,"f_station_store"]; _unit addAction[localize"STR_Shop_Station_Coffee",life_fnc_virt_menu,"f_station_coffee"];};
	// 5 - Vendeur Permis
	case 5:{_unit addAction["Permis",life_fnc_licenses,["identite","driver","boat","trucking","pilot","home","gun"],0,true,true,"",' playerSide == civilian ']; _unit setVariable["realname","Bureau Permis"];};
	// 6 - Permis Formation
	// case 6:{};
	// 7 - Chomage
	case 7:{_unit addAction["Inscription Chomage",life_fnc_activeChomage,""]; _unit setVariable["realname","Bureau Chomage"];};
	// 8 - Store Plonger
	case 8:{removeallWeapons _unit; _unit addAction[localize"STR_MAR_Diving_Shop",life_fnc_clothingMenu,"dive"]; _unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "dive" >> "displayName")),[(getNumber(missionConfigFile >> "Licenses" >> "dive" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"dive",0,false,false,"",' !license_civ_dive && playerSide == civilian '];};
	// 9 - Store Banque
	case 9:{_unit addAction[localize"STR_Shops_Banque",life_fnc_virt_menu,"banque"]; _unit setVariable["realname","Guichet Banque"];};
	// 10 - Store Kart "kart_shop_1"
	case 10:{_unit addAction[localize"STR_MAR_GoKart_Shop",life_fnc_vehicleShopMenu,["kart_shop",civilian,"kart_shop_1","civ","Bobby's Kart Shack"]]; _unit addAction[localize"STR_Shops_C_Kart",life_fnc_clothingMenu,"kart"];};
	// 11 - Station Service Shop BRAQUABLE
	case 11:{_unit addAction[localize"STR_MAR_Station_Shop",life_fnc_weaponShopMenu,"f_station_store"]; _unit addAction[localize"STR_Shop_Station_Coffee",life_fnc_virt_menu,"f_station_coffee"];_unit addAction["Braquer",life_fnc_stealPlace,_target,0,true,true,"",' playerSide == civilian '];};
	// 12 - Medic Assistance
	case 12:{_unit addAction[localize"STR_MAR_Medical_Assistance",life_fnc_healHospital];};
	// 13 - Weapon Shop Civil
	case 13:{_unit addAction[localize"STR_Shops_W_Gun",life_fnc_weaponShopMenu,"gun",0,false,false,"",' license_civ_gun && playerSide == civilian']; _unit addAction[localize "STR_Shops_C_Gun",life_fnc_clothingMenu,"gun_clothing",0,false,false,"",' license_civ_gun && playerSide == civilian']; _unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "gun" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"gun",0,false,false,"",' !license_civ_gun && playerSide == civilian ']; };
	// 14 - Custom Vehicle Shop
	case 14:{};
	// 16 - Marchand Assurance
	case 16:{_unit addAction["Assurance Personne",life_fnc_insureDiagOpen, 1, 3, true, true, "", ' _this distance _target < 5 && !life_action_inUse'];};
	// 17 - Marchand Mecano
	case 17:{_unit addAction["Marchand CDD",life_fnc_weaponShopMenu,"f_station_cdd"];_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"mecano"]; _unit addAction[localize"STR_MAR_Meca_Clothing_Shop",life_fnc_clothingMenu,"mecano_clothing"];_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["cdd_shop",independent,["cdd_car_1","cdd_car_1_1"],"mecano","Bruce's New & Used Auto's"]];_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cdd_car_1";  }];_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};	
	// 171 - Marchand Mecano
	case 171:{_unit addAction["Marchand CDD",life_fnc_weaponShopMenu,"f_station_cdd"]; _unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"mecano"]; _unit addAction[localize"STR_MAR_Meca_Clothing_Shop",life_fnc_clothingMenu,"mecano_clothing"]; _unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["cdd_shop",independent,["cdd_car_2","cdd_car_2_1"],"mecano","Bruce's New & Used Auto's"]]; _unit addAction[localize"STR_MAR_Helicopter_Shop",life_fnc_vehicleShopMenu,["cdd_shop2",independent,["cdd_car_2","cdd_car_2_1"],"mecano","Bruce's New & Used Auto's"]];_unit addAction["Garage Voiture",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cdd_car_2";  }];_unit addAction["Garage Helico",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cdd_car_2";  }];_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};	
	// 18 - Antenne Radio Diffusion
	case 18:{_unit addAction[localize"STR_News_AddAction",life_fnc_newsBroadcast,"",1.5,false,false,"",'isNull objectParent player && player distance _target < 4'];_unit addAction["Pirater Radio",life_fnc_hackRadio,"",1.5,false,false,"",'isNull objectParent player && player distance _target < 4 && license_civ_rebel'];};
	// 181 Antenne Radio Police
	case 181:{_unit addAction[localize"STR_News_AddAction",life_fnc_newsBroadcast,"",1.5,false,false,"",'isNull objectParent player && player distance _target < 4 && playerSide == west'];};
	// 182 Antenne Radio Independent
	case 182:{_unit addAction[localize"STR_News_AddAction",life_fnc_newsBroadcast,"",1.5,false,false,"",'isNull objectParent player && player distance _target < 4 && playerSide == independent'];};
	// 19 - Acheteur Armes
	case 19:{_unit addAction["Vendre Armes",life_fnc_weaponShopMenuSell,"weaponBuy",0,false,false,"",' playerSide == civilian'];};
	
	
	
	// 20 - Hotel de Ventes
	case 20:{_unit addAction ["Victor Market", {[] spawn life_fnc_vAH_load;},"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian ']; _unit setVariable["realname","Hotel de Vente"];};
	// 21 - Chop Shop "chop_shop_1"
	case 21:{_unit addAction[localize"STR_ChopShop_Title",life_fnc_chopShopMenu,"chop_shop_1"];};
	// 22 - Chop Shop "chop_shop_2"
	case 22:{_unit addAction[localize"STR_ChopShop_Title",life_fnc_chopShopMenu,"chop_shop_2"];};
	// 23 - Chop Shop "chop_shop_3"
	case 23:{_unit addAction[localize"STR_ChopShop_Title",life_fnc_chopShopMenu,"chop_shop_3"];};
	// 24 - Chop Shop "chop_shop_4"
	case 24:{_unit addAction[localize"STR_ChopShop_Title",life_fnc_chopShopMenu,"chop_shop_4"];};
	// 25 - Chop Shop "chop_shop_5"
	case 25:{_unit addAction[localize"STR_ChopShop_Title",life_fnc_chopShopMenu,"chop_shop_5"];};	
	
	// 30 - Gardien Prison
	case 30:{removeAllWeapons _unit; _unit addAction[localize"STR_MAR_Pay_Bail",life_fnc_postBail,"",0,false,false,"",' isNil "life_canpay_bail" && life_is_arrested '];_unit addAction[localize"STR_MAR_Show_Jail",life_fnc_askJailTime,"",0,false,false,"",' life_is_arrested '];};
	
	
	
	// 31 - Shop Police
	case 31:{
		_unit addAction[localize"STR_MAR_FreeCop_Item_Shop",life_fnc_virt_menu,"freecop"];	
		_unit addAction[localize"STR_MAR_Cop_Item_Shop",life_fnc_virt_menu,"cop"]; 
		_unit addAction["Equipement Gendarmerie",life_fnc_weaponShopMenu,"cop_item"]; 
		_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cAir",0,false,false,"",' !license_cop_cAir && playerSide == west ']; 
		_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "cg" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cg" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cg",0,false,false,"",' !license_cop_cg && playerSide == west ']; 
		_unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];
	};
	
	
	
	
	
	// 32 - Recolte Fouille Eau
	case 32:{_unit addAction[localize"STR_Gather_FouilleEau",life_fnc_gatherWater,"",0,false,false,"",' vehicle player == player && player distance _target < 10 && playerSide == civilian && !life_action_inUse '];};
	
	// 50 - Vendeur Voiture Civile : ["civ_car_1","civ_car_1_1"]
	case 50: {_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_1","civ_car_1_1"],"civ","Bruce's New & Used Auto's"]]; _unit setVariable["realname", "Car Shop"];};
	// 51 - Vendeur Voiture Civile : ["civ_car_2","civ_car_2_1"]
	case 51: {_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_2","civ_car_2_1"],"civ","Bruce's New & Used Auto's"]]; _unit setVariable["realname", "Car Shop"];};
	// 52 - Vendeur Voiture Civile : ["civ_car_3","civ_car_3_1"]
	case 52: {_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_3","civ_car_3_1"],"civ","Bruce's New & Used Auto's"]]; _unit setVariable["realname", "Car Shop"];};
	// 523- Vendeur Voiture Civile : ["civ_car_4","civ_car_4_1"]
	case 53: {_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_4","civ_car_4_1"],"civ","Bruce's New & Used Auto's"]]; _unit setVariable["realname", "Car Shop"];};
	// 54 - Vendeur Voiture Civile : ["civ_car_5","civ_car_5_1"]
	case 54: {_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_5","civ_car_5_1"],"civ","Bruce's New & Used Auto's"]]; _unit setVariable["realname", "Car Shop"];};
	// 55 - Vendeur Garage Voiture Police : "cop_car_1"
	case 55: {_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_1","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_car_1"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setVariable["realname","Cop Vehicle Store"]; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 56 - Vendeur Garage Voiture Police : "cop_car_2"
	case 56: {_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_2","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_car_2"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setVariable["realname","Cop Vehicle Store"]; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 57 - Vendeur Garage Voiture Police : "cop_car_3"
	case 57: {_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_3","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_car_3"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setVariable["realname","Cop Vehicle Store"]; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 58 - Vendeur Garage Voiture Police : "cop_car_4"
	case 58: {_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_4","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_car_4"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setVariable["realname","Cop Vehicle Store"]; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 59 - Vendeur Garage Voiture Police : "cop_car_5"
	case 59: {_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["cop_car",west,"cop_car_5","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_car_5"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setVariable["realname","Cop Vehicle Store"]; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	


	// 600 - Kavala Garage Voiture Civile : "car_g_1"
	case 600: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_1";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 601 - Sofia Garage Voiture Civile : "car_g_2"
	case 601: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_2";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 602 - Athira Garage Voiture Civile : "car_g_3"
	case 602: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_3";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 603 -  Agios Garage Voiture Civile : "car_g_4"
	case 603: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_4";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 604 - Pyrgos Voiture Civile : "car_g_5"
	case 604: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_5";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 605 - Aeroport Central Garage Voiture Civile : "car_g_6"
	case 605: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_6";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 606 - Garage Donateur Garage Voiture Civile : "car_g_7"
	case 606: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_7";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 607 - Hopital Nord Sofia Garage Voiture Civile : "car_g_8"
	case 607: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_8";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	// 608 - Garage Voiture Civile : "car_g_9"
	case 608: {_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "car_g_9";  }];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];};
	
	// 650 - Fourriere Civile : VOITURE "four_c_1" HELICO: "four_a_1"
	case 650: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_1";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_1";  }];};
	// 651 - Fourriere Civile : VOITURE "four_c_2" HELICO: "four_a_2"
	case 651: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_2";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_2";  }];};
	// 652 - Fourriere Civile : VOITURE "four_c_3" HELICO: "four_a_3"
	case 652: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_3";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_3";  }];};
	// 653 - Fourriere Civile : VOITURE "four_c_4" HELICO: "four_a_4"
	case 653: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_4";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_4";  }];};
	// 654 - Fourriere Civile : VOITURE "four_c_5" HELICO: "four_a_5"
	case 654: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_5";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_5";  }];};
	// 655 - Fourriere Civile : VOITURE "four_c_6" HELICO: "four_a_6" BATEAU "four_a_6"
	case 655: {_unit addAction["Fourrière Voiture",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_c_6";  }]; _unit addAction["Fourrière Helico",  {   if(life_HC_isActive) then {	[true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_a_6";  }];_unit addAction["Fourrière Bateaux",  {   if(life_HC_isActive) then {	[getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [true,getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Ship";life_isImpound = true;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "four_b_6";  }];};  
	
	// 65 - Vendeur Garage Helico Police : "cop_air_1"
	case 65: {_unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["cop_air",west,"cop_air_1","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_air_1"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 66 - Vendeur Garage Helico Police : "cop_air_2"
	case 66: {_unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["cop_air",west,"cop_air_2","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_air_2"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 67 - Vendeur Garage Helico Police : "cop_air_3"
	case 67: {_unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["cop_air",west,"cop_air_3","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_air_3"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
	// 68 - Vendeur Garage Helico Police : "cop_air_4"
	case 68: {_unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["cop_air",west,"cop_air_4","cop","APD - Kavala District"]];  _unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "cop_air_4"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == west'];  _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store']; _unit setObjectTextureGlobal [0,"textures\Polo_Gendarmerie.paa"];};
		
	// 80 - Process Frite
	case 80:{_unit addAction[localize"STR_Process_Pdt",life_fnc_processAction,"frite",0,false,false,"",' life_inv_pdt > 0 && !life_is_processing'];};
	// 81 - Process WoodPlank
	case 81:{_unit addAction[localize"STR_Process_Woodplank",life_fnc_processAction,"woodplank",0,false,false,"",' life_inv_wood > 0 && !life_is_processing'];};
	// 82 - Process Cement
	case 82:{_unit addAction[localize"STR_Process_Cement",life_fnc_processAction,"cement",0,false,false,"",' life_inv_rock > 0 && !life_is_processing'];};
	// 83 - Process Sand
	case 83:{_unit addAction[localize"STR_Process_Sand",life_fnc_processAction,"sand",0,false,false,"",' life_inv_sand > 0 && !life_is_processing'];};
	// 84 - 
	case 84:{};
	// 85 - Process Copper
	case 85:{_unit addAction[localize"STR_Process_Copper",life_fnc_processAction,"copper",0,false,false,"",' life_inv_copperUnrefined > 0 && !life_is_processing'];  };
	// 86 - Process Iron
	case 86:{_unit addAction[localize"STR_Process_Iron",life_fnc_processAction,"iron",0,false,false,"",' life_inv_ironUnrefined > 0 && !life_is_processing'];  };
	// 87 - Process Silver
	case 87:{_unit addAction[localize"STR_Process_Silver",life_fnc_processAction,"silver",0,false,false,"",' life_inv_silverUnrefined > 0 && !life_is_processing'];  };
	// 88 - Process Salt
	case 88:{_unit addAction[localize"STR_Process_Salt",life_fnc_processAction,"salt",0,false,false,"",' life_inv_saltUnrefined > 0 && !life_is_processing'];  };
	// 89 - Process Oil
	case 89:{_unit addAction[localize"STR_Process_Oil",life_fnc_processAction,"oil",0,false,false,"",' life_inv_oilUnprocessed > 0 && !life_is_processing'];  };
	// 90 - Process Diamond
	case 90:{_unit addAction[localize"STR_Process_Diamond",life_fnc_processAction,"diamond",0,false,false,"",' life_inv_diamondUncut > 0 && !life_is_processing'];  };
	// 91 - Process Diamond 2
	case 91:{_unit addAction[localize"STR_Process_Diamond",life_fnc_processAction,"diamond2",0,false,false,"",' life_inv_diamondCut > 0 && !life_is_processing'];  };
	// 92 - Process Marijuana
	case 92:{_unit addAction[localize"STR_Process_Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",' life_inv_cannabis > 0 && !life_is_processing'];  };
	// 93 - Process Heroin
	case 93:{_unit addAction[localize"STR_Process_Heroin",life_fnc_processAction,"heroin",0,false,false,"",' life_inv_heroinUnprocessed > 0 && !life_is_processing'];};
	// 94 - Process Cocaine
	case 94:{_unit addAction[localize"STR_Process_Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",' life_inv_cocaineUnprocessed > 0 && !life_is_processing'];};
	// 95 - Process fouilleeau
	case 95:{_unit addAction[localize"STR_Process_FouilleEau",life_fnc_processAction,"fouilleeau",0,false,false,"",' life_inv_fouilleEau > 0 && !life_is_processing'];_unit addAction[localize"STR_Process_FouilleTerre",life_fnc_processAction,"fouilleterre",0,false,false,"",' life_inv_fouilleTerre > 0 && !life_is_processing'];};
	// 96 - Process fouilleterre
	case 96:{};
	// 97 - Distilerie Process wisky1 biere1 bouteille
	case 97:{_unit addAction[localize"STR_Process_Wisky",life_fnc_processAction,"wisky1",0,false,false,"",' life_inv_malt > 0 && life_inv_levure > 0 && !life_is_processing']; _unit addAction[localize"STR_Process_Biere",life_fnc_processAction,"biere1",0,false,false,"",' life_inv_malt > 0 && life_inv_houblon > 0 && !life_is_processing']; _unit addAction[localize"STR_Process_Bouteille",life_fnc_processAction,"bouteille",0,false,false,"",' life_inv_glass > 0 && !life_is_processing'];};
	// 98 - Process wisky2 biere2
	case 98:{_unit addAction[localize"STR_Process_Vodka",life_fnc_processAction,"vodka",0,false,false,"",' life_inv_pdt > 0 && life_inv_bouteille > 0 && !life_is_processing']; _unit addAction[localize"STR_Process_Wisky",life_fnc_processAction,"wisky2",0,false,false,"",' life_inv_wiskyFerm > 0 && life_inv_bouteille > 0 && !life_is_processing']; _unit addAction[localize"STR_Process_Biere",life_fnc_processAction,"biere2",0,false,false,"",' life_inv_biereFerm > 0 && life_inv_bouteille > 0 && !life_is_processing'];};
	// 99 - 
	case 99:{};
	// 100 - 
	case 100:{};
	// 101 - Process Dechet Prison
	case 101:{_unit addAction[localize"STR_Process_Dechet",life_fnc_processActionJail,"dechet",0,false,false,"",' life_inv_dechet > 0 && !life_is_processing && life_is_arrested'];};
	// 102 - Process electricite
	case 102:{_unit addAction[localize"STR_Process_Electricite",life_fnc_processAction,"electricite",0,false,false,"",' life_inv_electricitePur > 0 && !life_is_processing'];};
	// 103 - Process meth 1
	case 103:{_unit addAction[localize"STR_Process_Meth",life_fnc_processAction,"meth1",0,false,false,"",' life_inv_methPur > 0 && !life_is_processing'];  };
	// 104 - Process meth 2
	case 104:{_unit addAction[localize"STR_Process_Meth",life_fnc_processAction,"meth2",0,false,false,"",' life_inv_methTraite > 0 && !life_is_processing'];  };
	// 105 - Process meth 3
	case 105:{_unit addAction[localize"STR_Process_Meth",life_fnc_processAction,"meth3",0,false,false,"",' life_inv_methLave > 0 && !life_is_processing'];  };
	// 106 - Process uranium 1
	case 106:{_unit addAction[localize"STR_Process_Uranium",life_fnc_processAction,"uranium1",0,false,false,"",' life_inv_uranium > 0 && !life_is_processing'];  };
	// 107 - Process uranium 2
	case 107:{_unit addAction[localize"STR_Process_Uranium",life_fnc_processAction,"uranium2",0,false,false,"",' life_inv_uraniumDesin > 0 && !life_is_processing'];  };
	
	// 130 - Electricite Trader
	case 130:{_unit addAction[localize"STR_MAR_Electricite_Trader",life_fnc_virt_menu,"electricite"];};
	// 131 - Oil Trader
	case 131:{_unit addAction[localize"STR_MAR_Oil_Trader",life_fnc_virt_menu,"oil"];};
	// 132 - Uranium Trader
	case 132:{_unit addAction[localize"STR_MAR_Uranium_Trader",life_fnc_virt_menu,"uranium"]; _unit addAction["Vetement Anti Radiation",life_fnc_weaponShopMenu,"antirad"]; _unit setVariable["realname","Magasin Uranium"];};
	// 133 - Glass Trader
	case 133:{_unit addAction[localize"STR_MAR_Glass_Trader",life_fnc_virt_menu,"glass"];};
	// 134 - Iron & Copper Trader
	case 134:{_unit addAction[localize"STR_MAR_Iron_Copper_Trader",life_fnc_virt_menu,"iron"];};
	// 135 - Silver Trader
	case 135:{_unit addAction[localize"STR_MAR_Silver_Trader",life_fnc_virt_menu,"silver"];};
	// 136 - Diamond Trader
	case 136:{_unit addAction[localize"STR_MAR_Diamond_Trader",life_fnc_virt_menu,"diamond"];};
	// 137 - Diamond 2 Trader
	case 137:{_unit addAction[localize"STR_MAR_Diamond_Trader",life_fnc_virt_menu,"diamond2"];};
	// 138 - Salt Trader
	case 138:{_unit addAction[localize"STR_MAR_Salt_Trader",life_fnc_virt_menu,"salt"];};
	// 139 - Cement Trader
	case 139:{_unit addAction[localize"STR_MAR_Cement_Trader",life_fnc_virt_menu,"cement"];};
	// 140 - Gold Trader
	case 140:{_unit addAction[localize"STR_MAR_Gold_Trader",life_fnc_virt_menu,"gold"];};
	// 141 - Wood Trader
	case 141:{_unit addAction[localize"STR_MAR_Wood_Trader",life_fnc_virt_menu,"wood"];};
	// 142 - Bar Trader
	case 142:{_unit addAction[localize"STR_Shops_Coffee",life_fnc_virt_menu,"bar"];};
	// 143 - Archeo Trader
	case 143:{_unit addAction[localize"STR_MAR_Archeo_Trader",life_fnc_virt_menu,"archeo"];};
	// 145 - Dealer
	case 145:{removeAllWeapons _unit; _unit addAction[localize"STR_MAR_Drug_Dealer",life_fnc_virt_menu,"drugdealer",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian ']; _unit addAction[localize"STR_MAR_Question_Dealer",life_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];_unit addAction["<img image='\A3\ui_f\data\map\Markers\NATO\n_art.paa' /><t color=""#FF0000"">  Acheter Localisation Cannabis 10000$</t>",life_fnc_buyIllegalSpot,"weed",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian && !(life_spotDrugs select 0) ']; _unit addAction["<img image='\A3\ui_f\data\map\Markers\NATO\n_art.paa' /><t color=""#FF0000"">  Acheter Localisation Heroine 20000$</t>",life_fnc_buyIllegalSpot,"heroin",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian && !(life_spotDrugs select 1)']; _unit addAction["<img image='\A3\ui_f\data\map\Markers\NATO\n_art.paa' /><t color=""#FF0000"">  Acheter Localisation Cocaine 30000$</t>",life_fnc_buyIllegalSpot,"cocaine",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian && !(life_spotDrugs select 2) ']; _unit addAction["<img image='\A3\ui_f\data\map\Markers\NATO\n_art.paa' /><t color=""#FF0000"">  Acheter Localisation Meth 75000$</t>",life_fnc_buyIllegalSpot,"meth",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian && !(life_spotDrugs select 3) '];_unit addAction["Materiel Illegal",life_fnc_licenses,["marijuana","heroin","cocaine","meth1","meth2","meth3"],0,true,true,"",' playerSide == civilian ']; };
	// 160 - Store Medic "medic_spawn_1" "med_car_1"
	case 160:{_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir && playerSide == independent ']; _unit addAction[localize"STR_MAR_EMS_Item_Shop",life_fnc_weaponShopMenu,"med_basic"]; _unit addAction[localize"STR_MAR_EMS_Clothing_Shop",life_fnc_clothingMenu,"med_clothing"]; _unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_1","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_1","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_W_Car_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "med_car_1"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent']; 	_unit addAction[localize"STR_MAR_Helicopter_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "medic_spawn_1"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent ']; 	_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];	_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"marketMedic"];};	
	// 161 - Store Medic "medic_spawn_2" "med_car_2"
	case 161:{_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir && playerSide == independent ']; _unit addAction[localize"STR_MAR_EMS_Item_Shop",life_fnc_weaponShopMenu,"med_basic"]; _unit addAction[localize"STR_MAR_EMS_Clothing_Shop",life_fnc_clothingMenu,"med_clothing"]; _unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_2","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["med_air_hp",independent,"medic_spawn_2","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_W_Car_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "med_car_2"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent']; _unit addAction[localize"STR_MAR_Helicopter_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "medic_spawn_2"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent ']; _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"marketMedic"];};
	// 162 - Store Medic "medic_spawn_3" "med_car_3"
	case 162:{_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir && playerSide == independent ']; _unit addAction[localize"STR_MAR_EMS_Item_Shop",life_fnc_weaponShopMenu,"med_basic"]; _unit addAction[localize"STR_MAR_EMS_Clothing_Shop",life_fnc_clothingMenu,"med_clothing"]; _unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_3","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_3","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_W_Car_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "med_car_3"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent']; _unit addAction[localize"STR_MAR_Helicopter_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "medic_spawn_3"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent ']; _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"marketMedic"];};
	// 163 - Store Medic "medic_spawn_4" "med_car_4"
	case 163:{_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir && playerSide == independent ']; _unit addAction[localize"STR_MAR_EMS_Item_Shop",life_fnc_weaponShopMenu,"med_basic"]; _unit addAction[localize"STR_MAR_EMS_Clothing_Shop",life_fnc_clothingMenu,"med_clothing"]; _unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,"med_car_4","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_Helicopter_Shop", life_fnc_vehicleShopMenu,["med_air_hs",independent,"medic_spawn_4","med","Kavala Hospital"]]; _unit addAction[localize"STR_MAR_W_Car_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "med_car_4"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent']; _unit addAction[localize"STR_MAR_Helicopter_Garage",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "medic_spawn_4"; life_garage_type = "Air"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent ']; _unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"marketMedic"];};
	
	
	//  201 Usine Arme Craft
	case 201:{_unit addAction["Fabriquer des armes",life_fnc_craft,"weapon",0,false,false,"",' _b = ((nearestObjects[getPosATL player,["Land_Castle_01_tower_F"],75]) select 0); !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)} && playerSide == civilian ']; _unit setVariable["realname","Fabrique d'Arme"];};
	//  202 Usine Arme Craft Legal
	case 202:{_unit addAction["Fabriquer des armes",life_fnc_craft,"weaponLeg",0,false,false,"",' !life_is_processing && playerSide == civilian && !license_civ_rebel ']; _unit setVariable["realname","Fabrique d'Arme Legal"];};

	// 250 - Chef Rebelle
	case 250:{_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "rebel" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "rebel" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"rebel",0,false,false,"",' !license_civ_rebel && playerSide == civilian '];_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "ingenieur" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "ingenieur" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"ingenieur",0,false,false,"",' !license_civ_ingenieur && license_civ_rebel && playerSide == civilian '];	_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "offroadarmed" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "offroadarmed" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"offroadarmed",0,false,false,"",' !license_civ_offroadarmed && license_civ_rebel && playerSide == civilian '];	_unit setVariable["realname","Chef Rebelle"];};
	// 251 - Marchand Rebelle
	case 251:{_unit addAction[localize"STR_MAR_Rebel_Market",life_fnc_virt_menu,"rebel",0,false,false,"",' license_civ_rebel && playerSide == civilian'];_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore"];_unit addAction[localize "STR_MAR_Rebel_Clothing_Shop",life_fnc_clothingMenu,"reb",0,false,false,"",' license_civ_rebel && playerSide == civilian'];_unit addAction[localize "STR_MAR_Rebel_Weapon_Shop",life_fnc_weaponShopMenu,"rebel",0,false,false,"",' license_civ_rebel && playerSide == civilian'];_unit setVariable["realname","Marchand Rebelle"];};

	// 260 - Vehicule Rebelle "reb_c_1" "reb_c_1_1"
	case 260:{_unit addAction[localize"STR_MAR_W_E_Vehicle Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,["reb_c_1","reb_c_1_1"],"reb","Rebel Motorpool - Western Side"],0,false,false,"",'license_civ_rebel'];_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "reb_c_1";  },"",0,false,false,"",' license_civ_rebel && playerSide == civilian'];_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store && license_civ_rebel'];_unit addAction[localize"STR_Garage_TitleAir",  {   if(life_HC_isActive) then { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];};  life_garage_type = "Air";life_isImpound = false; createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "reb_c_1";  },"",0,false,false,"",' license_civ_rebel && playerSide == civilian'];_unit setVariable["realname","Marchand Vehicule Rebelle"];};

	// 300 - Mercenaire 1 "merce_car_1" "merce_car_1_1"
	case 300:{_unit addAction["Marchand Mercenaire",life_fnc_weaponShopMenu,"mercenaireMarket"];
	_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"merce"];
	_unit addAction[localize "STR_MAR_Mercenaire_Weapon_Shop",life_fnc_weaponShopMenu,"mercenaire",0,false,false,"",' playerSide == independent'];
	_unit addAction[localize"STR_MAR_Merce_Clothing_Shop",life_fnc_clothingMenu,"mercenaire"];
	_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["mercenaire",independent,["merce_car_1","merce_car_1_1"],"merce","Bruce's New & Used Auto's"]];
	_unit addAction[localize "STR_MAR_Boat_Shop",life_fnc_vehicleShopMenu,["mercenaireboat",independent,["merce_boat_1"],"merce","Bruce's New & Used Auto's"]];
	_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "merce_car_1";  }];
	_unit addAction["Garage Helico",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Air";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "merce_car_1";  }];
	_unit addAction["Garage Bateau",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Ship",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Ship";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "merce_boat_1";  }];
	_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
	_unit setVariable["realname","Marchand Mercenaire"];};

	// Market White
	case 500:{
	_unit addAction["Acheter de la nourriture",life_fnc_virt_menu,"marketWhite"]; _unit addAction[localize"STR_MAR_Clothing_Store",life_fnc_clothingMenu,"bruce"]; _unit addAction["Terminer les tests et commencer ma vie sur Altis.",life_fnc_whiteList,true,0,false,false,"",' (life_WhiteList select 0)']; _unit setVariable["realname","Marché"];};
	// Question White
	case 501:{_unit addAction["Lancer le Test Vrai/Faux",life_fnc_whiteListQuestion,""]; _unit setVariable["realname","Test Numero 1"];};
	// Question White
	case 502:{_unit addAction[localize"STR_Process_Dechet",life_fnc_processActionWhiteList,"",0,false,false,"",' life_inv_dechet > 0 && !life_is_processing']; _unit setVariable["realname","Agent de recyclage"];};
	// 503 Special Toxic Truck
	case 503:{_unit addAction["Commander un camion Toxic",life_fnc_buyToxicTruck,"toxic_truckSpawn_1",0,false,false,"",''];_unit setVariable["realname","Commanditaire Toxic"];};
	// 504 Special Toxic Truck
	case 504:{_unit addAction["Commander un camion Toxic",life_fnc_buyToxicTruck,"toxic_truckSpawn_2",0,false,false,"",''];_unit setVariable["realname","Commanditaire Toxic"];};
	// 510 Toxic Truck Reward Disarm
	case 510:{
		_unit addAction["Parler a la personne",life_fnc_toxicPaid,"disarme",0,false,false,"",'!life_action_inUse'];
		_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"chasseur",0,false,false,"",'!life_action_inUse && license_civ_chasseur'];
		_unit addAction[localize "STR_MAR_Chasseur_Store",life_fnc_weaponShopMenu,"chasseurstore",0,false,false,"",'!life_action_inUse && license_civ_chasseur'];
		_unit addAction[localize "STR_Shops_Chasseur",life_fnc_wantedMenuChasseur,"",0,false,false,"",'!life_action_inUse && license_civ_chasseur'];
	};		
	
	// 1000 Marchand Ressources
	case 1000:{_unit addAction[localize"STR_Shops_Ressources",life_fnc_virt_menu,"ressources",0,false,false,"",'!life_action_inUse'];};
	
	
	
	
	// 1600 Usine Fabricant
	case 1600:{
		_unit addAction[localize"STR_Process_Pdt",life_fnc_processAction,"frite",0,false,false,"",' life_inv_pdt > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Woodplank",life_fnc_processAction,"woodplank",0,false,false,"",' life_inv_wood > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Cement",life_fnc_processAction,"cement",0,false,false,"",' life_inv_rock > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Sand",life_fnc_processAction,"sand",0,false,false,"",' life_inv_sand > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Copper",life_fnc_processAction,"copper",0,false,false,"",' life_inv_copperUnrefined > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Iron",life_fnc_processAction,"iron",0,false,false,"",' life_inv_ironUnrefined > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Silver",life_fnc_processAction,"silver",0,false,false,"",' life_inv_silverUnrefined > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Salt",life_fnc_processAction,"salt",0,false,false,"",' life_inv_saltUnrefined > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Oil",life_fnc_processAction,"oil",0,false,false,"",' life_inv_oilUnprocessed > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Diamond",life_fnc_processAction,"diamond",0,false,false,"",' life_inv_diamondUncut > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Diamond",life_fnc_processAction,"diamond2",0,false,false,"",' life_inv_diamondCut > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_FouilleEau",life_fnc_processAction,"fouilleeau",0,false,false,"",' life_inv_fouilleEau > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_FouilleTerre",life_fnc_processAction,"fouilleterre",0,false,false,"",' life_inv_fouilleTerre > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Vodka",life_fnc_processAction,"vodka",0,false,false,"",' life_inv_pdt > 0 && life_inv_bouteille > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Wisky",life_fnc_processAction,"wisky1",0,false,false,"",' life_inv_malt > 0 && life_inv_levure > 0 && !life_is_processing && playerSide == independent'];
		_unit addAction[localize"STR_Process_Biere",life_fnc_processAction,"biere2",0,false,false,"",' life_inv_biereFerm > 0 && life_inv_bouteille > 0 && !life_is_processing && playerSide == independent'];
	};
	
	// 1610 Usine Independent Fabricant - worker_car_1
	case 1610: {
		_unit addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"market",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Worker_Clothing_Shop",life_fnc_clothingMenu,"worker_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Mineur_Clothing_Shop",life_fnc_clothingMenu,"mineur_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction["Vehicule Mineur",life_fnc_vehicleShopMenu,["mineur",independent,"worker_car_1","mineur","Kavalash Mineur"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction["Vehicule Fabricant",life_fnc_vehicleShopMenu,["worker_shop",independent,"worker_car_1","worker","Kavalash Fabricant"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "worker_car_1"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent'];  
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
	};	
	// 1611 Usine Independent Fabricant - worker_car_2
	case 1611: {
		_unit addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"market",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Worker_Clothing_Shop",life_fnc_clothingMenu,"worker_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Mineur_Clothing_Shop",life_fnc_clothingMenu,"mineur_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction["Vehicule Mineur",life_fnc_vehicleShopMenu,["mineur",independent,"worker_car_2","mineur","Kavalash Mineur"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction["Vehicule Fabricant",life_fnc_vehicleShopMenu,["worker_shop",independent,"worker_car_2","worker","Kavalash Fabricant"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "worker_car_2"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent'];  
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
	};	
	// 1612 Usine Independent Fabricant - worker_car_3
	case 1612: {
		_unit addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_Shops_Market",life_fnc_virt_menu,"market",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Worker_Clothing_Shop",life_fnc_clothingMenu,"worker_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction[localize"STR_MAR_Mineur_Clothing_Shop",life_fnc_clothingMenu,"mineur_clothing",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];
		_unit addAction["Vehicule Mineur",life_fnc_vehicleShopMenu,["mineur",independent,"worker_car_3","mineur","Kavalash Mineur"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction["Vehicule Fabricant",life_fnc_vehicleShopMenu,["worker_shop",independent,"worker_car_3","worker","Kavalash Fabricant"],0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 && playerSide == independent'];  
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];};   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "worker_car_3"; life_garage_type = "Car"; life_isImpound = false;  },"",0,false,false,"",'playerSide == independent'];  
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
	};
	
	// 2000 Gang Flag 1 - flag_gang1_1
	case 2000:
	{
		_unit addAction ["Capturer Drapeau A",life_fnc_captureHideout,flag_gang1_1,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2001 Gang Flag 1 - flag_gang1_2
	case 2001:
	{
		_unit addAction ["Capturer Drapeau B",life_fnc_captureHideout,flag_gang1_2,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2002 Gang Flag 1 - flag_gang1_3
	case 2002:
	{
		_unit addAction ["Capturer Drapeau C",life_fnc_captureHideout,flag_gang1_3,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	
	// 2005 Gang Flag 2 - flag_gang2_1
	case 2005:
	{
		_unit addAction ["Capturer Drapeau A",life_fnc_captureHideout,flag_gang2_1,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2006 Gang Flag 2 - flag_gang2_2
	case 2006:
	{
		_unit addAction ["Capturer Drapeau B",life_fnc_captureHideout,flag_gang2_2,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2007 Gang Flag 2 - flag_gang2_3
	case 2007:
	{
		_unit addAction ["Capturer Drapeau C",life_fnc_captureHideout,flag_gang2_3,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	
	// 2010 Gang Flag 3 - flag_gang3_1
	case 2010:
	{
		_unit addAction ["Capturer Drapeau A",life_fnc_captureHideout,flag_gang3_1,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2011 Gang Flag 3 - flag_gang3_2
	case 2011:
	{
		_unit addAction ["Capturer Drapeau B",life_fnc_captureHideout,flag_gang3_2,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	// 2012 Gang Flag 3 - flag_gang3_3
	case 2012:
	{
		_unit addAction ["Capturer Drapeau C",life_fnc_captureHideout,flag_gang3_3,0,false,false,"",' playerSide == civilian && !isNil {(group player) getVariable "gang_owner"}'];
	};
	
	// Zone de gang
	case 2050:{
		_unit addAction[localize"STR_Shops_Gang",life_fnc_virt_menu,"gang",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Shops_C_Gang",life_fnc_clothingMenu,"gang_clothing",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	// Zone de gang
	case 2051:{
		_unit addAction[localize"STR_Shops_Gang",life_fnc_virt_menu,"gang",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Shops_C_Gang",life_fnc_clothingMenu,"gang_clothing",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	// Zone de gang
	case 2052:{
		_unit addAction[localize"STR_Shops_Gang",life_fnc_virt_menu,"gang",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Shops_C_Gang",life_fnc_clothingMenu,"gang_clothing",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_General_Store",life_fnc_weaponShopMenu,"genstore",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	
	case 2100:{
		_unit addAction[localize"STR_MAR_Armament",life_fnc_weaponShopMenu,"gangShop",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	case 2101:{
		_unit addAction[localize"STR_MAR_Armament",life_fnc_weaponShopMenu,"gangShop",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	case 2102:{
		_unit addAction[localize"STR_MAR_Armament",life_fnc_weaponShopMenu,"gangShop",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	
	//  2150 Tool Basic Gang Area
	case 2150:{
		_unit addAction[localize"STR_Process_Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Heroin",life_fnc_processAction,"heroin",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	//  2150 Tool Basic Gang Area
	case 2151:{
		_unit addAction[localize"STR_Process_Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Heroin",life_fnc_processAction,"heroin",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	//  2150 Tool Basic Gang Area
	case 2152:{
		_unit addAction[localize"STR_Process_Marijuana",life_fnc_processAction,"marijuana",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Heroin",life_fnc_processAction,"heroin",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Process_Cocaine",life_fnc_processAction,"cocaine",0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	
	//  2200 Vehicle Gang Area
	case 2200:{
		_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["gang1_veh_spawn_1","gang1_veh_spawn_1_1"],"civ","Gang's New & Used Auto's"],0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Truck_Shop",life_fnc_vehicleShopMenu,["civ_truck",civilian,["gang1_veh_spawn_1","gang1_veh_spawn_1_1"],"civ","Gang's New & Used Camion's"],0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Air_Shop",life_fnc_vehicleShopMenu,["civ_air",civilian,["gang1_veh_spawn_1","gang1_veh_spawn_1_1"],"civ","Gang's New & Used Helico's"],0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_RebelCar_Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,["gang1_veh_spawn_1","gang1_veh_spawn_1_1"],"civ","Gang's New & Used Rebel's"],0,false,false,"",'_a = gang_obj_1; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "gang1_veh_spawn_1";  },"",0,false,false,"",'_a = gang_obj_1; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})']; 
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'_a = gang_obj_1; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	//  2201 Vehicle Gang Area
	case 2201:{
		_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["gang2_veh_spawn_1","gang2_veh_spawn_1_1"],"civ","Gang's New & Used Auto's"],0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Truck_Shop",life_fnc_vehicleShopMenu,["civ_truck",civilian,["gang2_veh_spawn_1","gang2_veh_spawn_1_1"],"civ","Gang's New & Used Camion's"],0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Air_Shop",life_fnc_vehicleShopMenu,["civ_air",civilian,["gang2_veh_spawn_1","gang2_veh_spawn_1_1"],"civ","Gang's New & Used Helico's"],0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_RebelCar_Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,["gang2_veh_spawn_1","gang2_veh_spawn_1_1"],"civ","Gang's New & Used Rebel's"],0,false,false,"",'_a = gang_obj_2; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "gang2_veh_spawn_1";  },"",0,false,false,"",'_a = gang_obj_2; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})']; 
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'_a = gang_obj_2; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	//  2202 Vehicle Gang Area
	case 2202:{
		_unit addAction[localize "STR_MAR_Car_shop",life_fnc_vehicleShopMenu,["civ_car",civilian,["gang3_veh_spawn_1","gang3_veh_spawn_1_1"],"civ","Gang's New & Used Auto's"],0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Truck_Shop",life_fnc_vehicleShopMenu,["civ_truck",civilian,["gang3_veh_spawn_1","gang3_veh_spawn_1_1"],"civ","Gang's New & Used Camion's"],0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_Air_Shop",life_fnc_vehicleShopMenu,["civ_air",civilian,["gang3_veh_spawn_1","gang3_veh_spawn_1_1"],"civ","Gang's New & Used Helico's"],0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize "STR_MAR_RebelCar_Shop",life_fnc_vehicleShopMenu,["reb_car",civilian,["gang3_veh_spawn_1","gang3_veh_spawn_1_1"],"civ","Gang's New & Used Rebel's"],0,false,false,"",'_a = gang_obj_3; (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
		_unit addAction[localize"STR_Garage_Title",  {   if(life_HC_isActive) then {	[false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life]; } else { [false,getPlayerUID player,playerSide,"Car",player] remoteExecCall ["TON_fnc_getVehicles",2];}; life_garage_type = "Car";life_isImpound = false;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];   life_garage_sp = "gang3_veh_spawn_1";  },"",0,false,false,"",'_a = gang_obj_3; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})']; 
		_unit addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'_a = gang_obj_3; !life_garage_store && (!isNil {_a getVariable "gangOwnerName"} && {(_a getVariable "gangOwnerName") == (group player getVariable "gang_name")})'];
	};
	
	
	// 3000 Cop LoadOut modelToWorld Low
	// case 3000:{};
	// case 3001:{};
	case 3000:{
		_unit addAction["Equipement FreeSlot",life_fnc_loadoutCop,15,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement GAV",life_fnc_loadoutCop,0,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Gendarme MK20c",life_fnc_loadoutCop,1,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Adjudant Mx",life_fnc_loadoutCop,2,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Major MXM",life_fnc_loadoutCop,3,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Major Spar 16",life_fnc_loadoutCop,4,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Major MX SW",life_fnc_loadoutCop,5,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Armes",life_fnc_weaponShopMenu,"cop_viseur",0,false,false,"",' playerSide == west '];
	};
	// 3001 Cop LoadOut modelToWorld High
	case 3001:{
		_unit addAction["Equipement Lieutenant CAR-95",life_fnc_loadoutCop,6,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Capitaine Spar17",life_fnc_loadoutCop,7,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement COMMANDANT MK14",life_fnc_loadoutCop,8,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Lt colonel",life_fnc_loadoutCop,9,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Colonel",life_fnc_loadoutCop,10,0,false,false,"",' playerSide == west '];
		_unit addAction["Equipement Armes",life_fnc_weaponShopMenu,"cop_viseur",0,false,false,"",' playerSide == west '];
	};
	
	
};


