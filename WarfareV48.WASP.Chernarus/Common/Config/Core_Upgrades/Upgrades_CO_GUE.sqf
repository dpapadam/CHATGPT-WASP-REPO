Private ["_side"];

_side = _this;

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_ENABLED", _side], [
	true, //--- Barracks
	true, //--- Light
	true, //--- Heavy
	true, //--- Air
	true, //--- Paratroopers
	if (isNil{missionNamespace getVariable Format["WFBE_%1UAV", _side]}) then {false} else {true}, //--- UAV
	true, //--- Supply
	true, //--- Respawn Range
	true, //--- Airlift
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") == 1) then {true} else {false}, //--- Custom Flares
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0) then {true} else {false}, //--- Artillery Time
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_ICBM") > 0 && !(IS_air_war_event)) then {true} else {false}, //--- ICBM
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL") > 0) then {true} else {false}, //--- Fast Travel
	true, //--- Gear
	true, //--- Build Ammo
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {true} else {false}, //--- EASA
	true, //--- Supply Paradrop
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0) then {true} else {false}, //--- Artillery Ammo
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then {true} else {false}, //--- IR Smoke
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") == 1) then {true} else {false}, //--- Aircraft AA Missiles
	true //--- Anti Air radar
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_COSTS", _side], [
	[[540,0],[1350,0],[2070,0],[0,0]], //--- Barracks
	[[250,0],[950,0],[1900,0],[3500,0],[0,0]], //--- Light
	[[1200,0],[4400,0],[9500,0],[10500,0],[0,0]], //--- Heavy
	[[1200,0],[4000,0],[9200,0],[10500,0],[17600,0],[0,0]], //--- Air
	[[1500,0],[2500,0],[3500,0],[0,0]], //--- Paratroopers
	[[2000,0],[0,0]], //--- UAV
	[[2700,0],[4800,0],[6000,0],[0,0]], //--- Supply
	[[500,0],[1500,0],[0,0]], //--- Respawn Range
	[[1000,0],[0,0]], //--- Airlift
	[[4500,0],[0,0]], //--- Custom Flares
	[[800,0],[1400,0],[2200,0],[3700,0],[6100,0],[10000,0],[0,0]], //--- Artillery Time
	[[49500,80000],[0,0]], //--- ICBM
	[[1500,0],[0,0]], //--- Fast Travel
	[[250,0],[650,0],[1200,0],[2100,0],[2400,0],[0,0]], //--- Gear
	[[750,0],[0,0]], //--- Build Ammo
	[[4000,0],[0,0]], //--- EASA
	[[2000,0],[0,0]], //--- Supply Paradrop
	[[2500,0],[3500,0],[6000,0],[0,0]], //--- Artillery Ammo
	[[3000,0],[9000,0],[0,0]], //--- IR Smoke
	[[7500,0],[0,0]], //--- Aircraft AA Missiles
	[[5000,0],[12500,0],[0,0]] //--- Anti Air Radar
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_LEVELS", _side], [
	3, //--- Barracks
	4, //--- Light
	4, //--- Heavy
	5, //--- Air
	3, //--- Paratroopers
	1, //--- UAV
	3, //--- Supply
	2, //--- Respawn Range
	1, //--- Airlift
	1, //--- Custom Flares
	6, //--- Artillery Time
	1, //--- ICBM
	1, //--- Fast Travel
	5, //--- Gear
	1, //--- Build Ammo
	1, //--- EASA
	1, //--- Supply Paradrop
	3, //--- Artillery Ammo
	2, //--- IR Smoke
	1 //--- Aircraft AA Missiles
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_LINKS", _side], [
	[[[WFBE_UP_GEAR,1],[WFBE_UP_GEAR,2]],[[WFBE_UP_GEAR,1],[WFBE_UP_GEAR,2],[WFBE_UP_GEAR,3]],[[WFBE_UP_GEAR,1],[WFBE_UP_GEAR,2],[WFBE_UP_GEAR,3],[WFBE_UP_GEAR,4],[WFBE_UP_GEAR,5]]], //--- Barracks
	[[],[WFBE_UP_LIGHT,1],[WFBE_UP_LIGHT,2],[WFBE_UP_LIGHT,3]], //--- Light
	[[],[WFBE_UP_HEAVY,1],[WFBE_UP_HEAVY,2],[WFBE_UP_HEAVY,3]], //--- Heavy
	[[],[WFBE_UP_AIR,1],[WFBE_UP_AIR,2],[WFBE_UP_AIR,3],[WFBE_UP_AIR,4]], //--- Air
	[
		[[WFBE_UP_BARRACKS,1],[WFBE_UP_AIR,1],[WFBE_UP_GEAR,1]],
		[[WFBE_UP_BARRACKS,2],[WFBE_UP_AIR,2],[WFBE_UP_GEAR,2]],
		[[WFBE_UP_BARRACKS,3],[WFBE_UP_AIR,3],[WFBE_UP_GEAR,3]]
	], //--- Paratroopers
	[[WFBE_UP_AIR,2]], //--- UAV
	[[],[WFBE_UP_SUPPLYRATE,1],[WFBE_UP_SUPPLYRATE,2]], //--- Supply
	[[WFBE_UP_LIGHT,1],[WFBE_UP_LIGHT,1]], //--- Respawn Range
	[[WFBE_UP_AIR,1]], //--- Airlift
	[[WFBE_UP_AIR,2]], //--- Custom Flares
    [[],[WFBE_UP_ARTYTIMEOUT,1],[WFBE_UP_ARTYTIMEOUT,2],[WFBE_UP_ARTYTIMEOUT,3],[WFBE_UP_ARTYTIMEOUT,4],[WFBE_UP_ARTYTIMEOUT,5]], //--- Artillery Time
	[[WFBE_UP_AIR,5]], //--- ICBM
	[
		[[WFBE_UP_LIGHT,1],[WFBE_UP_SUPPLYRATE,1]]
	], //--- Fast Travel
	[[],[WFBE_UP_GEAR,1],[WFBE_UP_GEAR,2],[WFBE_UP_GEAR,3],[WFBE_UP_GEAR,4]], //--- Gear
	[[WFBE_UP_GEAR,5]], //--- Build Ammo
	[[WFBE_UP_AIR,1]], //--- EASA
	[[WFBE_UP_AIRLIFT,1]], //--- Supply Paradrop
	[
		[[WFBE_UP_GEAR,1],[WFBE_UP_HEAVY,1]],
		[[WFBE_UP_GEAR,2],[WFBE_UP_HEAVY,2]],
		[[WFBE_UP_GEAR,3],[WFBE_UP_HEAVY,3]]
	], //--- Artillery Ammo
	[[WFBE_UP_HEAVY, 3],[WFBE_UP_HEAVY, 3]], //--- IR Smoke
	[[WFBE_UP_AIR, 3]], //--- Aircraft AA Missiles
	[[],[WFBE_UP_AAR,1]] //--- Anti Air Radar
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_TIMES", _side], [
	[30,60,90], //--- Barracks
	[40,70,100,130], //--- Light
	[30,50,80,100], //--- Heavy
	[60,80,100,120,140], //--- Air
	[35,55,75], //--- Paratroopers
	[60], //--- UAV
	[60,80,120], //--- Supply
	[30,60], //--- Respawn Range
	[30], //--- Airlift
	[100], //--- Custom Flares
	[40,70,100,130,160,190], //--- Artillery Time
	[300], //--- ICBM
	[60], //--- Fast Travel
	[25,50,75,100,125], //--- Gear
	[40], //--- Build Ammo
	[90], //--- EASA
	[50], //--- Supply Paradrop
	[60,120,180], //--- Artillery Ammo
	[120,180], //--- IR Smoke
	[120], //--- Aircraft AA Missiles
	[50,125] //--- Anti Air Radar
]];

//todo, on commander missing link checkup, skip disabled upgrades.
missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_AI_ORDER", _side], [
[WFBE_UP_LIGHT,1],
[WFBE_UP_LIGHT,2],
[WFBE_UP_RESPAWNRANGE,1],
[WFBE_UP_LIGHT,3],
[WFBE_UP_GEAR,1],
[WFBE_UP_GEAR,2],
[WFBE_UP_BARRACKS,1],
[WFBE_UP_GEAR,3],
[WFBE_UP_RESPAWNRANGE,2],
[WFBE_UP_GEAR,4],
[WFBE_UP_BARRACKS,2],
[WFBE_UP_HEAVY,1],
[WFBE_UP_SUPPLYRATE,1],
[WFBE_UP_HEAVY,2],
[WFBE_UP_SUPPLYRATE,2],
[WFBE_UP_HEAVY,3],
[WFBE_UP_IRSMOKE,1],
[WFBE_UP_LIGHT,4],
[WFBE_UP_IRSMOKE,2],
[WFBE_UP_SUPPLYRATE,3],
[WFBE_UP_GEAR,5],
[WFBE_UP_BARRACKS,3],
[WFBE_UP_HEAVY,4],
[WFBE_UP_AAR,1],
[WFBE_UP_AIR,1],
[WFBE_UP_EASA,1],
[WFBE_UP_AIR,2],
[WFBE_UP_FLARESCM,1],
[WFBE_UP_AIRLIFT,1],
[WFBE_UP_AIR,3],
[WFBE_UP_SUPPLYPARADROP,1],
[WFBE_UP_AIRAAM,1],
[WFBE_UP_AAR,2],
[WFBE_UP_AIR,4],
[WFBE_UP_PARATROOPERS,1],
[WFBE_UP_AIR,5],
[WFBE_UP_PARATROOPERS,2],
[WFBE_UP_PARATROOPERS,3],
[WFBE_UP_UAV,1],
[WFBE_UP_AMMOCOIN,1],
[WFBE_UP_ARTYTIMEOUT,1],
[WFBE_UP_ARTYTIMEOUT,2],
[WFBE_UP_ARTYTIMEOUT,3],
[WFBE_UP_ARTYAMMO,1],
[WFBE_UP_ARTYAMMO,2],
[WFBE_UP_ARTYTIMEOUT,4],
[WFBE_UP_ARTYTIMEOUT,5],
[WFBE_UP_ARTYAMMO,3],
[WFBE_UP_ARTYTIMEOUT,6],
[WFBE_UP_ICBM,1]
]];

//--- Check potential missing definition.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Check_Upgrades.sqf";