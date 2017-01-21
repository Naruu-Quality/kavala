class Life_NotifHistory {
	idd = 50000;
	name = "Life_NotifHistory";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.12875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.804375 * safezoneW;
			h = 0.66 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls {
		class HistoryListTitle: Life_RscTitle
		{
			idc = -1;
			text = "Historique Notification";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.804375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {0.588,0.424,0.145,1};
		};	
		class HistoryList: Life_RscListNBox
		{
			idc = 50001;
			rowHeight = 0.05;

			x = 0.133906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.794062 * safezoneW;
			h = 0.616 * safezoneH;	
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			text = "";
			colorBackground[] = {0, 0, 0, 0.0};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			
			
		};		

		class deleteallButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;life_KavaNotif = [];";

			idc = 50002;
			text = "Effacer";
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};

		class CloseButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "Fermer";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};	
	};
};