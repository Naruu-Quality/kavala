/*
	Simple weather script
	init_weather.sqf
*/

if(isDedicated)then
{
	while {true}do
	{
		60 setfog 0;
		60 setRain 0;
		0 setOvercast 0;
		sleep 1200;
	};
};

//JIP und sync Gedöhns
// if (!isDedicated) then
// {
	// while {true}do
	// {
		// 60 setfog 0;
		// 60 setRain 0;
		// 0 setOvercast 0;
		// uiSleep 1200;
	// };
// };