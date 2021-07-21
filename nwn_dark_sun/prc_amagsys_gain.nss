//:://////////////////////////////////////////////
//:: Alternate magic system gain evaluation script
//:: prc_amagsys_gain
//:://////////////////////////////////////////////
/** @file
    This file determines if the given character
    has gained new spells / powers / utterances /
    whathaveyou since the last time it was run.
    If so, it starts the relevant selection
    conversations.

    Add new classes to their respective magic
    user type block, or if such doesn't exist
    yet for the system the class belongs to,
    make a new block for them at the end of main().


    @author Ornedan
    @date   Created - 2006.12.14
 */
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "inc_dynconv"
#include "psi_inc_psifunc"
#include "inc_newspellbook"
#include "true_inc_trufunc"
#include "tob_inc_tobfunc"
#include "shd_inc_shdfunc"
#include "inv_inc_invfunc"

//////////////////////////////////////////////////
/*             Function prototypes              */
//////////////////////////////////////////////////

void CheckSpellbooks(object oPC);
void CheckPsionics(object oPC);
void CheckInvocations(object oPC);
void CheckToB(object oPC);
void CheckShadow(object oPC);
void CheckTruenaming(object oPC);
int CheckMissingPowers(object oPC, int nClass);
int CheckMissingSpells(object oPC, int nClass, int nMinLevel, int nMaxLevel);
int CheckMissingUtterances(object oPC, int nClass, int nLexicon);
int CheckMissingManeuvers(object oPC, int nClass);
int CheckMissingMysteries(object oPC, int nClass);
int CheckMissingInvocations(object oPC, int nClass);
void AMSCompatibilityCheck(object oPC);

//////////////////////////////////////////////////
/*             Function definitions             */
//////////////////////////////////////////////////

void main()
{
    object oPC = OBJECT_SELF;

    // Sanity checks - Shifted or polymorphed characters may have their hide fucked up, and might be missing access to their hide-feats
    // @todo Shifting probably doesn't do this anymore, could be ditchable - Ornedan, 20061214
    if(GetLocalInt(oPC, "nPCShifted"))
        return;
    effect eTest = GetFirstEffect(oPC);
    while(GetIsEffectValid(eTest))
    {
        if(GetEffectType(eTest) == EFFECT_TYPE_POLYMORPH)
            return;
        eTest = GetNextEffect(oPC);
    }

    DelayCommand(0.0f, CheckSpellbooks(oPC));
}

// Handle new spellbooks
void CheckSpellbooks(object oPC)
{
    if(!GetPRCSwitch(PRC_BARD_DISALLOW_NEWSPELLBOOK) && CheckMissingSpells(oPC, CLASS_TYPE_BARD, 0, 6))
        return;
    if(!GetPRCSwitch(PRC_SORC_DISALLOW_NEWSPELLBOOK) && CheckMissingSpells(oPC, CLASS_TYPE_SORCERER, 0, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_SUEL_ARCHANAMACH, 1, 5))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_FAVOURED_SOUL, 0, 9))
        return;
//    if(CheckMissingSpells(oPC, CLASS_TYPE_MYSTIC, 0, 9))
//        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_WARMAGE, 0, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_DREAD_NECROMANCER, 1, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_HEXBLADE, 1, 4))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_DUSKBLADE, 0, 5))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_JUSTICEWW, 1, 4))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_KNIGHT_WEAVE, 1, 6))
        return;        
//    if(CheckMissingSpells(oPC, CLASS_TYPE_WITCH, 0, 9))
//        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_SUBLIME_CHORD, 4, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_ARCHIVIST, 0, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_BEGUILER, 0, 9))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_HARPER, 1, 3))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_TEMPLAR, 0, 9))
//        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_ASSASSIN, 1, 4))
        return;
    if(CheckMissingSpells(oPC, CLASS_TYPE_CELEBRANT_SHARESS, 1, 4))
        return;

    DelayCommand(0.0f, CheckPsionics(oPC));
}

// Handle psionics
void CheckPsionics(object oPC)
{
    if(CheckMissingPowers(oPC, CLASS_TYPE_PSION))
        return;
    if(CheckMissingPowers(oPC, CLASS_TYPE_WILDER))
        return;
    if(CheckMissingPowers(oPC, CLASS_TYPE_PSYWAR))
        return;
    if(CheckMissingPowers(oPC, CLASS_TYPE_PSYCHIC_ROGUE))
        return;        
    if(CheckMissingPowers(oPC, CLASS_TYPE_FIST_OF_ZUOKEN))
        return;
    if(CheckMissingPowers(oPC, CLASS_TYPE_WARMIND))
        return;
    //expanded knowledge
    if(CheckMissingPowers(oPC, -1))
        return;
    //epic expanded knowledge
    if(CheckMissingPowers(oPC, -2))
        return;

    DelayCommand(0.0f, CheckInvocations(oPC));
}

// Handle Invocations
void CheckInvocations(object oPC)
{
    if(CheckMissingInvocations(oPC, CLASS_TYPE_DRAGONFIRE_ADEPT))
        return;
    if(CheckMissingInvocations(oPC, CLASS_TYPE_WARLOCK))
        return;
    if(CheckMissingInvocations(oPC, CLASS_TYPE_DRAGON_SHAMAN))
        return;
    //extra invocations
    if(CheckMissingInvocations(oPC, CLASS_TYPE_INVALID))
        return;
    //epic extra invocations
    if(CheckMissingInvocations(oPC, -2))
        return;

    DelayCommand(0.0f, CheckToB(oPC));
}

// Handle Tome of Battle
void CheckToB(object oPC)
{
    if(CheckMissingManeuvers(oPC, CLASS_TYPE_CRUSADER))
        return;
    if(CheckMissingManeuvers(oPC, CLASS_TYPE_SWORDSAGE))
        return;
    if(CheckMissingManeuvers(oPC, CLASS_TYPE_WARBLADE))
        return;

    DelayCommand(0.0f, CheckShadow(oPC));
}

// Handle Shadowcasting
void CheckShadow(object oPC)
{
    if(CheckMissingMysteries(oPC, CLASS_TYPE_SHADOWCASTER))
        return;
    if(CheckMissingMysteries(oPC, CLASS_TYPE_SHADOWSMITH))
        return;

    DelayCommand(0.0f, CheckTruenaming(oPC));
}

// Handle Truenaming - Three different Lexicons to check
void CheckTruenaming(object oPC)
{
    if(CheckMissingUtterances(oPC, CLASS_TYPE_TRUENAMER, LEXICON_EVOLVING_MIND))
        return;
    if(CheckMissingUtterances(oPC, CLASS_TYPE_TRUENAMER, LEXICON_CRAFTED_TOOL))
        return;
    if(CheckMissingUtterances(oPC, CLASS_TYPE_TRUENAMER, LEXICON_PERFECTED_MAP))
        return;

    if(!GetIsDM(oPC))
        DelayCommand(0.0f, AMSCompatibilityCheck(oPC));
}

int CheckMissingPowers(object oPC, int nClass)
{
    int nLevel = GetLevelByClass(nClass, oPC);
    if(!nLevel && nClass != -1 && nClass != -2)
        return FALSE;
    else if(nClass == -1 && !GetHasFeat(FEAT_EXPANDED_KNOWLEDGE_1))
        return FALSE;
    else if(nClass == -2 && !GetHasFeat(FEAT_EPIC_EXPANDED_KNOWLEDGE_1))
        return FALSE;

    int nCurrentPowers = GetPowerCount(oPC, nClass);
    int nMaxPowers = GetMaxPowerCount(oPC, nClass);

    if(nCurrentPowers < nMaxPowers)
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "nClass", nClass);
        StartDynamicConversation("psi_powconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        return TRUE;
    }
    return FALSE;
}

int CheckMissingInvocations(object oPC, int nClass)
{
    int nLevel = GetLevelByClass(nClass, oPC);
    if(!nLevel && (nClass == CLASS_TYPE_DRAGONFIRE_ADEPT || nClass == CLASS_TYPE_WARLOCK || nClass == CLASS_TYPE_DRAGON_SHAMAN))
        return FALSE;
    else if(nClass == CLASS_TYPE_INVALID && !GetHasFeat(FEAT_EXTRA_INVOCATION_I))
               return FALSE;
    else if(nClass == -2 && !GetHasFeat(FEAT_EPIC_EXTRA_INVOCATION_I))
               return FALSE;

    int nCurrentInvocations = GetInvocationCount(oPC, nClass);
    if(DEBUG) DoDebug("Current Invocations: " + IntToString(nCurrentInvocations));
    int nMaxInvocations = GetMaxInvocationCount(oPC, nClass);
    if(DEBUG) DoDebug("Max Invocations: " + IntToString(nMaxInvocations));

    if(nCurrentInvocations < nMaxInvocations)
    {
        // Mark the class for which the PC is to gain invocations and start the conversation
        SetLocalInt(oPC, "nClass", nClass);
        StartDynamicConversation("inv_invokeconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        return TRUE;
    }
    return FALSE;
}

void AddSpellsForLevel(int nClass, int nLevel)
{
    object oPC = OBJECT_SELF;
    object oSkin = GetPCSkin(oPC);
    object oToken = GetHideToken(oPC);
    string sFile = GetFileForClass(nClass);
    string sSpellbook;
    int nSpellbookType = GetSpellbookTypeForClass(nClass);
    if(nSpellbookType == SPELLBOOK_TYPE_SPONTANEOUS)
        sSpellbook = "Spellbook"+IntToString(nClass);
    else
        sSpellbook = "Spellbook_Known_"+IntToString(nClass)+"_"+IntToString(nLevel);

    // Create spells known persistant array  if it is missing
    int nSize = array_get_size(oToken, sSpellbook);
    if (nSize < 0)
    {
        array_create(oToken, sSpellbook);
        nSize = 0;
    }

    //check for learnable spells
    object oToken_Class = GetObjectByTag("SpellLvl_" + IntToString(nClass) + "_Level_" + IntToString(nLevel));
    int nSpells_Total = array_get_size(oToken_Class, "Lkup");
    int i;
    for(i = 0; i < nSpells_Total; i++)
    {
        int nSpellbookID = array_get_int(oToken_Class, "Lkup", i);
        if(Get2DAString(sFile, "AL", nSpellbookID) != "1")
        {
            array_set_int(oToken, sSpellbook, nSize, nSpellbookID);
            nSize++;
            if(nSpellbookType == SPELLBOOK_TYPE_SPONTANEOUS)
            {
                int nIPFeatID = StringToInt(Get2DACache(sFile, "IPFeatID", nSpellbookID));
                int nFeatID = StringToInt(Get2DACache(sFile, "FeatID", nSpellbookID));
                AddSpellUse(oPC, nSpellbookID, nClass, sFile, "NewSpellbookMem_" + IntToString(nClass), nSpellbookType, oSkin, nFeatID, nIPFeatID);
            }
        }
    }
}

int CheckMissingSpells(object oPC, int nClass, int nMinLevel, int nMaxLevel)
{
    int nLevel;
    //Raks cast as sorcs
    if(nClass == CLASS_TYPE_SORCERER && GetRacialType(oPC) == RACIAL_TYPE_RAKSHASA)
        nLevel = GetLevelByClass(CLASS_TYPE_OUTSIDER, oPC);
//    else if(nClass == CLASS_TYPE_SORCERER && GetRacialType(oPC) == RACIAL_TYPE_BOZAK) //Bozaks cast as sorcs
//        nLevel = GetLevelByClass(CLASS_TYPE_DRAGON, oPC);
    else if(nClass == CLASS_TYPE_SORCERER && GetRacialType(oPC) == RACIAL_TYPE_DRIDER) //Driders cast as sorcs
        nLevel = GetLevelByClass(CLASS_TYPE_ABERRATION, oPC);
    else    
        nLevel = nClass == CLASS_TYPE_SUBLIME_CHORD ? GetLevelByClass(nClass, oPC) : GetSpellslotLevel(nClass, oPC);

    if (DEBUG) DoDebug("CheckMissingSpells 1 Class: " + IntToString(nClass));
    if (DEBUG) DoDebug("CheckMissingSpells 1 Level: " + IntToString(nLevel));

    if(!nLevel)
        return FALSE;
    if(nClass == CLASS_TYPE_BARD || nClass == CLASS_TYPE_SORCERER)
    {
        if((GetLevelByClass(nClass, oPC) == nLevel) //no PrC
            && !(GetHasFeat(FEAT_DRACONIC_GRACE, oPC) || GetHasFeat(FEAT_DRACONIC_BREATH, oPC))) //no Draconic feats that apply
            return FALSE;
    }
    else if(nClass == CLASS_TYPE_ARCHIVIST)
    {
        int nLastGainLevel = GetPersistantLocalInt(oPC, "LastSpellGainLevel");
        nLevel = GetLevelByClass(CLASS_TYPE_ARCHIVIST, oPC);

        if(nLastGainLevel < nLevel)
        {
            if(nLevel == 1)
            {
                //count the number of available at 1st level spells
                int nSpellsAvailable = 3 + GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
                SetLocalInt(oPC, "LrnLvlUp", nSpellsAvailable);
            }
            else if(nLevel > 1)
                //add additional 2 spells form cleric list
                SetLocalInt(oPC, "LrnLvlUp", 2);

            SetLocalInt(oPC, "SpellGainClass", CLASS_TYPE_ARCHIVIST);
            SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
            StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, TRUE, FALSE, oPC);

            return TRUE;
        }
        //add cleric spells known for level 0
        else if(persistant_array_get_size(oPC, "Spellbook_Known_"+IntToString(CLASS_TYPE_ARCHIVIST)+"_0") < 5)  // TODO: replace with GetSpellKnownCurrentCount
        {
            ActionDoCommand(AddSpellsForLevel(CLASS_TYPE_ARCHIVIST, 0));
        }
        else
            return FALSE;
    }
    
    if (DEBUG) DoDebug("CheckMissingSpells 2 Class: " + IntToString(nClass));
    if (DEBUG) DoDebug("CheckMissingSpells 2 Level: " + IntToString(nLevel));
     
    int i;
    for(i = nMinLevel; i <= nMaxLevel; i++)
    {
        int nMaxSpells = GetSpellKnownMaxCount(nLevel, i, nClass, oPC);
        if(nMaxSpells > 0)
        {
            int nCurrentSpells = GetSpellKnownCurrentCount(oPC, i, nClass);
            int nSpellsAvailable = GetSpellUnknownCurrentCount(oPC, i, nClass);

            if(nCurrentSpells < nMaxSpells && nSpellsAvailable > 0)
            {
                if(GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_SPONTANEOUS && bKnowsAllClassSpells(nClass))
                {
                    ActionDoCommand(AddSpellsForLevel(nClass, i));
                }
                else
                {
                    // Mark the class for which the PC is to gain powers and start the conversation
                    SetLocalInt(oPC, "SpellGainClass", nClass);
                    SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
                    SetLocalInt(oPC, "SpellbookMaxSpelllevel", nMaxLevel);
                    StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

                    return TRUE;
                }
            }
        }
    }
    //Advanced Learning check
    nLevel = GetLevelByClass(nClass, oPC);
    int nALSpells = GetPersistantLocalInt(oPC, "AdvancedLearning_"+IntToString(nClass));
    if(nClass == CLASS_TYPE_BEGUILER && nALSpells < (nLevel+1)/4)//one every 4 levels starting at 3.
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "SpellGainClass", CLASS_TYPE_BEGUILER);
        SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
        SetLocalInt(oPC, "AdvancedLearning", 1);
        StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
        return TRUE;
    }
    else if(nClass == CLASS_TYPE_DREAD_NECROMANCER && nALSpells < nLevel/4)//one every 4 levels
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "SpellGainClass", CLASS_TYPE_DREAD_NECROMANCER);
        SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
        SetLocalInt(oPC, "AdvancedLearning", 1);
        StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
        return TRUE;
    }
    else if(nClass == CLASS_TYPE_WARMAGE)
    {
        if((nLevel >= 40 && nALSpells < 9) ||// :/
           (nLevel >= 36 && nLevel < 40 && nALSpells < 8) ||
           (nLevel >= 32 && nLevel < 36 && nALSpells < 7) ||
           (nLevel >= 28 && nLevel < 32 && nALSpells < 6) ||
           (nLevel >= 24 && nLevel < 28 && nALSpells < 5) ||
           (nLevel >= 16 && nLevel < 24 && nALSpells < 4) ||
           (nLevel >= 11 && nLevel < 16 && nALSpells < 3) ||
           (nLevel >= 6  && nLevel < 11 && nALSpells < 2) ||
           (nLevel >= 3  && nLevel < 6  && nALSpells < 1))
        {
            // Mark the class for which the PC is to gain powers and start the conversation
            SetLocalInt(oPC, "SpellGainClass", CLASS_TYPE_WARMAGE);
            SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
            SetLocalInt(oPC, "AdvancedLearning", 1);
            StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
            return TRUE;
        }
    }
    else if(nClass == CLASS_TYPE_NIGHTSTALKER && nALSpells < (nLevel+1)/6)//one every 6 levels starting at 5th
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "SpellGainClass", CLASS_TYPE_NIGHTSTALKER);
        SetLocalInt(oPC, "SpellbookMinSpelllevel", nMinLevel);
        SetLocalInt(oPC, "AdvancedLearning", 1);
        StartDynamicConversation("prc_s_spellgain", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);
        return TRUE;
    }

    return FALSE;
}

int CheckMissingUtterances(object oPC, int nClass, int nLexicon)
{
    int nLevel = GetLevelByClass(nClass, oPC);
    if(!nLevel)
        return FALSE;

    int nCurrentUtterances = GetUtteranceCount(oPC, nClass, nLexicon);
    int nMaxUtterances = GetMaxUtteranceCount(oPC, nClass, nLexicon);
    if(DEBUG) DoDebug("CheckMissingUtterances(" + IntToString(nClass) + ", " + IntToString(nLexicon) + ", " + GetName(oPC) + ") = " + IntToString(nCurrentUtterances) + ", " + IntToString(nMaxUtterances));

    if(nCurrentUtterances < nMaxUtterances)
    {
        // Mark the class for which the PC is to gain Utterances and start the conversation
        SetLocalInt(oPC, "nClass", nClass);
        StartDynamicConversation("true_utterconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        return TRUE;
    }
    return FALSE;
}

int CheckMissingManeuvers(object oPC, int nClass)
{
    int nLevel = GetLevelByClass(nClass, oPC);
    if(!nLevel)
        return FALSE;

    int nCurrentManeuvers = GetManeuverCount(oPC, nClass, MANEUVER_TYPE_MANEUVER);
    int nMaxManeuvers = GetMaxManeuverCount(oPC, nClass, MANEUVER_TYPE_MANEUVER);
    int nCurrentStances = GetManeuverCount(oPC, nClass, MANEUVER_TYPE_STANCE);
    int nMaxStances = GetMaxManeuverCount(oPC, nClass, MANEUVER_TYPE_STANCE);

    if(nCurrentManeuvers < nMaxManeuvers || nCurrentStances < nMaxStances)
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "nClass", nClass);
        StartDynamicConversation("tob_moveconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        return TRUE;
    }
    return FALSE;
}

int CheckMissingMysteries(object oPC, int nClass)
{
    int nLevel = GetLevelByClass(nClass, oPC);
    if(!nLevel)
        return FALSE;

    int nCurrentMysteries = GetMysteryCount(oPC, nClass);
    int nMaxMysteries = GetMaxMysteryCount(oPC, nClass);

    if(nCurrentMysteries < nMaxMysteries)
    {
        // Mark the class for which the PC is to gain powers and start the conversation
        SetLocalInt(oPC, "nClass", nClass);
        StartDynamicConversation("shd_mystconv", oPC, DYNCONV_EXIT_NOT_ALLOWED, FALSE, TRUE, oPC);

        return TRUE;
    }
    return FALSE;
}

//AMS Compatibility functions - xwarren:
void CopyAMSArray(object oHideToken, object oAMSToken, int nClass, string sArray, int nMin, int nMax, int nLoopSize = 100)
{
    string sFile = GetFileForClass(nClass);
    int i = nMin;
    while(i < nMin + nLoopSize && i < nMax)
    {
        int nSpellbookID = array_get_int(oHideToken, sArray, i);
        int nSpell = StringToInt(Get2DACache(sFile, "RealSpellID", nSpellbookID));
        if(DEBUG) DoDebug("Copying spell "+IntToString(nSpell));
        array_set_int(oAMSToken, sArray, i, nSpell);
        i++;
    }
    if(i < nMax)
        DelayCommand(0.0, CopyAMSArray(oHideToken, oAMSToken, nClass, sArray, i, nMax));
}

void DoBuckUpAMS(object oPC, int nClass, string sSpellbook, object oHideToken, object oAMSToken)
{
    if(DEBUG) DoDebug("Creating buck-up copy of "+sSpellbook);
    if(array_exists(oAMSToken, sSpellbook))
        array_delete(oAMSToken, sSpellbook);
    array_create(oAMSToken, sSpellbook);
    int nSize = array_get_size(oHideToken, sSpellbook);
    DelayCommand(0.0, CopyAMSArray(oHideToken, oAMSToken, nClass, sSpellbook, 0, nSize));
}

void AMSCompatibilityCheck(object oPC)
{
    //Get an extra hide token with amagsys info
    object oAMSToken = GetHideToken(oPC, TRUE);
    object oHideToken = GetHideToken(oPC);

    int i;
    for(i = 1; i <= 3; i++)
    {
        int nClass = GetClassByPosition(i, oPC);
        string sSpellbook;
        int nSpellbookType = GetSpellbookTypeForClass(nClass);
        if(nSpellbookType == SPELLBOOK_TYPE_SPONTANEOUS)
        {
            sSpellbook = "Spellbook"+IntToString(nClass);
            int nSize1 = array_get_size(oHideToken, sSpellbook);
            int nSize2 = array_get_size(oAMSToken, sSpellbook);
            if(nSize1 > nSize2)
                DelayCommand(0.1f, DoBuckUpAMS(oPC, nClass, sSpellbook, oHideToken, oAMSToken));
        }
        else if(nSpellbookType == SPELLBOOK_TYPE_PREPARED)
        {
            int j;
            for(j = 0; j <= 9; j++)
            {
                sSpellbook = "Spellbook_Known_"+IntToString(nClass)+"_"+IntToString(j);
                int nSize1 = array_get_size(oHideToken, sSpellbook);
                int nSize2 = array_get_size(oAMSToken, sSpellbook);
                if(nSize1 > nSize2)
                    DelayCommand(0.1f, DoBuckUpAMS(oPC, nClass, sSpellbook, oHideToken, oAMSToken));
            }
        }
    }
}