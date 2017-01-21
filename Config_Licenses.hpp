/*
*    class:
*        variable = Variable Name
*        displayName = License Name
*        price = License Price
*        illegal = Illegal License
*        side = side indicator
*/
class Licenses {
    //Civilian Licenses
    class identite {
        variable = "identite";
        displayName = "STR_License_Identite";
        price = 1000;
        illegal = false;
        side = "civ";
    };
	
    class driver {
        variable = "driver";
        displayName = "STR_License_Driver";
        price = 5000;
        illegal = false;
        side = "civ";
    };

    class boat {
        variable = "boat";
        displayName = "STR_License_Boat";
        price = 5000;
        illegal = false;
        side = "civ";
    };

    class pilot {
        variable = "pilot";
        displayName = "STR_License_Pilot";
        price = 50000;
        illegal = false;
        side = "civ";
    };

    class trucking {
        variable = "trucking";
        displayName = "STR_License_Truck";
        price = 30000;
        illegal = false;
        side = "civ";
    };

    class gun {
        variable = "gun";
        displayName = "STR_License_Firearm";
        price = 20000;
        illegal = false;
        side = "civ";
    };

    class dive {
        variable = "dive";
        displayName = "STR_License_Diving";
        price = 2000;
        illegal = false;
        side = "civ";
    };

    class home {
        variable = "home";
        displayName = "STR_License_Home";
        price = 100000;
        illegal = false;
        side = "civ";
    };

    class chasseur {
        variable = "chasseur";
        displayName = "STR_License_Chasseur";
        price = 200000000;
        illegal = false;
        side = "civ";
    };

    class ingenieur {
        variable = "ingenieur";
        displayName = "STR_License_Ingenieur";
        price = 300000;
        illegal = true;
        side = "civ";
    };

    class offroadarmed {
        variable = "offroadarmed";
        displayName = "STR_License_Offroadarmed";
        price = 400000;
        illegal = true;
        side = "civ";
    };

    class tempest {
        variable = "tempest";
        displayName = "STR_License_Tempest";
        price = 800000;
        illegal = false;
        side = "civ";
    };

    class hemttplan {
        variable = "hemttplan";
        displayName = "STR_License_Hemttplan";
        price = 600000;
        illegal = false;
        side = "civ";
    };

    //Cop Licenses
    class cAir {
        variable = "cAir";
        displayName = "STR_License_Pilot";
        price = 15000;
        illegal = false;
        side = "cop";
    };

    class cg {
        variable = "cg";
        displayName = "STR_License_CG";
        price = 8000;
        illegal = false;
        side = "cop";
    };
	
    class rebel {
        variable = "rebel";
        displayName = "STR_License_Rebel";
        price = 500000;
        illegal = true;
        side = "civ";
    };
	
    //Medic Licenses
    class mAir {
        variable = "mAir";
        displayName = "STR_License_Pilot";
        price = 15000;
        illegal = false;
        side = "med";
    };
};
