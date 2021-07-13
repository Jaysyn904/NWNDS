/*
    ar_inc_pcspawn.nss
    Constants for various spawn waypoints
*/

#include "prc_racial_const"

//void main(){}

//start locations
const string AR_START_WP_BELGOISTART="WP_BelgoiStart";
const string AR_START_WP_GITHSTART="WP_GithStart";
const string AR_START_WP_ILLITHIDSTART="WP_IllithidStart";
const string AR_START_WP_KLEDSTART="WP_KledStart";
const string AR_START_WP_REGGELIDSTART="WP_ReggelidStart";
const string AR_START_WP_THRAXSTART="WP_ThraxStart";
const string AR_START_WP_TYRSTART="WP_TyrStart";
const string AR_START_WP_UNDEADSTART="WP_UndeadStart";
const string AR_START_WP_URIKSTART="WP_UrikStart";
const string AR_START_WP_YUANTISTART="WP_YuantiStart";
const string DS_START_WP_TARISTART="WP_TariStart";
const string DS_START_WP_SILVERSTART="WP_SilverStart";


//Respawn Locations
const string AR_RESPAWN_WP_TYRRESPAWN="WP_TyrRespawn";
const string AR_RESPAWN_WP_URIKRESPAWN="WP_UrikRespawn";
const string AR_RESPAWN_WP_KLEDRESPAWN="WP_KledRespawn";
const string AR_RESPAWN_WP_ALTARUKRESPAWN="WP_AltarukRespawn";
const string AR_RESPAWN_WP_BELGOIRESPAWN="WP_BelgoiRespawn";
const string AR_RESPAWN_WP_GITHRESPAWN="WP_GithRespawn";
const string AR_RESPAWN_WP_ILLITHIDRESPAWN="WP_IllithidRespawn";
const string AR_RESPAWN_WP_REGGELIDRESPAWN="WP_ReggelidRespawn";
const string AR_RESPAWN_WP_THRAXRESPAWN="WP_ThraxRespawn";
const string AR_RESPAWN_WP_UNDEADRESPAWN="WP_UndeadRespawn";
const string AR_RESPAWN_WP_YUANTIRESPAWN="WP_YauntiRespawn";
const string AR_RESPAWN_WP_FIRERESPAWN="WP_FireRespawn";
const string AR_RESPAWN_WP_WATERRESPAWN="WP_WaterRespawn";
const string AR_RESPAWN_WP_EARTHRESPAWN="WP_EarthRespawn";
const string AR_RESPAWN_WP_AIRRESPAWN="WP_AirRespawn";
const string AR_RESPAWN_WP_MAGMARESPAWN="WP_MagmaRespawn";
const string AR_RESPAWN_WP_SILTRESPAWN="WP_SiltRespawn";
const string AR_RESPAWN_WP_SUNRESPAWN="WP_SunRespawn";
const string AR_RESPAWN_WP_RAINRESPAWN="WP_RainRespawn";
const string DS_RESPAWN_WP_SILVERRESPAWN="WP_SilverRespawn";
const string DS_RESPAWN_WP_TARIRESPAWN="WP_TariRespawn";

//SubRace Const
const string AR_SUBRACE_AARAKOCRA="aarakocra";
const string AR_SUBRACE_AASIMAR="aasimar";
const string AR_SUBRACE_AIR_GENASI="air-genasi";
const string AR_SUBRACE_BELGOI="belgoi";
const string AR_SUBRACE_DWARF="dwarf";
const string AR_SUBRACE_EARTH_GENASI="earth-genasi";
const string AR_SUBRACE_ELF="elf";
const string AR_SUBRACE_FIRE_GENASI="fire-genasi";
const string AR_SUBRACE_GITH="gith";
const string AR_SUBRACE_GITHYANKI="githyanki";
const string AR_SUBRACE_GITHZERI="githzeri";
const string AR_SUBRACE_HALF_ELF="half-elf";
const string AR_SUBRACE_HALF_GIANT="half-giant";
const string AR_SUBRACE_HALFLING="halfling";
const string AR_SUBRACE_ILLITHID="illithid";
const string AR_SUBRACE_KIRRE="kirre";
const string AR_SUBRACE_MAGMA_GENASI="magma-genasi";
const string AR_SUBRACE_MUL="mul";
const string AR_SUBRACE_PTERRAN="pterran";
const string AR_SUBRACE_RAIN_GENASI="rain-genasi";
const string AR_SUBRACE_REGGELID="reggelid";
const string AR_SUBRACE_SILT_GENASI="silt-genasi";
const string AR_SUBRACE_SUN_GENASI="sun-genasi";
const string AR_SUBRACE_TARI="tari";
const string AR_SUBRACE_THRAX="thrax";
const string AR_SUBRACE_THRI_KREEN="thri-kreen";
const string AR_SUBRACE_TIEFLING="tiefling";
const string AR_SUBRACE_UNDEAD="undead";
const string AR_SUBRACE_VILLICHI="villichi";
const string AR_SUBRACE_WATER_GENASI="water-genasi";
const string AR_SUBRACE_YUAN_TI="yuan-ti";

const string AR_SKIP_ONENTER_JUMP="AR_SKIP_NEXT_JUMP";

//change this tag to match the waypoint of the start location int he Gray.
const string AR_STARTLOC_THEGRAY="WP_GrayStart";



// Returns the respawn waypoint of oPC based on Subrace
string GetSubRaceAdjustedRespawnPoint(object oPC);

// Returns the correct Start location using oPC's
// race and xp
string GetSubRaceAdjustedStartPoint(object oPC);

//Set Local var to skip the jump on re-entry
void SkipNextJump(object oPC);

// Spawns oPC in a safe area
// Set bGoToGray to true oPC will automaticaly go to the gray.
// Set bRespawn to True to send oPC to the respected respawn points by SubRace.
void ARSpawnPC(object oPC,int bRespawn=FALSE, int bGoToGray = FALSE);


//Set Local var to skip the jump on re-entry
void SkipNextJump(object oPC)
{
    int nVal = TRUE;
    SetLocalInt(oPC,AR_SKIP_ONENTER_JUMP,nVal);

}

// Returns the correct Start location using oPC's
// race and xp
string GetSubRaceAdjustedStartPoint(object oPC)
{
string sSubRace = GetSubRace(oPC);
sSubRace = GetStringLowerCase(sSubRace);
string sTag=AR_START_WP_TYRSTART;

int nRoll;
if(GetRacialType(oPC) == RACIAL_TYPE_AARAKOCRA)
        {
        nRoll=d2();
        if(nRoll==1)sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_AIR_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_BELGOI)
       {
        sTag = AR_START_WP_BELGOISTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_DS_DWARF)
        {
        nRoll=d3();
        if(nRoll==1)sTag = AR_START_WP_URIKSTART;
        if(nRoll==2)sTag = AR_START_WP_TYRSTART;
        if(nRoll==3)sTag = AR_START_WP_KLEDSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_EARTH_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_DS_ELF)
        {
        nRoll=d3();
        if(nRoll==1)sTag = AR_START_WP_URIKSTART;
        if(nRoll==2)sTag = AR_START_WP_TYRSTART;
        if(nRoll==3)sTag = DS_START_WP_SILVERSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_FIRE_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_GITH)
        {
        sTag = AR_START_WP_GITHSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_GITHYANKI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_GITHZERAI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_DS_HALFELF)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_DS_HALFGIANT)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_DS_HALFLING)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_ILLITHID)
        {
        sTag=AR_START_WP_ILLITHIDSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_MAGMA_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_MUL)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_PTERRAN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_RAIN_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_REGGELID)
        {
        sTag=AR_START_WP_REGGELIDSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_SILT_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_SUN_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_TARI)
        {
        sTag = DS_START_WP_TARISTART;
        }
/*if(GetRacialType(oPC) ==  RACIAL_TYPE_THRAX)
        {
        sTag= AR_START_WP_THRAXSTART;
        }*/
if(GetRacialType(oPC) == RACIAL_TYPE_JERAL  ||
   GetRacialType(oPC) == RACIAL_TYPE_JHOL  ||
   GetRacialType(oPC) == RACIAL_TYPE_JEZ  ||
   GetRacialType(oPC) == RACIAL_TYPE_THRIKREEN  ||
   GetRacialType(oPC) == RACIAL_TYPE_TKEECH  ||
   GetRacialType(oPC) == RACIAL_TYPE_TOKSA  ||
   GetRacialType(oPC) == RACIAL_TYPE_TONDI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
/*if(GetRacialType(oPC) ==  RACIAL_TYPE_UNDEAD)
        {
        sTag = AR_START_WP_UNDEADSTART;
        }
if(GetRacialType(oPC) ==  RACIAL_TYPE_VILLICHI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }*/
if(GetRacialType(oPC) ==  RACIAL_TYPE_WATER_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_START_WP_URIKSTART;
        sTag = AR_START_WP_TYRSTART;
        }
if( GetRacialType(oPC) == RACIAL_TYPE_ABOM_YUAN ||  //  Yuan-Ti Abomination
    GetRacialType(oPC) == RACIAL_TYPE_PURE_YUAN )   //  Yuan-Ti Pureblood
        {
        sTag=AR_START_WP_YUANTISTART;
        }
return(sTag);

}

// Spawns oPC in a safe area
// Set bGoToGray to true oPC will automaticaly go to the gray.
// Set bRespawn to True to send oPC to the respected respawn points by SubRace.
void ARSpawnPC(object oPC,int bRespawn=FALSE, int bGoToGray = FALSE)
{
  object oWayPoint= GetObjectByTag(GetSubRaceAdjustedStartPoint(oPC));

  if(bGoToGray)
  {
  oWayPoint = GetObjectByTag(AR_STARTLOC_THEGRAY);
  }
  else if(bRespawn)
  {
  oWayPoint = GetObjectByTag(GetSubRaceAdjustedRespawnPoint(oPC));
  }
  ClearAllActions();
  AssignCommand(oPC,ActionJumpToObject(oWayPoint));

}

// Returns the respawn waypoint of oPC based on Subrace
string GetSubRaceAdjustedRespawnPoint(object oPC)
{
string sSubRace = GetSubRace(oPC);
sSubRace = GetStringLowerCase(sSubRace);
string sTag=AR_RESPAWN_WP_TYRRESPAWN;

int nRoll;
if(GetRacialType(oPC) == RACIAL_TYPE_AARAKOCRA)
        {
        nRoll=d2();
        if(nRoll==1)sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_AIR_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_BELGOI)
        {
        sTag = AR_RESPAWN_WP_BELGOIRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_DS_DWARF)
        {
        nRoll=d3();
        if(nRoll==1)sTag = AR_RESPAWN_WP_KLEDRESPAWN;
        if(nRoll==2)sTag = AR_RESPAWN_WP_TYRRESPAWN;
        if(nRoll==3)sTag = AR_RESPAWN_WP_URIKRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_EARTH_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_DS_ELF)
        {
        nRoll=d3();
        if(nRoll==1)sTag = AR_RESPAWN_WP_URIKRESPAWN;
        if(nRoll==2)sTag = AR_RESPAWN_WP_TYRRESPAWN;
        if(nRoll==3)sTag = DS_RESPAWN_WP_SILVERRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_FIRE_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_GITH)
        {
        sTag = AR_RESPAWN_WP_GITHRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_GITHYANKI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_GITHZERAI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_DS_HALFELF)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_DS_HALFGIANT)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_DS_HALFLING)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_ILLITHID)
        {
        sTag=AR_RESPAWN_WP_ILLITHIDRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_MAGMA_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_MUL)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_PTERRAN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_RAIN_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_REGGELID)
        {
        sTag=AR_RESPAWN_WP_REGGELIDRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_SILT_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_SUN_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_TARI)
        {
        nRoll=d3();
        if(nRoll==1)sTag = AR_RESPAWN_WP_URIKRESPAWN;
        if(nRoll==2)sTag = AR_RESPAWN_WP_TYRRESPAWN;
        if(nRoll==3)sTag = DS_RESPAWN_WP_TARIRESPAWN;
        }
/*if(GetRacialType(oPC) == RACIAL_TYPE_THRAX)
        {
        sTag= AR_RESPAWN_WP_THRAXRESPAWN;
        }*/
if(GetRacialType(oPC) == RACIAL_TYPE_JERAL  ||
   GetRacialType(oPC) == RACIAL_TYPE_JHOL  ||
   GetRacialType(oPC) == RACIAL_TYPE_JEZ  ||
   GetRacialType(oPC) == RACIAL_TYPE_THRIKREEN  ||
   GetRacialType(oPC) == RACIAL_TYPE_TKEECH  ||
   GetRacialType(oPC) == RACIAL_TYPE_TOKSA  ||
   GetRacialType(oPC) == RACIAL_TYPE_TONDI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
/*if(GetRacialType(oPC) == RACIAL_TYPE_UNDEAD)
        {
        sTag = AR_RESPAWN_WP_UNDEADRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_VILLICHI)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }*/
if(GetRacialType(oPC) == RACIAL_TYPE_WATER_GEN)
        {
        nRoll=d2();
        if(nRoll==1) sTag = AR_RESPAWN_WP_URIKRESPAWN;
        sTag = AR_RESPAWN_WP_TYRRESPAWN;
        }
if(GetRacialType(oPC) == RACIAL_TYPE_ABOM_YUAN ||  //  Yuan-Ti Abomination
   GetRacialType(oPC) == RACIAL_TYPE_PURE_YUAN )   //  Yuan-Ti Pureblood
        {
        sTag=AR_RESPAWN_WP_YUANTIRESPAWN;
        }
return (sTag);

}


