/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        4: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 250, { "", "", -1 } },
            { "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
            { "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
            { "U_Marshal", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_4_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_1_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_2_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_5_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Bandit_3_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_2_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_3_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_1_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 2500, { "", "", -1 } },
            { "U_C_man_sport_1_F", "", 2500, { "", "", -1 } },
            { "U_C_man_sport_3_F", "", 2500, { "", "", -1 } },
            { "U_C_man_sport_2_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_6_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_4_F", "", 2500, { "", "", -1 } },
            { "U_C_Man_casual_5_F", "", 2500, { "", "", -1 } },
            { "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "Camo Bandanna", 120, { "", "", -1 } },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, { "", "", -1 } },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, { "", "", -1 } },
            { "H_Cap_blu", "", 150, { "", "", -1 } },
            { "H_Cap_grn", "", 150, { "", "", -1 } },
            { "H_Cap_grn_BI", "", 150, { "", "", -1 } },
            { "H_Cap_oli", "", 150, { "", "", -1 } },
            { "H_Cap_red", "", 150, { "", "", -1 } },
            { "H_Cap_tan", "", 150, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 165, { "", "", -1 } },
            { "H_StrawHat", "Straw Fedora", 225, { "", "", -1 } },
            { "H_Hat_tan", "", 265, { "", "", -1 } },
            { "H_Hat_brown", "", 276, { "", "", -1 } },
            { "H_Hat_grey", "", 280, { "", "", -1 } },
            { "H_BandMask_blk", "Hat & Bandanna", 300, { "", "", -1 } },
            { "H_Hat_blue", "", 310, { "", "", -1 } },
            { "H_Hat_checker", "", 340, { "", "", -1 } },
            { "H_Helmet_Skate", "", 340, { "", "", -1 } },
            { "H_Booniehat_tan", "", 425, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Shades_Green", "", 20, { "", "", -1 } },
            { "G_Shades_Red", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Lady_Mirror", "", 150, { "", "", -1 } },
            { "G_Lady_Dark", "", 150, { "", "", -1 } },
            { "G_Lady_Blue", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_BandollierB_rgr", "", 5000, { "", "", -1 } },
            { "V_BandollierB_blk", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 300, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 600, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 600, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 600, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 600, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 600, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 600, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 600, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 800, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 1000, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 1000, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 1000, { "", "", -1 } },
            { "B_FieldPack_blk", "", 1300, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 1300, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 1300, { "", "", -1 } },
            { "B_Bergen_sgg", "", 1500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 1500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 1500, { "", "", -1 } },
            { "B_Bergen_blk", "", 1500, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 2000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 2000, { "", "", -1 } },
            { "B_Carryall_oli", "", 2000, { "", "", -1 } },
            { "B_Carryall_khk", "", 2000, { "", "", -1 } },
            { "B_Carryall_cbr", "", 2000, { "", "", -1 } },
            { "B_Parachute", "Parachute", 3000, { "", "", -1 } }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "Tenue operationelle", 0, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Tenue intervention", 0, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_CombatUniform_mcam_worn", "Tenue intervention", 0, { "life_coplevel", "SCALAR", 1 } },
            { "U_B_GEN_Soldier_F", "Tenue intervention", 0, { "life_coplevel", "SCALAR", 2 } },
			{ "U_B_GEN_Commander_F", "Tenue G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "U_BG_Guerrilla_6_1", "Tenue G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_Wetsuit", "", 2000, { "life_coplevel", "SCALAR", 1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_MilCap_gen_F", "", 0, { "", "", -1 } },
			{ "H_Beret_blk_POLICE", "", 25, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_02", "", 25, { "life_coplevel", "SCALAR", 4 } },
			{ "H_Beret_Colonel", "", 25, { "life_coplevel", "SCALAR", 8 } },
			{ "H_Cap_police", "", 0, { "life_coplevel", "SCALAR", 10 } },
			{ "H_CrewHelmetHeli_B", "Masque Gaz", 1000, { "life_coplevel", "SCALAR", 2 } },
			{ "H_HelmetCrew_I", "Casque G.I.G.N", 1500, { "life_coplevel", "SCALAR", 2 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 10, { "", "", -1 } },
			{ "G_Tactical_Clear", "", 10, { "", "", -1 } },
			{ "G_Lowprofile", "", 10, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 10, { "", "", -1 } },
			{ "G_Combat", "", 10, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "", 10, { "", "", -1 } },	
            { "G_Balaclava_blk", "Cagoule G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Balaclava_combat", "Cagoule G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Balaclava_lowprofile", "Cagoule G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Balaclava_TI_blk_F", "Cagoule G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Balaclava_TI_G_blk_F", "Cagoule G.I.G.N", 50, { "life_coplevel", "SCALAR", 2 } },
            { "G_Diving", "", 100, { "life_coplevel", "SCALAR", 1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4000, { "", "", -1 } },
			{ "V_Press_F", "Protection VIP", 0, { "life_coplevel", "SCALAR", 2 } },
			{ "V_TacVest_gen_F", "Gilet intervention", 0, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVest_blk_POLICE", "Gilet intervention", 0, { "life_coplevel", "SCALAR", 10 } },
			{ "V_PlateCarrier1_blk", "Gilet G.I.G.N", 2000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrier2_blk", "Gilet G.I.G.N", 5000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrierSpec_blk", "Gilet G.I.G.N", 8000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_RebreatherB", "", 2000, { "life_coplevel", "SCALAR", 1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Carryall_cbr", "", 500, { "", "", -1 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Diving", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherB", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 1900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class mecano_clothing {
        title = "STR_MAR_Meca_Clothing_Shop";
        license = "";
        side = "mecano";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mecano", 50, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 165, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Bergen_rgr", "Sac", 3000, { "", "", -1 } }
        };
    };
	
    class worker_clothing {
        title = "STR_MAR_Worker_Clothing_Shop";
        license = "";
        side = "worker";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Fabricant", 50, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 165, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Bergen_rgr", "Sac", 3000, { "", "", -1 } }
        };
    };
	
    class mineur_clothing {
        title = "STR_MAR_Mineur_Clothing_Shop";
        license = "";
        side = "mineur";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mineur", 50, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 165, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Bergen_rgr", "Sac", 3000, { "", "", -1 } },
            { "B_Bergen_mcamo_F", "Sac", 5000, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "EMS Uniform", 50, { "", "", -1 } },
            { "I_diver_F", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_blu", "", 10, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Blue", "", 10, { "", "", -1 } },
            { "G_Diving ", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherIA", "", 2000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_TacticalPack_rgr", "EMS Backpack", 3000, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_CTRG_2", "", 5000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 10000, {"", "", -1} },
            { "U_I_FullGhillie_sard", "", 10000, {"", "", -1} },
            { "U_BG_Guerilla2_1", "", 5000, {"", "", -1} },
            { "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
            { "U_I_G_Story_Protagonist_F", "", 5000, { "", "", -1 } },
            { "U_I_G_resistanceLeader_F", "", 11500, { "", "", -1 } },
            { "U_IG_leader", "", 5000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 5000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_3_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_2_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_urb_1_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_urb_3_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_Soldier_urb_2_F", "", 5000, { "", "", -1 } },
            { "U_O_T_Soldier_F", "", 5000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 5000, { "", "", -1 } },
            { "U_B_T_FullGhillie_tna_F", "", 5000, { "", "", -1 } },
            { "U_O_T_Sniper_F", "", 5000, { "", "", -1 } },
            { "U_B_T_Sniper_F", "", 5000, { "", "", -1 } },
            { "U_O_T_Officer_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 5000, { "", "", -1 } },
            { "U_B_T_Soldier_SL_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 5000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 650, { "", "", -1 } },
            { "H_ShemagOpen_khk", "", 800, { "", "", -1 } },
            { "H_ShemagOpen_tan", "", 850, { "", "", -1 } },
            { "H_Shemag_olive", "", 850, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 1200, { "", "", -1 } },
            { "H_HelmetO_ocamo", "", 2500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_blk", "", 150, { "", "", -1 } },
            { "G_Balaclava_combat", "", 150, { "", "", -1 } },
            { "G_Balaclava_lowprofile", "", 150, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_beast", "", 150, { "", "", -1 } },
            { "G_Bandanna_blk", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
            { "V_HarnessO_brn", "", 20000, { "", "", -1 } },
            { "V_TacVest_khk", "", 12500, { "", "", -1 } },
            { "V_HarnessO_gry", "", 10000, { "", "", -1 } },
            { "V_Chestrig_rgr", "", 10000, { "", "", -1 } },
            { "V_TacVest_oli", "", 20000, { "", "", -1 } },
            { "V_TacVest_brn", "", 20000, { "", "", -1 } },
            { "V_TacVest_blk", "", 20000, { "", "", -1 } },
            { "V_PlateCarrierIA1_dgtl", "", 30000, { "", "", -1 } },
            { "V_PlateCarrier1_rgr", "", 30000, { "", "", -1 } },
            { "V_PlateCarrierL_CTRG", "", 30000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 500, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 5000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 5000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 6500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 6500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 6500, { "", "", -1 } },
            { "B_Bergen_blk", "", 6500, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Driver_1_black", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_blue", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_red", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_orange", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_green", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_white", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_yellow", "", 1500, { "", "", -1 } },
            { "U_C_Driver_2", "", 3500, { "", "", -1 } },
            { "U_C_Driver_1", "", 3600, { "", "", -1 } },
            { "U_C_Driver_3", "", 3700, { "", "", -1 } },
            { "U_C_Driver_4", "", 3700, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class mercenaire {
        title = "STR_Shops_C_Mercenaire";
        license = "";
        side = "merce";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_I_FullGhillie_ard", "", 6000, { "", "", -1 } },
            { "U_I_FullGhillie_lsh", "", 6000, { "", "", -1 } },
            { "U_I_pilotCoveralls", "", 2500, { "", "", -1 } },
            { "U_I_Wetsuit", "", 1500, { "", "", -1 } },
            { "U_I_HeliPilotCoveralls", "", 1500, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 5000, { "", "", -1 } },
            { "U_I_CombatUniform", "", 3000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 3000, { "", "", -1 } },
            { "U_I_OfficerUniform", "", 3000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Booniehat_dgtl", "", 200, { "", "", -1 } },
            { "H_MilCap_dgtl", "", 200, { "", "", -1 } },
            { "H_HelmetSpecB", "", 200, { "", "", -1 } },
            { "H_HelmetIA_net", "", 200, { "", "", -1 } },
            { "H_Shemag_olive_hs", "", 200, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_PlateCarrier1_rgr", "", 2500, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } }
        };
    };
};
