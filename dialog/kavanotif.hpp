#define ST_CENTER         0x02
/*
	File: kavanotif.hpp
*/

class playerKAVAnotif {
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerKAVAnotif";
	onLoad = "uiNamespace setVariable ['playerKAVAnotif',_this select 0]";
	objects[] = {};
	controls[] = {
		Life_RscText_Notif1,
		Life_RscText_Notif2,
		Life_RscText_Notif3,
		Life_RscText_Notif4,
		Life_RscText_Notif5,
		Life_RscText_Notif6
	};

	class Life_RscText_Notif1 : Life_RscStructuredText {
		idc = 5000;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};
	class Life_RscText_Notif2 : Life_RscStructuredText {
		idc = 5001;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.951 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};
	class Life_RscText_Notif3 : Life_RscStructuredText {
		idc = 5002;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.929 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};
	class Life_RscText_Notif4 : Life_RscStructuredText {
		idc = 5003;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.907 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};
	class Life_RscText_Notif5 : Life_RscStructuredText {
		idc = 5004;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.885 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};
	class Life_RscText_Notif6 : Life_RscStructuredText {
		idc = 5005;
		style = ST_CENTER;
		text = "";
		x = 0.066875 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.840469 * safezoneW;
		h = 0.022 * safezoneH;
		class Attributes 
		{
			align = "center";
			font = "PuristaMedium";
		};
	};

};

