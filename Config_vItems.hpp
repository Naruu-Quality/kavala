/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
class VirtualShops {
    //Virtual Shops
    class market {
        name = "STR_Shops_Market";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "atele", "transpack", "pickaxe", "fuelFull", "peach", "frite", "pdt", "boltcutter", "visseuse", "chalumeau", "storagesmall", "storagebig", "armoire", "frigo"};
    };
	
    class mecano {
        name = "STR_Shops_Market";
        side = "mecano";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "atele", "transpack", "fuelFull", "peach", "frite", "pdt"};
    };
	
    class merce {
        name = "STR_Shops_Market";
        side = "merce";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "menotte", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "atele", "transpack", "fuelFull", "peach", "frite", "pdt"};
    };
    
    class marketWhite {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "apple", "redgull", "tbacon", "peach"};
    };
	
    class marketMedic {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "atele", "transpack", "fuelFull", "peach", "frite"};
    };

    class banque {
        name = "STR_Shops_Banque";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cartevisa" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle","menotte","atele", "transpack", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge","illegalbox", "illegalboxbig", "visseuse", "chalumeau", "scalpel", "organ"};
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "turtle_soup", "turtle_raw" };
    };
	
    class chasseur {
        name = "STR_Shops_Chasseur";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "menotte"};
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts", "redgull", "fuelFull"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "methDesinc" };
    };

    class bar {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "vodka", "wisky", "biere" };
    };

    class ressources {
        name = "STR_Shops_MarketRessource";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oil_processed","glass","iron_refined", "copper_refined","silver_refined","salt_refined","cement","woodplank" };
    };
	
    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salema", "ornate", "mackerel", "tuna", "mullet", "catshark" };
    };

    class uranium {
        name = "STR_Shops_Uranium";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "uraniumPur" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_cut" };
    };

    class diamond2 {
        name = "STR_Shops_Diamond";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_taille" };
    };
	
    class archeo {
        name = "STR_Shops_Cement";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "fouilleFosileTerre1","fouilleFosileTerre2","fouilleFosileTerre3","fouilleFosileEau1","fouilleFosileEau2","fouilleFosileEau3" };
    };

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "goldbar" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Vous devez être gendarme officiel!" };
        items[] = { "adnpack", "donuts", "coffee","atele", "transpack", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "fuelFull", "defusekit", "lockpick" };
    };
	
    class freecop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "donuts", "coffee","atele", "transpack", "waterBottle", "rabbit", "apple", "redgull", "fuelFull" };
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Virtual Items

    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 1;
        buyPrice = 3000;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
    };
	
    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 3;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 500;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class atele {
        variable = "atele";
        displayName = "STR_Item_Atele";
        weight = 1;
        buyPrice = 500;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\ico_atelle.paa";
    };
	
    class scalpel {
        variable = "scalpel";
        displayName = "STR_Item_Scalpel";
        weight = 2;
        buyPrice = 7500;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_atelle.paa";
    };
	
    class organ {
        variable = "organ";
        displayName = "STR_Item_Organ";
        weight = 2;
        buyPrice = -1;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_atelle.paa";
    };

    class adnpack {
        variable = "adnpack";
        displayName = "STR_Item_AdnPack";
        weight = 1;
        buyPrice = 1500;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\ico_sang.paa";
    };

    class transpack {
        variable = "transpack";
        displayName = "STR_Item_TransPack";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\ico_sang.paa";
    };

    class cartevisa {
        variable = "cartevisa";
        displayName = "STR_Item_CarteVisa";
        weight = 1;
        buyPrice = 10000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_CB.paa";
    };

    class menotte {
        variable = "menotte";
        displayName = "STR_Item_Menotte";
        weight = 1;
        buyPrice = 5000;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 6;
        buyPrice = -1;
        sellPrice = 40000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 100000;
        sellPrice = 15000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 1500;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 100000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 300000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

    class illegalbox {
        variable = "illegalbox";
        displayName = "STR_Item_IllegalBox";
        weight = 10;
        buyPrice = 500000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

    class illegalboxbig {
        variable = "illegalboxbig";
        displayName = "STR_Item_IllegalBoxBig";
        weight = 15;
        buyPrice = 1000000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	
    class armoire {
        variable = "armoire";
        displayName = "STR_Item_Armoire";
        weight = 5;
        buyPrice = 10000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	
    class frigo {
        variable = "frigo";
        displayName = "STR_Item_Frigo";
        weight = 5;
        buyPrice = 10000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

    //Mined Items
	
    class pdt {
        variable = "pdt";
        displayName = "STR_Item_Pdt";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = 10;
		icon = "icons\ico_patate.paa";
    };
	
    class frite {
        variable = "frite";
        displayName = "STR_Item_Frite";
        weight = 1;
        buyPrice = -1;
        sellPrice = 45;
        illegal = false;
        edible = 100;
	icon = "icons\ico_frite.paa";
    };
	
    class wood {
        variable = "wood";
        displayName = "STR_Item_Wood";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
		icon = "icons\ico_bois.paa";
    };
	
    class woodplank {
        variable = "woodplank";
        displayName = "STR_Item_Woodplank";
        weight = 1;
        buyPrice = -1;
        sellPrice = 200;
        illegal = false;
        edible = -1;
		icon = "icons\ico_planche.paa";
    };
	
    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
		icon = "icons\ico_cement.paa";
    };
	
    class silver_unrefined {
        variable = "silverUnrefined";
        displayName = "STR_Item_SilverOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_argentmine.paa";
    };

    class silver_refined {
        variable = "silverRefined";
        displayName = "STR_Item_SilverIngot";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
	icon = "icons\ico_argentlingot.paa";
    };
	
    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
	icon = "icons\ico_copper.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 1;
        buyPrice = -1;
        sellPrice = 155;
        illegal = false;
        edible = -1;
	icon = "icons\ico_glass.paa";
    };
	
    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
		icon = "icons\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 2;
        buyPrice = -1;
        sellPrice = 170;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 1;
        buyPrice = -1;
        sellPrice = 175;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltProcessed.paa";
    };

	class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };
	
    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 1;
        buyPrice = -1;
        sellPrice = 3200;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilProcessed.paa";
    };
	
    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1300;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };

    class diamond_taille {
        variable = "diamondTaille";
        displayName = "STR_Item_DiamondT";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1300;
        illegal = false;
        edible = -1;
        icon = "icons\ico_bijoux.paa";
    };

    class bouteille {
        variable = "bouteille";
        displayName = "STR_Item_Bouteille";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_bouteille.paa";
    };

    class fouilleTerre {
        variable = "fouilleTerre";
        displayName = "STR_Item_FouilleTerre";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fouille.paa";
    };

    class fouilleFosileTerre1 {
        variable = "fouilleFosileTerre1";
        displayName = "STR_Item_FouilleFosilleTerre1";
        weight = 5;
        buyPrice = -1;
        sellPrice = 4500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossilterre.paa";
    };
	
    class fouilleFosileTerre2 {
        variable = "fouilleFosileTerre2";
        displayName = "STR_Item_FouilleFosilleTerre2";
        weight = 5;
        buyPrice = -1;
        sellPrice = 6000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossilterre.paa";
    };
	
    class fouilleFosileTerre3 {
        variable = "fouilleFosileTerre3";
        displayName = "STR_Item_FouilleFosilleTerre3";
        weight = 5;
        buyPrice = -1;
        sellPrice = 7500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossilterre.paa";
    };

    class fouilleEau {
        variable = "fouilleEau";
        displayName = "STR_Item_FouilleEau";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fouille.paa";
    };

    class fouilleFosileEau1 {
        variable = "fouilleFosileEau1";
        displayName = "STR_Item_FouilleFosilleEau1";
        weight = 5;
        buyPrice = -1;
        sellPrice = 12000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossileau.paa";
    };
	
    class fouilleFosileEau2 {
        variable = "fouilleFosileEau2";
        displayName = "STR_Item_FouilleFosilleEau2";
        weight = 5;
        buyPrice = -1;
        sellPrice = 17000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossileau.paa";
    };
	
    class fouilleFosileEau3 {
        variable = "fouilleFosileEau3";
        displayName = "STR_Item_FouilleFosilleEau3";
        weight = 5;
        buyPrice = -1;
        sellPrice = 22000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fossileau.paa";
    };

    class levure {
        variable = "levure";
        displayName = "STR_Item_Levure";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_levure.paa";
    };

    class malt {
        variable = "malt";
        displayName = "STR_Item_Malt";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_malt.paa";
    };

    class wiskyFerm {
        variable = "wiskyFerm";
        displayName = "STR_Item_WiskyFerm";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fut.paa";
    };

    class wisky {
        variable = "wisky";
        displayName = "STR_Item_Wisky";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_wisky.paa";
    };

    class biereFerm {
        variable = "biereFerm";
        displayName = "STR_Item_BiereFerm";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fut.paa";
    };

    class biere {
        variable = "biere";
        displayName = "STR_Item_Biere";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_biere.paa";
    };

    class houblon {
        variable = "houblon";
        displayName = "STR_Item_Houblon";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_houblon.paa";
    };

    class vodka {
        variable = "vodka";
        displayName = "STR_Item_Vodka";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_vodka.paa";
    };

    class methPur {
        variable = "methPur";
        displayName = "STR_Item_MethPur";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_meth1.paa";
    };

    class methTraite {
        variable = "methTraite";
        displayName = "STR_Item_MethTraite";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_meth2.paa";
    };

    class methLave {
        variable = "methLave";
        displayName = "STR_Item_MethLave";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_meth3.paa";
    };

    class methDesinc {
        variable = "methDesinc";
        displayName = "STR_Item_Methdesinc";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_meth4.paa";
    };

    class uranium {
        variable = "uranium";
        displayName = "STR_Item_Uranium";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ura1.paa";
    };
	
    class uraniumDesin {
        variable = "uraniumDesin";
        displayName = "STR_Item_UraniumDesin";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ura2.paa";
    };
	
    class uraniumPur {
        variable = "uraniumPur";
        displayName = "STR_Item_UraniumPur";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ura3.paa";
    };



    //Drugs
	
    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = 500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cannabis.paa";
        processedItem = "cannabis_sec";
    };
	
    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 3;
        buyPrice = -1;
        sellPrice = 650;
        illegal = true;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
    };
	
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 650;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_semiprocessed";
    };
	
    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "STR_Item_HeroinP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1350;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinProcessed.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_semiprocessed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1750;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };

    class dechet {
        variable = "dechet";
        displayName = "STR_Item_Dechet";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_dechet.paa";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 500;
        sellPrice = 100;
        illegal = false;
        edible = 100;
        icon = "icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 150;
        sellPrice = 50;
        illegal = false;
        edible = 100;
        icon = "icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = 50;
        icon = "icons\ico_waterBottle.paa";
    };

    //Food
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 100;
        sellPrice = 45;
        illegal = false;
        edible = 10;
        icon = "icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 100;
        sellPrice = 40;
        illegal = false;
        edible = 10;
        icon = "icons\ico_peach.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 100;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 25;
        illegal = false;
        edible = 30;
        icon = "icons\ico_donuts.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = 150;
        sellPrice = 35;
        illegal = false;
        edible = 20;
        icon = "icons\ico_rabbit.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 75;
        sellPrice = 55;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 175;
        sellPrice = 55;
        illegal = false;
        edible = 25;
        icon = "icons\ico_cookedFish.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 1;
        buyPrice = 250;
        sellPrice = 200;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 1;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 1;
        buyPrice = 600;
        sellPrice = 400;
        illegal = false;
        edible = 80;
        icon = "icons\ico_cookedFish.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 1;
        buyPrice = 750;
        sellPrice = 500;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 12;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = 100;
        icon = "icons\ico_turtleSoup.paa";
    };

    class truckWheel {
        variable = "truckWheel";
        displayName = "STR_Item_TruckWheel";
        weight = 20;
        buyPrice = 7500;
        sellPrice = 2500;
        illegal = true;
        edible = -1;
        icon = "icons\Pneu.paa";
    };

    class visseuse {
        variable = "visseuse";
        displayName = "STR_Item_Visseuse";
        weight = 2;
        buyPrice = 15000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\Visseuse.paa";
    };

    class chalumeau {
        variable = "chalumeau";
        displayName = "STR_Item_Chalumeau";
        weight = 3;
        buyPrice = 30000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\Chalumeau.paa";
    };

    class piecemeca {
        variable = "piecemeca";
        displayName = "STR_Item_Piecemeca";
        weight = 1;
        buyPrice = 30000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\moteur.paa";
    };

};
