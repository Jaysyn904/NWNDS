//------------------------------------------------------------------------------
/*
Use Magic Device Check.
Simple use magic device check to prevent abuse of
the engine level implementation of use magic device
This function is not supposed to mirror the 3E use
magic device mechanics.

Returns TRUE if the Spell is allowed to be
cast, either because the character is allowed
to cast it or he has won the required UMD check

returns TRUE if
   ... spell not cast by an item
   ... item is not a scroll (may be extended)
   ... caster has levels in wiz, bard, sorc
   ... caster is no rogue and has no UMD skill
   ... caster has memorized this spell
   ... the property corresponding to the spell does not exist (2da inconsistency)

   ... a UMD check against 25+InnateLevel of the spell is won

Note: I am not using the effective level of the spell for DC calculation but
      instead the lowest possible effective level. This is by design to allow
      rogues to use most low level scrolls in the game (i.e. light scrolls have
      an effective level 5 but a lowest effective level of 1 and we want low level
      rogues to cast these spells..)

      Setting a Local Interger called X2_SWITCH_CLASSIC_UMD (TRUE) on the Module
      will result in this function to return TRUE all the time

      User's can change this default implementation by modifing this file
*/
//------------------------------------------------------------------------------

#include "prc_inc_spells"

int DoCastingClassCheck(object oCaster, int nSpellID, int nClass)
{
    string sClass;
    switch(nClass)
    {
        case CLASS_TYPE_CLERIC:  sClass = "Cleric";   break;
        case CLASS_TYPE_DRUID:   sClass = "Druid";    break;
        case CLASS_TYPE_PALADIN: sClass = "Paladin";  break;
        case CLASS_TYPE_RANGER:  sClass = "Ranger";   break;
        case CLASS_TYPE_WIZARD:  sClass = "Wiz_Sorc"; break;
		case CLASS_TYPE_DEFILER: sClass = "Wiz_Sorc"; break;
    }
    if(sClass == "")
        return RealSpellToSpellbookID(nClass, nSpellID) != -1;
    else
        return Get2DACache("Spells", sClass, nSpellID) != "";
}

int UMD_CheckCastingClass(object oCaster, int nSpellID)
{
    int i;
    for(i = 1; i < 4; i++)
    {
        if(DoCastingClassCheck(oCaster, nSpellID, GetClassByPosition(i, oCaster)))
            return TRUE;
    }
    return FALSE;
}

int X2_UMD()
{
    if(!GetModuleSwitchValue(MODULE_SWITCH_ENABLE_UMD_SCROLLS))
        return TRUE;

    object oItem = PRCGetSpellCastItem();
    if(!GetIsObjectValid(oItem))
        return TRUE; // Spell not cast by item, UMD not required

    // -------------------------------------------------------------------------
    // Only Scrolls are subject to our default UMD Check
    // -------------------------------------------------------------------------
    if(GetBaseItemType(oItem) != BASE_ITEM_SPELLSCROLL)
        return TRUE; // spell not cast from a scroll

    // -------------------------------------------------------------------------
    // Ignore scrolls that have no use limitations (i.e. raise dead)
    // -------------------------------------------------------------------------
    if(!IPGetHasUseLimitation(oItem))
        return TRUE;

    object oCaster = OBJECT_SELF;
    int nSpellID = PRCGetSpellId();

    // -------------------------------------------------------------------------
    // Check if caster has levels in class that can cast given spell
    // -------------------------------------------------------------------------
    if(UMD_CheckCastingClass(oCaster, nSpellID))
        return TRUE;

    // -------------------------------------------------------------------------
    // If the caster used the item and has no UMD Skill and is not a rogue
    // thus we assume he must be allowed to use it because the engine
    // prevents people that are not capable of using an item from using it....
    // -------------------------------------------------------------------------
    if(!GetHasSkill(SKILL_USE_MAGIC_DEVICE, oCaster)
    && !GetLevelByClass(CLASS_TYPE_ROGUE, oCaster)
    && !GetLevelByClass(CLASS_TYPE_ASSASSIN, oCaster)
    && !GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oCaster))
    {
        // ---------------------------------------------------------------------
        //SpeakString("I have no UMD, thus I can cast the spell... ");
        // ---------------------------------------------------------------------
        return TRUE;
    }

    if(Get2DACache("des_crft_spells", "IPRP_SpellIndex", nSpellID) == "")
    {
        WriteTimestampedLogEntry("***X2UseMagicDevice (Warning): Found no property matching SpellID "+ IntToString(nSpellID));
        return TRUE;
    }

    // -------------------------------------------------------------------------
    //I am using des_crft_spells.2da Innate Level column here, not (as would be correct)
    //the IPPR_Spells.2da InnateLvl column, because some of the scrolls in
    //the game (i.e. light) would not be useable (DC 30+)
    // -------------------------------------------------------------------------
    int nInnateLevel = StringToInt(Get2DACache("des_crft_spells","Level",nSpellID));
    int nSkill = SKILL_USE_MAGIC_DEVICE;
    //int nSkillRanks = GetSkillRank(SKILL_USE_MAGIC_DEVICE, oCaster);
    if(GetLevelByClass(CLASS_TYPE_ARTIFICER, oCaster))
        nInnateLevel -= 2;  //only scrolls are being checked, and arti gets scribe scroll at level 1, this instead of +2 to skill

    // -------------------------------------------------------------------------
    // Base DC for casting a spell from a scroll is 25+SpellLevel
    // We do not have a way to check for misshaps here but GetIsSkillSuccessful
    // does not return the required information
    // -------------------------------------------------------------------------
    if(GetPRCIsSkillSuccessful(oCaster, nSkill, 25+ nInnateLevel, (GetHasFeat(FEAT_DECEIVE_ITEM, oCaster) || GetHasFeat(FEAT_SKILL_MASTERY_ARTIFICER, oCaster)) ? 10 : -1))
    {
        return TRUE;
    }
    else
    {
        effect ePuff =  EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,ePuff,oCaster);
        return FALSE;
    }
}

void main()
{
    //--------------------------------------------------------------------------
    // Reset
    //--------------------------------------------------------------------------
    if(GetLocalInt(GetModule(),"X2_L_STOP_EXPERTISE_ABUSE"))
    {
         SetActionMode(OBJECT_SELF, ACTION_MODE_EXPERTISE, FALSE);
         SetActionMode(OBJECT_SELF, ACTION_MODE_IMPROVED_EXPERTISE, FALSE);
    }

    //--------------------------------------------------------------------------
    // Do use magic device check
    //--------------------------------------------------------------------------
    int nRet = X2_UMD();
    SetExecutedScriptReturnValue(nRet);
}