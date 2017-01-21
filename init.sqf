/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;
enableSaving[false,false];
setTerrainGrid 25;
setViewDistance 1000;
setObjectViewDistance [800,50];
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "init_weather.sqf";

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
6 enableChannel false;

enableSentences false;
enableRadio false;
0 fadeRadio 0;

player setVariable ["BIS_noCoreConversations", true];
player disableConversation true;

0 setOvercast 0;
0 setRain 0;
0 setFog 0;
StartProgress = true;