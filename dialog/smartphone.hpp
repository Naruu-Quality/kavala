class Life_KPhone {
	idd = 88000;
	name = "Life_KPhone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";
	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,0.7};
		};
		class MessageListTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.0125;
			y = 0.06;
			w = 0.8;
			h = 0.04;
			colorBackground[] = {0.588,0.424,0.145,1};
		};
		class RandomTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.48;
			w = 0.8;
			h = 0.04;
			colorBackground[] = {0.588,0.424,0.145,1};
		};
		class PhoneTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 1;
			h = 0.04;
			colorBackground[] = {0.588,0.424,0.145,1};
		};
		class ServicesTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.7;
			w = 0.375;
			h = 0.04;
			colorBackground[] = {0.588,0.424,0.145,1};
		};
	};
	
	class controls {
		class MessageListTitle: Life_RscTitle
		{
			idc = -1;
			text = "Liste des messages";
			x = 0.0125;
			y = 0.06;
			w = 0.8;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};	
		};
		class PlayerListTitle: Life_RscTitle
		{
			idc = -1;
			text = "Joueurs";
			x = 0.4;
			y = 0.72;
			w = 0.1375;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class FriendListTitle: Life_RscTitle
		{
			idc = -1;
			text = "Amis";
			x = 0.4;
			y = 0.78;
			w = 0.1375;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class PhoneTitle: Life_RscTitle
		{
			idc = -1;
			text = "Menu KavaPhone";
			x = 0;
			y = 0;
			w = 1;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class RandomTitle: Life_RscTitle
		{
			idc = 88001;
			text = "Detail du message";
			x = 0.0125;
			y = 0.48;
			w = 0.8;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};		
		class MessageTarget: Life_RscTitle
		{
			idc = 88002;
			text = "Cible Actuel: Personne";
			x = 0.175;
			y = 0.94;
			w = 0.4125;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};		
		class ServicesTitle: Life_RscTitle
		{
			idc = -1;
			style = ST_CENTER;
			text = "Services";
			x = 0.0125;
			y = 0.7;
			w = 0.375;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
			class Attributes 
			{
				align = "center";
			};
		};		
		class MessageList: Life_RscListNBox
		{
			idc = 88003;
			onLBSelChanged = "[(lbCurSel 88003)] call life_fnc_showMessage;";
			x = 0.0125;
			y = 0.12;
			w = 0.7875;
			h = 0.34;		
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			text = "";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			
			
		};		
		class MessageDetail: Life_RscStructuredText
		{
			idc = 88004;
			x = 0.0125;
			y = 0.54;
			w = 0.975;
			h = 0.16;
		};
		class PlayerList: Life_RscCombo
		{
			idc = 88005;
			onLBSelChanged = "[0] call life_fnc_updateSender;";

			x = 0.55;
			y = 0.72;
			w = 0.2375;
			h = 0.04;
		};
		class FriendList: Life_RscCombo
		{
			idc = 88006;
			onLBSelChanged = "[1] call life_fnc_updateSender;";
			x = 0.55;
			y = 0.78;
			w = 0.2375;
			h = 0.04;
		};	
		class ServicesList: Life_RscCombo
		{
			idc = 88016;
			onLBSelChanged = "[2] call life_fnc_updateSender;";
			x = 0.0125;
			y = 0.76;
			w = 0.375;
			h = 0.04;
		};		
		class Message: Life_RscEdit
		{
			idc = 88007;
			style = ST_MULTI;
			text = "";
			x = 0.0125;
			y = 0.828417;
			w = 0.975;
			h = 0.1;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class SendMessButton: Life_RscButtonMenu
		{
			idc = 88008;
			onButtonClick = "[false] spawn life_fnc_sendMessage;";
			text = "Ecrire";
			x = 0.8;
			y = 0.94;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		class AdminToOneButton: Life_RscButtonMenu
		{
			onButtonClick = "[true] spawn life_fnc_sendMessage;";
			idc = 88009;
			text = "Admin a 1";
			x = 0.6;
			y = 0.94;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
		class deleteButton: Life_RscButtonMenu
		{
			// onButtonClick = "createDialog "Life_smartphone_notruf";";

			idc = 88010;
			text = "Supprimer";
			x = 0.8125;
			y = 0.14;
			w = 0.175;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		class deleteallButton: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_deleteMess;";
			idc = 88011;
			text = "Supp Tout";
			x = 0.8125;
			y = 0.2;
			w = 0.175;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
		class AdminSendButton: Life_RscButtonMenu
		{
			onButtonClick = "[5] call life_fnc_updateSender;";

			idc = 88014;
			text = "Admin";
			x = 0.8;
			y = 0.78;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
		class AdminToAllButton: Life_RscButtonMenu
		{
			onButtonClick = "[6] call life_fnc_updateSender;";

			idc = 88015;
			text = "Admin Tous";
			x = 0.8;
			y = 0.72;
			w = 0.1875;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};

		class CloseButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "Fermer";
			x = 0.0125;
			y = 0.94;
			w = 0.15625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};	

		class UrgenceTaxiButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;[] spawn life_fnc_uberMenu;";

			idc = 88017;
			text = "Taxi";
			x = 0.8125;
			y = 0.36;
			w = 0.175;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.8,0.8,0,0.8};
		};	
		class SupplyButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;[] spawn life_fnc_supplyRequest;";

			idc = 88018;
			text = "Largage";
			x = 0.8125;
			y = 0.42;
			w = 0.175;
			h = 0.04;
			colorText[] = {0,0.7,0,0.8};
			colorBackground[] = {0.8,0.8,0,0.8};
		};	
	};
};