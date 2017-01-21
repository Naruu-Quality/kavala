class Life_friendlist {
	idd = 6700;
	name= "life_friendlist";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_friendMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0.509 , 0.121,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Liste des amis";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class FriendList : Life_RscListBox 
		{
			idc = 6701;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.56; h = 0.370;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ListPlayers : Life_RscCombo {
		
		idc = 6702;
		
		x = 0.26; y = 0.645;
		w = 0.275; h = 0.03;
		
		};
		
		
		class AskFriend : Life_RscButtonMenu {
			idc = 6703;
			text = "Demande Amis";
			colorBackground[] = {0, 0.509 , 0.121,0.5};
			onButtonClick = "[] call life_fnc_askFriend";
			x = 0.32;
			y = 0.69;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};