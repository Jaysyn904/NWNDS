#include "fincludes"
#include "ar_inc_massbuff"
#include "prc_feat_const"

const string NC_RESPONSE_RELEVEL_CLASS = "You are not allowed to multi-class with the chosen class. Please Re-level..";
const string NC_RESPONSE_RELEVEL_DOMAIN = "Illegal Domain combination taken. Please Re-level..";
const string NC_RESPONSE_RELEVEL_TEMPLAR_DOMAIN = "Illegal Templar Domain combination taken. Please Re-level.." ;
const string NC_RESPONSE_RELEVEL_NONELEMENTAL_DOMAIN =  "Incorrect Non-Elemental Domain Combination Please Re-level..";
const string NC_RESPONSE_RELEVEL_ELEMENTAL_DOMAIN = "Incorrect Elemental Domain combination. Please Re-level..";
const string NC_RESPONSE_CHECK_TEMPLAR =  "Checking Templar Domains";
const string NC_RESPONSE_CHECK_CLERIC = "Checking Cleric Domains..";
const string NC_RESPONSE_CHECK_PALADIN = "Checking multi-class Paladin..";
const string NC_RESPONSE_CHECK_DEFILER = "Checking multi-class Defiler..";
const string NC_RESPONSE_CECK_CLERIC = "Checking multi-class Cleric..";
const string NC_RESPONSE_CHECK_DRUID = "Checking Multi-class Druid..";
const string NC_RESPONSE_TEMPLAR_DOMAIN_CORRECT = "Correct Templar Domain combination taken.";
const string NC_RESPONSE_FOUND_TEMPLAR_DOMAIN = "Templar Domain chosen...";
const string NC_RESPONSE_FOUND_CLERIC = "Cleric/Templar Class Found.";
const string NC_RESPONSE_FOUND_PALADIN = "Paladin Class Found.";
const string NC_RESPONSE_FOUND_DEFILER = "Defiler Class Found.";
const string NC_RESPONSE_FOUND_DRUID = "Druid Class Found.";
const string NC_RESPONSE_FOUND_TEMPLAR ="Templar Class Found";
const string NC_RESPONSE_CLERIC_SYMBOL = "You are more in-line with your element and able to transform into your element three times per day.";
const string NC_RESPONSE_CHECK_SUBRACE = "Checking for class restrictions for your race..";


const string SUBRACE_BELGOI="belgoi";
const string SUBRACE_THRAX="thrax";
const string SUBRACE_YUANTI="yuan-ti";
const string SUBRACE_ILLITHID="illithid";
const string SUBRACE_REGGLID="regglid";
const string SUBRACE_KIRRE="kirre";
const string NC_RESPONSE_RELEVEL_SUBRACE="You cannot take this class due to racial restrictions";

const int CLASS_TYPE_GLADIATOR =61;
//const int CLASS_TYPE_PSION=60;
//The level that a cleric recives their holy symbol.
const int AR_CLERIC_SYMBOL_LEVEL = 30;

//check race restricted classes
//returns true if oPC's race is restricted from taking nCLASS
//nCLASS= CLASS_TYPE_*
int NC_RaceRestrictedClass(object oPC,int nCLASS);

//give the cleric symbol by elemental domain
void NC_GiveClericSymbol(object oPC);

//Delevels and relevels the pc
void NC_DelevelPC(object oPC);

//check for cleric domains
int NC_CheckClericElementalDomains(object oPC);

//checks for correct templar domains
int NC_TemplarCheck(object oPC);

//Returns true if oPC has taken levels in nClas : CLASS_TYPE_*
int NC_GetHasClass(int nCLASS, object oPC);

//Returns true if correct classes have been chosen
int NC_CheckClassRestrictions(object oPC);

//returns ture if 2 non-elemental domains are chosen
int NC_CheckClericBasicDomains(object oPC);

//returns true if oPC has chosen any of the Templar Domain feats
int NC_GetIsTemplar(object oPC);

//Sends message to oPC
void NC_SendMessage(object oPC,string NC_RESPONSE,int nRed=TRUE);

int NC_CheckClericElementalDomains(object oPC)
{
    int nReturn, nCount;
    if(GetHasFeat(FEAT_AIR_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_EARTH_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_WATER_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_MAGMA_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_SUN_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_SILT_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_RAIN_DOMAIN_POWER, oPC)) nCount++;
    if(nCount == 1) nReturn = TRUE;//can only have one elemental domain
    return nReturn;
}

int NC_CheckClericBasicDomains(object oPC)
{
    int nReturn, nCount;
    if(GetHasFeat(FEAT_ANIMAL_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_DEATH_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_EVIL_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_HEALING_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_LUCK_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_MAGIC_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_PLANT_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_TRAVEL_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_TRICKERY_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_WAR_DOMAIN_POWER, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_DARKNESS, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_STORM, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_METAL, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_PORTAL, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_FORCE, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_SLIME, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_TYRANNY, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_DOMINATION, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_SPIDER, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_UNDEATH, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_TIME, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_DWARF, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_CHARM, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_ELF, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_FAMILY, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_FATE, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_GNOME, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_ILLUSION, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_HATRED, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_HALFLING, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_NOBILITY, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_OCEAN, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_ORC, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_RENEWAL, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_RETRIBUTION, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_RUNE, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_SPELLS, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_SCALEYKIND, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_BLIGHTBRINGER, oPC)) nCount++;
    if(GetHasFeat(FEAT_DOMAIN_POWER_DRAGON, oPC)) nCount++;    
    if(nCount > 0) nReturn = TRUE;
    return nReturn;
}

void NC_RelevelPC(object oPC)
{
    int nXP = GetXP(oPC);
    int nHD = GetHitDice(oPC);
    int nNewXP = ((nHD * (nHD - 1) * 500) - 1);
    SetXP(oPC, nNewXP);
    DelayCommand(1.0, SetXP(oPC, nXP));

}

void NC_GiveClericSymbol(object oPC)
{
    string sResRef;
    if(GetHasFeat(FEAT_AIR_DOMAIN_POWER, oPC)) sResRef = "airsymbol";
    if(GetHasFeat(FEAT_EARTH_DOMAIN_POWER, oPC)) sResRef = "earthsymbol";
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC)) sResRef = "firesymbol";
    if(GetHasFeat(FEAT_WATER_DOMAIN_POWER, oPC)) sResRef = "watersymbol";
    if(GetHasFeat(FEAT_MAGMA_DOMAIN_POWER, oPC)) sResRef = "magmasymbol";
    if(GetHasFeat(FEAT_SILT_DOMAIN_POWER, oPC)) sResRef = "siltsymbol";
    if(GetHasFeat(FEAT_SUN_DOMAIN_POWER, oPC)) sResRef = "sunsymbol";
    if(GetHasFeat(FEAT_RAIN_DOMAIN_POWER, oPC)) sResRef = "rainsymbol";

    if(GetLevelByClass(CLASS_TYPE_CLERIC,oPC)>=AR_CLERIC_SYMBOL_LEVEL)
        {
        object oItem = GetItemPossessedBy(oPC,sResRef);

        if(!GetIsObjectValid(oItem))
            {
            CreateItemOnObject(sResRef, oPC);
            NC_SendMessage(oPC,NC_RESPONSE_CLERIC_SYMBOL);
            }
        }
}


int NC_TemplarCheck(object oPC)
{
    NC_SendMessage(oPC, NC_RESPONSE_CHECK_TEMPLAR);
    int nReturn;
    if(GetHasFeat(FEAT_TEMPLAR_DOMAIN_POWER, oPC))
        {
        if(GetHasFeat(FEAT_DREGOTH_DOMAIN_POWER, oPC) ||
           GetHasFeat(FEAT_HAMANU_DOMAIN_POWER, oPC) ||
           GetHasFeat(FEAT_NIBENAY_DOMAIN_POWER, oPC) ||
           GetHasFeat(FEAT_ORONIS_DOMAIN_POWER, oPC) ||
           GetHasFeat(FEAT_THEOBA_DOMAIN_POWER, oPC))
            {
            NC_SendMessage(oPC, NC_RESPONSE_TEMPLAR_DOMAIN_CORRECT);
            nReturn = FALSE;
            }
        else
            {
            NC_SendMessage(oPC, NC_RESPONSE_RELEVEL_TEMPLAR_DOMAIN,TRUE);
            nReturn = TRUE;
            }
        return nReturn;
        }
    else
    {
        nReturn = TRUE;
        NC_SendMessage(oPC, NC_RESPONSE_RELEVEL_TEMPLAR_DOMAIN,TRUE);
        return nReturn;
    }
 }

int NC_GetHasClass(int nCLASS, object oPC)
 {

        if (GetLevelByClass(nCLASS, oPC)>=1)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
 }

int NC_CheckClassRestrictions(object oPC)
    {
        if (NC_GetHasClass(CLASS_TYPE_PALADIN,oPC))
            {
                NC_SendMessage(oPC, NC_RESPONSE_FOUND_PALADIN);
                NC_SendMessage(oPC, NC_RESPONSE_CHECK_PALADIN);
                if (NC_GetHasClass(CLASS_TYPE_BARD,oPC)  ||
                   NC_GetHasClass(CLASS_TYPE_HARPER,oPC)  ||
                   NC_GetHasClass(CLASS_TYPE_SORCERER,oPC)  ||
                   NC_GetHasClass(CLASS_TYPE_BLACKGUARD,oPC) ||
                   NC_GetHasClass(CLASS_TYPE_ASSASSIN,oPC)  ||
                   NC_GetHasClass(CLASS_TYPE_PALE_MASTER,oPC) ||
                   NC_RaceRestrictedClass(oPC,CLASS_TYPE_PALADIN))
                     {
                     NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                     return TRUE;
                     }
                     return FALSE;
             }
        else if (NC_GetHasClass(CLASS_TYPE_SORCERER, oPC))
                {
                NC_SendMessage(oPC, NC_RESPONSE_FOUND_DEFILER );
                NC_SendMessage(oPC, NC_RESPONSE_CHECK_DEFILER );

                if (NC_GetHasClass(CLASS_TYPE_BLACKGUARD, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_DRUID, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_WIZARD, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_DIVINE_CHAMPION, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_SHIFTER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_RANGER, oPC) ||
                    NC_RaceRestrictedClass(oPC,CLASS_TYPE_SORCERER))
                       {
                       NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                       return TRUE;
                       }
                else if(NC_GetHasClass(CLASS_TYPE_CLERIC,oPC))
                        {
                        if (GetHasFeat(FEAT_MAGMA_DOMAIN_POWER, oPC) ||
                            GetHasFeat(FEAT_SUN_DOMAIN_POWER, oPC)   ||
                            GetHasFeat(FEAT_SILT_DOMAIN_POWER, oPC))
                            {
                            return FALSE;
                            }
                        else
                            {
                            NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                            return TRUE;
                            }
                        }
return FALSE;
                 }

        else if (NC_GetHasClass(CLASS_TYPE_DRUID, oPC))
                {
                NC_SendMessage(oPC, NC_RESPONSE_FOUND_DRUID);
                NC_SendMessage(oPC, NC_RESPONSE_CHECK_DRUID);
                if (NC_GetHasClass(CLASS_TYPE_SORCERER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_HARPER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_PALEMASTER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_HARPER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_ASSASSIN, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_BLACKGUARD, oPC) ||
                    NC_RaceRestrictedClass(oPC,CLASS_TYPE_DRUID))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_HARPER, oPC))
                {
                NC_SendMessage(oPC, NC_RESPONSE_FOUND_DRUID);
                NC_SendMessage(oPC, NC_RESPONSE_CHECK_DRUID);
                if (NC_GetHasClass(CLASS_TYPE_DRUID, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_SHIFTER, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_PALADIN, oPC) ||
                    NC_GetHasClass(CLASS_TYPE_DIVINE_CHAMPION, oPC) ||
                    NC_RaceRestrictedClass(oPC,CLASS_TYPE_HARPER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_SHIFTER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_SHIFTER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_WIZARD, oPC))
                {
                if (NC_RaceRestrictedClass(oPC,CLASS_TYPE_WIZARD))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_BARD, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_BARD))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_FIGHTER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_FIGHTER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_MONK, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_MONK))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_BARBARIAN, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_BARBARIAN))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_ASSASSIN, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_ASSASSIN))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
       else if (NC_GetHasClass(CLASS_TYPE_ARCANE_ARCHER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_ARCANE_ARCHER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_BLACKGUARD, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_BLACKGUARD))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_DIVINE_CHAMPION, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_DIVINE_CHAMPION))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_DRAGONDISCIPLE, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_DRAGONDISCIPLE))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_DWARVEN_DEFENDER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_DWARVEN_DEFENDER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_PALEMASTER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_PALEMASTER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_ROGUE, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_ROGUE))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_SHADOWDANCER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_SHADOWDANCER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
        else if (NC_GetHasClass(CLASS_TYPE_WEAPON_MASTER, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_WEAPON_MASTER))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
/*        else if (NC_GetHasClass(CLASS_TYPE_PSION, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_PSION))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 } */  //No more 2e Psions - DMH
        else if (NC_GetHasClass(CLASS_TYPE_GLADIATOR, oPC))
                {
                if(NC_RaceRestrictedClass(oPC,CLASS_TYPE_GLADIATOR))
                       {
                        NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_CLASS,TRUE);
                        return TRUE;
                       }
                 return FALSE;
                 }
      return FALSE;
}

int NC_GetIsTemplar(object oPC)
{
    if(GetHasFeat(FEAT_TEMPLAR_DOMAIN_POWER, oPC) ||
       GetHasFeat(FEAT_DREGOTH_DOMAIN_POWER, oPC) ||
       GetHasFeat(FEAT_HAMANU_DOMAIN_POWER, oPC) ||
       GetHasFeat(FEAT_NIBENAY_DOMAIN_POWER, oPC) ||
       GetHasFeat(FEAT_ORONIS_DOMAIN_POWER, oPC) ||
       GetHasFeat(FEAT_THEOBA_DOMAIN_POWER, oPC))
                 {
                 NC_SendMessage(oPC,NC_RESPONSE_FOUND_TEMPLAR_DOMAIN);
                 return TRUE;
                 }
                 else
                 {
                 return FALSE;
                 }

}

void NC_SendMessage(object oPC,string NC_RESPONSE,int nRed=FALSE)
{
string sColor = "white";

    if(nRed=TRUE)
    {
    sColor = "lightred";
    }

    ColorToOne(oPC,NC_RESPONSE, sColor);
}

int NC_RaceRestrictedClass(object oPC,int nCLASS,)
{
    string sSubRace = GetSubRace(oPC);
    sSubRace = GetStringLowerCase(sSubRace);
    int nReturn=FALSE;

    if(sSubRace==SUBRACE_BELGOI)
            {
            if(nCLASS == CLASS_TYPE_PALADIN)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_SHIFTER)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_DRUID)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_BARD)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_WIZARD)nReturn=TRUE;
            }

    if(sSubRace==SUBRACE_THRAX)
            {
            if(nCLASS == CLASS_TYPE_PALADIN)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_BARD)nReturn=TRUE;
            }
    if(sSubRace==SUBRACE_YUANTI)
            {
            if(nCLASS == CLASS_TYPE_PALADIN)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_SHIFTER)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_DRUID)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_WIZARD)nReturn=TRUE;
            }

    if(sSubRace==SUBRACE_ILLITHID)
            {
            if(nCLASS == CLASS_TYPE_PALADIN)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_SHIFTER)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_DRUID)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_BARD)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_RANGER)nReturn=TRUE;
            }
    if(sSubRace==SUBRACE_REGGLID)
            {
            if(nCLASS == CLASS_TYPE_PALADIN)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_SHIFTER)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_DRUID)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_BARD)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_WIZARD)nReturn=TRUE;
            }
    if(sSubRace==SUBRACE_KIRRE)
        {
            if(nCLASS == CLASS_TYPE_SORCERER)nReturn=TRUE;
            if(nCLASS == CLASS_TYPE_BARD)nReturn=TRUE;
        }
        if(nReturn)NC_SendMessage(oPC,NC_RESPONSE_RELEVEL_SUBRACE);
        return nReturn;
}

//void main(){}
