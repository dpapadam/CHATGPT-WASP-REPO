/*
	Script: Skill System by Benny.
	Description: Skill Initialization.
*/

/* Skills Root */
WFBE_SK_V_Root = 'Client\Module\Skill\Skill_';

/* Functions */
WFBE_SK_FNC_Apply = Compile preprocessFile "Client\Module\Skill\Skill_Apply.sqf";

/* Define which classname belong to which skill group */
WFBE_SK_V_Engineers = ['USMC_SoldierS_Engineer','CDF_Soldier_Engineer','Ins_Soldier_Sapper','TK_Soldier_Engineer_EP1','Ins_Soldier_CO','US_Soldier_Engineer_EP1','US_Soldier_Officer_EP1','BAF_Soldier_SL_DDPM','MVD_Soldier_TL','USMC_Soldier_TL','TK_Soldier_Officer_EP1']; // description="Engineer (Repair, Salvage, Camps restore)";
WFBE_SK_V_Soldiers = ['CDF_Soldier','RUS_Soldier1','US_Delta_Force_EP1','TK_Special_Forces_EP1','FR_OHara','FR_R','Ins_Soldier_1']; // description="Soldier (Double team size, Camp restore)";
WFBE_SK_V_SpecsOps = ['FR_TL','RUS_Soldier_TL','US_Soldier_TL_EP1','US_Delta_Force_TL_EP1','TK_Special_Forces_TL_EP1','CDF_Soldier_TL','Ins_Soldier_2','GER_Soldier_Scout_EP1','RUS_Commander']; // description="SpecOPS (Lockpick, Supply run)";
WFBE_SK_V_Spotters = ['US_Soldier_Sniper_EP1','TK_Soldier_Sniper_EP1','Ins_Soldier_Sniper','CDF_Soldier_Sniper','USMC_SoldierS_Sniper','RU_Soldier_Sniper']; // description="Sniper (Spot marks on map, Lockpick, Camps restore)";
WFBE_SK_V_Medics = ['FR_Corpsman','US_Soldier_Medic_EP1','TK_Soldier_Medic_EP1','RUS_Soldier_Medic','GER_Soldier_Medic_EP1','BAF_Soldier_Medic_DDPM','RU_Soldier_Medic','US_Delta_Force_Medic_EP1','USMC_Soldier_Medic']; // description="Medic (Fast heal, Camps restore)";

//--- Binoculars.
missionNamespace setVariable ["WFBE_BINOCULARS", ["Laserdesignator", "Binocular", "Binocular_Vector"]];

/* Skills Variables */
WFBE_SK_V_LastUse_Repair = -1200;
WFBE_SK_V_LastUse_LR = -1200;
WFBE_SK_V_LastUse_MASH = -1200;
WFBE_SK_V_LastUse_Lockpick = -1200;
WFBE_SK_V_LastUse_Salvage = -1200;
WFBE_SK_V_LastUse_Spot = -1200;

/* Skills Timeout */
WFBE_SK_V_Reload_Repair = 25;
WFBE_SK_V_Reload_LR = 300;
WFBE_SK_V_Reload_MASH = 600;
WFBE_SK_V_Reload_Lockpick = 5;
WFBE_SK_V_Reload_Salvage = 10;
WFBE_SK_V_Reload_Spot = 8;


/* Find the player type */
WFBE_SK_V_Type = "";
if (playerType in WFBE_SK_V_Engineers) then {WFBE_SK_V_Type = "Engineer"};
if (playerType in WFBE_SK_V_Soldiers) then {WFBE_SK_V_Type = "Soldier"};
if (playerType in WFBE_SK_V_SpecsOps) then {WFBE_SK_V_Type = "SpecOps"};
if (playerType in WFBE_SK_V_Spotters) then {WFBE_SK_V_Type = "Spotter"};
if (playerType in WFBE_SK_V_Medics) then {WFBE_SK_V_Type = "Medic"};

/* Special one time init */
/* The soldier can hire more units than the others leader */
if (WFBE_SK_V_Type == 'Soldier') then {missionNamespace setVariable ['WFBE_C_PLAYERS_AI_MAX',ceil (1.5*(missionNamespace getVariable "WFBE_C_PLAYERS_AI_MAX"))]};