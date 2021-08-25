//::///////////////////////////////////////////////
//:: PRC Prerequisites
//:: prc_prereq.nss
//:://////////////////////////////////////////////
//:: Check to see what classes a PC is capable of taking.
//:://////////////////////////////////////////////
//:: Created By: Stratovarius.
//:: Created On: July 3rd, 2004
//:://////////////////////////////////////////////

#include "inc_epicspells"
#include "prc_inc_sneak"
#include "psi_inc_psifunc"
#include "tob_inc_tobfunc"
#include "shd_inc_shdfunc"
#include "inc_newspellbook"
#include "prc_allow_const"
#include "inv_inc_invfunc"
#include "prc_inc_template"
#include "moi_inc_moifunc"
#include "bnd_inc_bndfunc"

/*
AlignRestrict flags in classes.2da:
0x01 - no neutral
0x02 - no lawful
0x04 - no chaotic
0x08 - no good
0x10 - no evil

AlignRstrctType:
0x01 - law/chaos
0x02 - good/evil
*/
// Some alignment restrictions can't be setup properly in classes.2da
// ie. for Soldier of Light the closest thing to NG requirement is 0x16 0x3
// which will allow only NG and TN alignments.
// To disable True Neutral Soldiers of Light a Script Var 'PRC_ExAlignTN'
// was added to cls_pres_sol.2da.
void reqAlignment(object oPC)
{
    string sAling = "PRC_ExAlign";
    DeleteLocalInt(oPC, sAling+"LG");
    DeleteLocalInt(oPC, sAling+"LN");
    DeleteLocalInt(oPC, sAling+"LE");
    DeleteLocalInt(oPC, sAling+"NG");
    DeleteLocalInt(oPC, sAling+"TN");
    DeleteLocalInt(oPC, sAling+"NE");
    DeleteLocalInt(oPC, sAling+"CG");
    DeleteLocalInt(oPC, sAling+"CN");
    DeleteLocalInt(oPC, sAling+"CE");

    int nGoodEvil = GetAlignmentGoodEvil(oPC);
    int nLawChaos = GetAlignmentLawChaos(oPC);

    if(nGoodEvil == ALIGNMENT_GOOD)
    {
        if(nLawChaos == ALIGNMENT_LAWFUL)
            SetLocalInt(oPC, sAling+"LG", 1);
        else if(nLawChaos == ALIGNMENT_NEUTRAL)
            SetLocalInt(oPC, sAling+"NG", 1);
        else// if(nLawChaos == ALIGNMENT_CHAOTIC)
            SetLocalInt(oPC, sAling+"CG", 1);
    }
    else if(nGoodEvil == ALIGNMENT_NEUTRAL)
    {
        if(nLawChaos == ALIGNMENT_LAWFUL)
            SetLocalInt(oPC, sAling+"LN", 1);
        else if(nLawChaos == ALIGNMENT_NEUTRAL)
            SetLocalInt(oPC, sAling+"TN", 1);
        else// if(nLawChaos == ALIGNMENT_CHAOTIC)
            SetLocalInt(oPC, sAling+"CN", 1);
    }
    else// if(nGoodEvil == ALIGNMENT_EVIL)
    {
        if(nLawChaos == ALIGNMENT_LAWFUL)
            SetLocalInt(oPC, sAling+"LE", 1);
        else if(nLawChaos == ALIGNMENT_NEUTRAL)
            SetLocalInt(oPC, sAling+"NE", 1);
        else// if(nLawChaos == ALIGNMENT_CHAOTIC)
            SetLocalInt(oPC, sAling+"CE", 1);
    }
}

//for requirements that Skirmish or Sneak Attack apply to
void reqSpecialAttack(object oPC)
{
    int iSneak = GetTotalSneakAttackDice(oPC);
    int nLevel = GetLevelByClass(CLASS_TYPE_SCOUT, oPC);
    int iCount;
    string sVariable1, sVariable2;

    //Skirmish
    int nDice = (nLevel + 3) / 4;
    for (iCount = 1; iCount <= 30; iCount++)
    {
        sVariable1 = "PRC_SkirmishLevel" + IntToString(iCount);
        sVariable2 = "PRC_SplAtkLevel" + IntToString(iCount);
        if (nDice >= iCount)
        {
            SetLocalInt(oPC, sVariable1, 0);
            SetLocalInt(oPC, sVariable2, 0);
        }
    }
    //Sneak Attack
    for (iCount = 1; iCount <= 30; iCount++)
    {
        sVariable1 = "PRC_SneakLevel" + IntToString(iCount);
        sVariable2 = "PRC_SplAtkLevel" + IntToString(iCount);
        if (iSneak >= iCount)
        {
            SetLocalInt(oPC, sVariable1, 0);
            SetLocalInt(oPC, sVariable2, 0);
        }
    }
}

void reqGender()
{
    int nGender = GetGender(OBJECT_SELF);

    SetLocalInt(OBJECT_SELF, "PRC_Female", 1);
    SetLocalInt(OBJECT_SELF, "PRC_Male", 1);

    if (nGender == GENDER_FEMALE)
        DeleteLocalInt(OBJECT_SELF, "PRC_Female");
    else if (nGender == GENDER_MALE)
        DeleteLocalInt(OBJECT_SELF, "PRC_Male");
}

void Kord(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqKord", 1);

    if (GetFortitudeSavingThrow(oPC) >= 6)
    {
        SetLocalInt(oPC, "PRC_PrereqKord", 0);
    }
}

void Purifier(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqPurifier", 1);

    if (GetWillSavingThrow(oPC) >= 5)
    {
        SetLocalInt(oPC, "PRC_PrereqPurifier", 0);
    }
}

void Dragonheart(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqDragonheart", 1);
    
    int nClassSlot = 1;
    while(nClassSlot <= 3)
    {
        int nClass = GetClassByPosition(nClassSlot, oPC);
        nClassSlot += 1;
        if(GetIsArcaneClass(nClass) && GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_SPONTANEOUS)
            SetLocalInt(oPC, "PRC_PrereqDragonheart", 0); 
    }        
}

void Cultist(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqCultist", 1);

	// Can't be arcane
	if(!GetIsArcaneClass(GetClassByPosition(1, oPC)) && (!GetIsArcaneClass(GetClassByPosition(2, oPC)) || GetClassByPosition(2, oPC) == CLASS_TYPE_CULTIST_SHATTERED_PEAK))
		SetLocalInt(oPC, "PRC_PrereqCultist", 0);       
}

void Shifter(object oPC, int iArcSpell, int iDivSpell)
{
     //This function checks if the Pnp Shifter requirement "You must be able to assume an alternate form" is met.

     SetLocalInt(oPC, "PRC_PrereqShift", 1);

     //This used to check for Cleric class, animal domain, and divine spell level 5.
     //I've eliminated the Cleric class check--any class with the animal domain should qualify--
     //and changed it to check for divine spell level 9 instead of 5, since it isn't until level 9
     //that the PRC Animal domain gains the Shapechange spell, which is what qualifies it for PnP Shifter.
     //(The Bioware implementation of the Animal domain gives Polymorph Self at spell level 5).
     if (GetHasFeat(FEAT_ANIMAL_DOMAIN_POWER) && iDivSpell >= 9)
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     //Sorcerer (if it uses the old spellbook) and Wizard (which always does) need special checks
     if ((GetLevelByClass(CLASS_TYPE_SORCERER) && !UseNewSpellBook(oPC)) || GetLevelByClass(CLASS_TYPE_WIZARD) || GetLevelByClass(CLASS_TYPE_DEFILER))
     {
        if(GetHasSpell(SPELL_POLYMORPH_SELF, oPC))
        {
            // done this way as it's the only way to see if a bioware spellcaster knows the spell
            // actually checks if they have at least one use left
            SetLocalInt(oPC, "PRC_PrereqShift", 0);
            return;
        }
     }

     //Ranger also needs special check since it also uses the old spellbook. It gains Polymorph Self at spell level 4.
     if (GetLevelByClass(CLASS_TYPE_RANGER) && iDivSpell >= 4)
     {
          SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     //Any class that has Polymorph Self spell qualifies
     if (PRCGetIsRealSpellKnown(SPELL_POLYMORPH_SELF, oPC))
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     //Warlock doesn't normally qualify for PnP Shifter since it doesn't cast spells, 
     //but these invocations from Warlock meets the alternate form qualification
     //if another class provides the level 3 spells
     if(GetHasInvocation(INVOKE_MASK_OF_FLESH, oPC)
     || GetHasInvocation(INVOKE_HUMANOID_SHAPE, oPC)
     || GetHasInvocation(INVOKE_SPIDER_SHAPE, oPC)
     || GetHasInvocation(INVOKE_HELLSPAWNED_GRACE, oPC))
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     //These classes have appropriate alternate forms
     if (GetLevelByClass(CLASS_TYPE_DRUID) >= 5)
     {
         //Wild Shape qualifies
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_INITIATE_DRACONIC) >= 10)
     {
         //Dragon Shape qualifies
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_NINJA_SPY) >= 7)
     {
         //Thousand Faces qualifies
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_WEREWOLF) >= 1)
     {
         //Alternate Form, Wolf qualifies
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     if (GetLevelByClass(CLASS_TYPE_BONDED_SUMMONNER) >= 10)
     {
         //Elemental Form qualifies
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
     //This is not strictly necessary because Witch gains Polymorph Self
     //at an earlier level, but add it here anyway for completeness:
     if (GetLevelByClass(CLASS_TYPE_WITCH) >= 13)
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }

     int nRace = GetRacialType(oPC);
     //These races have appropriate alternate forms
     if(nRace == RACIAL_TYPE_PURE_YUAN
     || nRace == RACIAL_TYPE_ABOM_YUAN
     || nRace == RACIAL_TYPE_PIXIE
     || nRace == RACIAL_TYPE_RAKSHASA
     || nRace == RACIAL_TYPE_FEYRI
     || nRace == RACIAL_TYPE_HOUND_ARCHON
     || nRace == RACIAL_TYPE_IRDA
     || nRace == RACIAL_TYPE_ZAKYA_RAKSHASA
     || nRace == RACIAL_TYPE_CHANGELING
     || nRace == RACIAL_TYPE_SHIFTER
     // not counted since it is just "disguise self" and not alter self or shape change
     //||nRace == RACIAL_TYPE_DEEP_GNOME
     || nRace == RACIAL_TYPE_NAZTHARUNE_RAKSHASA)
     {
         SetLocalInt(oPC, "PRC_PrereqShift", 0);
     }
}

void Tempest()
{
     SetLocalInt(OBJECT_SELF, "PRC_PrereqTemp", 1);

     if(((GetHasFeat(FEAT_AMBIDEXTERITY) || GetPRCSwitch(PRC_35_TWO_WEAPON_FIGHTING)) && GetHasFeat(FEAT_TWO_WEAPON_FIGHTING))
     ||  GetHasFeat(FEAT_RANGER_DUAL))
         DeleteLocalInt(OBJECT_SELF, "PRC_PrereqTemp");
}

void KOTC(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqKOTC", 1);

     // to check if PC can cast protection from evil
     if(GetLevelByClass(CLASS_TYPE_CLERIC))
         DeleteLocalInt(oPC, "PRC_PrereqKOTC");

     if(GetLevelByClass(CLASS_TYPE_PALADIN) > 3)
     {
        if(GetAbilityScore(oPC, ABILITY_WISDOM) > 11
        || GetLevelByClass(CLASS_TYPE_PALADIN) > 5)
        {
            DeleteLocalInt(oPC, "PRC_PrereqKOTC");
            return;
        }
     }
     if(PRCGetIsRealSpellKnown(SPELL_PROTECTION_FROM_EVIL, oPC))
     {
         DeleteLocalInt(oPC, "PRC_PrereqKOTC");
     }
}

void Shadowlord(object oPC, int iArcSpell)
{
    SetLocalInt(oPC, "PRC_PrereqTelflam", 1);

    if(iArcSpell > 3                                   //ability to cast Level 4 Arcane Spells
    || GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oPC)   //at least 1 lvl of shadowdancer
    || GetPersistantLocalInt(oPC, "shadowwalkerstok")) //a token proving a donation of 10,000 gold to the Telflamm Guild
  //|| GetHasItem(oPC, "shadowwalkerstok"))
    {
        SetLocalInt(oPC, "PRC_PrereqTelflam", 0);
    }
}

//taken out of master at arms because i wanted to use the code in Eternal Blade prereq too
int WeaponFocusCount(object oPC)
{
    int iWF;

    // Calculate the total number of Weapon Focus feats the character has
    iWF = GetHasFeat(FEAT_WEAPON_FOCUS_BASTARD_SWORD,oPC)   +GetHasFeat(FEAT_WEAPON_FOCUS_BATTLE_AXE,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_CLUB,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_DAGGER,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_DART,oPC)        +GetHasFeat(FEAT_WEAPON_FOCUS_DIRE_MACE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_DOUBLE_AXE,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_DWAXE,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_GREAT_SWORD,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_HALBERD,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_HAND_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_HEAVY_FLAIL,oPC) +GetHasFeat(FEAT_WEAPON_FOCUS_KAMA,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_TWO_BLADED_SWORD,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_LONG_SWORD,oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_RAPIER,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_KATANA,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_KUKRI,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_FLAIL,oPC)     +GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_HAMMER,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_LIGHT_MACE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_LONGBOW,oPC)         +GetHasFeat(FEAT_WEAPON_FOCUS_MORNING_STAR,oPC)+GetHasFeat(FEAT_WEAPON_FOCUS_SCIMITAR,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SCYTHE,oPC)          +GetHasFeat(FEAT_WEAPON_FOCUS_SHORT_SWORD,oPC) +GetHasFeat(FEAT_WEAPON_FOCUS_SHORTBOW,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SHURIKEN,oPC)        +GetHasFeat(FEAT_WEAPON_FOCUS_SICKLE,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_SLING,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_SPEAR,oPC)           +GetHasFeat(FEAT_WEAPON_FOCUS_STAFF,oPC)       +GetHasFeat(FEAT_WEAPON_FOCUS_THROWING_AXE,oPC)+
          GetHasFeat(FEAT_WEAPON_FOCUS_WAR_HAMMER,oPC)      +GetHasFeat(FEAT_WEAPON_FOCUS_MINDBLADE, oPC)  +GetHasFeat(FEAT_WEAPON_FOCUS_WHIP,oPC); //why was whip commented out?

    // If they are a soulknife, their WF Mindblade might be counting twice due to how it is implemented, so account for it if necessary
    if(GetStringLeft(GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)), 14) == "prc_sk_mblade_" ||
       GetStringLeft(GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC)), 14) == "prc_sk_mblade_")
        iWF--;

    return iWF;
}

void DemiLich(object oPC)
{
    DeleteLocalInt(oPC, "PRC_DemiLich");
    
    if (!GetIsEpicSpellcaster(oPC) && GetLevelByClass(CLASS_TYPE_LICH) > 3)
         SetLocalInt(oPC, "PRC_DemiLich", 1); // Need to be an epic caster to take demilich

    if(GetPRCSwitch(PRC_DISABLE_DEMILICH) && GetLevelByClass(CLASS_TYPE_LICH) > 3)
    {
        SetLocalInt(oPC, "PRC_DemiLich", 1); // This is here because it'll always turn things off
    }
}

void reqDomains()
{
    //Black Flame Zealot
    SetLocalInt(OBJECT_SELF, "PRC_PrereqBFZ", 1);
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER)
     + GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_DOMAIN_POWER_RENEWAL) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqBFZ");

    //Brimstone Speaker
    SetLocalInt(OBJECT_SELF, "PRC_PrereqBrimstone", 1);
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER)
    || GetHasFeat(FEAT_GOOD_DOMAIN_POWER))
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqBrimstone");

    //Shining Blade of Heironeous
    SetLocalInt(OBJECT_SELF, "PRC_PrereqSBHeir", 1);
    if (GetHasFeat(FEAT_WAR_DOMAIN_POWER)
    && GetHasFeat(FEAT_GOOD_DOMAIN_POWER))
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqSBHeir");

    //Eye of Gruumsh
    SetLocalInt(OBJECT_SELF, "PRC_PrereqEOG", 1);
    if(GetHasFeat(FEAT_WAR_DOMAIN_POWER)
     + GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER)
     + GetHasFeat(FEAT_EVIL_DOMAIN_POWER) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqEOG");

    //Stormlord
    SetLocalInt(OBJECT_SELF, "PRC_PrereqStormL", 1);
    if(GetHasFeat(FEAT_FIRE_DOMAIN_POWER)
     + GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_EVIL_DOMAIN_POWER)
     + GetHasFeat(FEAT_DOMAIN_POWER_STORM) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqStormL");

    //Battleguard of Tempus
    SetLocalInt(OBJECT_SELF, "PRC_PrereqTempus", 1);
    if(GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER) >= 1
    && GetHasFeat(FEAT_WAR_DOMAIN_POWER))
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqTempus");

    //Heartwarder
    SetLocalInt(OBJECT_SELF, "PRC_PrereqHeartW", 1);
    if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER)
     + GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_DOMAIN_POWER_CHARM) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqHeartW");

    //Talontar Blightlord
    SetLocalInt(OBJECT_SELF, "PRC_PrereqBlightL", 1);
    if(GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER)
    && GetHasFeat(FEAT_EVIL_DOMAIN_POWER))
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqBlightL");

    //Shadow Adept
    SetLocalInt(OBJECT_SELF, "PRC_PrereqShadAd", 1);
    if(GetHasFeat(FEAT_EVIL_DOMAIN_POWER)
     + GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER)
     + GetHasFeat(FEAT_DARKNESS_DOMAIN) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqShadAd");

    //Thrall of Graz'zt
    SetLocalInt(OBJECT_SELF, "PRC_PrereqTOG", 1);
    if(GetHasFeat(FEAT_EVIL_DOMAIN_POWER)
    && GetHasFeat(FEAT_DARKNESS_DOMAIN))
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqTOG");

    //Champion of Corellon
    SetLocalInt(OBJECT_SELF, "PRC_PrereqCoC", 1);
    if(GetHasFeat(FEAT_DOMAIN_POWER_ELF)
    //+ GetHasFeat(FEAT_DOMAIN_POWER_CHAOS)    //chaos domain not yet implemented
     + GetHasFeat(FEAT_GOOD_DOMAIN_POWER)
     + GetHasFeat(FEAT_MAGIC_DOMAIN_POWER)
     + GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_WAR_DOMAIN_POWER) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqCoC");

    //Morninglord of Lathander
    SetLocalInt(OBJECT_SELF, "PRC_PrereqMornLord", 1);
    if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER)
     + GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_STRENGTH_DOMAIN_POWER)
     + GetHasFeat(FEAT_SUN_DOMAIN_POWER)
     + GetHasFeat(FEAT_DOMAIN_POWER_NOBILITY)
     + GetHasFeat(FEAT_DOMAIN_POWER_RENEWAL) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqMornLord");

    //Favored of Milil
    SetLocalInt(OBJECT_SELF, "PRC_PrereqFoM", 1);
    if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER)
     + GetHasFeat(FEAT_DOMAIN_POWER_NOBILITY)
     + GetHasFeat(FEAT_DOMAIN_POWER_CHARM)
     + GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqFoM");

    //Soldier of Light
    SetLocalInt(OBJECT_SELF, "PRC_PrereqSOL", 1);
    if(GetHasFeat(FEAT_GOOD_DOMAIN_POWER)
     + GetHasFeat(FEAT_HEALING_DOMAIN_POWER)
     + GetHasFeat(FEAT_LUCK_DOMAIN_POWER)
     + GetHasFeat(FEAT_PROTECTION_DOMAIN_POWER)
     + GetHasFeat(FEAT_SUN_DOMAIN_POWER)
     + GetHasFeat(FEAT_KNOWLEDGE_DOMAIN_POWER) >= 2)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqSOL");
}


void WWolf(object oPC)
{
    //If not a natural lycanthrope or not already leveled in werewolf, prevent the player from taking the werewolf class
    if (!GetHasFeat(FEAT_TRUE_LYCANTHROPE, oPC) || GetLevelByClass(CLASS_TYPE_WEREWOLF, oPC) < 1)
    {
        SetLocalInt(oPC, "PRC_PrereqWWolf", 1);
    }

    if (GetHasFeat(FEAT_TRUE_LYCANTHROPE, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqWWolf", 0);
    }
}

void Maester(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqMaester", 1);

    // Base Ranks Only
    if(GetSkillRank(SKILL_CRAFT_ARMOR,  oPC, TRUE) > 7
    || GetSkillRank(SKILL_CRAFT_TRAP,   oPC, TRUE) > 7
    || GetSkillRank(SKILL_CRAFT_WEAPON, oPC, TRUE) > 7)
    {
        // At least two crafting feats
        if(GetItemCreationFeatCount() > 1)
        {
            //check for arcane caster levels
            if(!GetLocalInt(oPC, "PRC_ArcSpell3") || GetInvokerLevel(oPC) > 4)
                SetLocalInt(oPC, "PRC_PrereqMaester", 0);
        }
    }
}

void reqCombatMedic(object oPC)
{
    /* The combat medic can only be taken if the player is able to cast Cure Light Wounds.
     * Base classes:
     * With druids and clerics, that's no problem - they get it at first level. Paladins and
     * rangers are a bit more complicated, due to their bonus spells and later spell gains.
     */

    SetLocalInt(oPC, "PRC_PrereqCbtMed", 1);

    //check PRC classes
    if(PRCGetIsRealSpellKnown(SPELL_CURE_LIGHT_WOUNDS, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
        return;
    }

    //check bioware classes
    int iWis = GetLocalInt(GetPCSkin(oPC), "PRC_trueWIS");
    if(iWis > 10)
    {
        if(GetLevelByClass(CLASS_TYPE_CLERIC)
        || GetLevelByClass(CLASS_TYPE_DRUID)
        || GetLevelByClass(CLASS_TYPE_PALADIN) >= 6
        || GetLevelByClass(CLASS_TYPE_RANGER) >= 6
        || (iWis > 11 && GetLevelByClass(CLASS_TYPE_PALADIN) >= 4)
        || (iWis > 11 && GetLevelByClass(CLASS_TYPE_RANGER) >= 4))
            SetLocalInt(oPC, "PRC_PrereqCbtMed", 0);
    }
}

void RedWizard(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqRedWiz", 1);

    int iFeat;
    int iFocus;

    iFocus = GetHasFeat(FEAT_RW_TF_ABJ, oPC)
           + GetHasFeat(FEAT_RW_TF_CON, oPC)
           + GetHasFeat(FEAT_RW_TF_DIV, oPC)
           + GetHasFeat(FEAT_RW_TF_ENC, oPC)
           + GetHasFeat(FEAT_RW_TF_EVO, oPC)
           + GetHasFeat(FEAT_RW_TF_ILL, oPC)
           + GetHasFeat(FEAT_RW_TF_NEC, oPC)
           + GetHasFeat(FEAT_RW_TF_TRS, oPC);
    // Metamagic or Item Creation feats
    iFeat = GetItemCreationFeatCount()
          + GetHasFeat(FEAT_EMPOWER_SPELL, oPC)
          + GetHasFeat(FEAT_EXTEND_SPELL, oPC)
          + GetHasFeat(FEAT_MAXIMIZE_SPELL, oPC)
          + GetHasFeat(FEAT_QUICKEN_SPELL, oPC)
          + GetHasFeat(FEAT_SILENCE_SPELL, oPC)
          + GetHasFeat(FEAT_STILL_SPELL, oPC)
          + GetHasFeat(FEAT_SUDDEN_EMPOWER, oPC)
          + GetHasFeat(FEAT_SUDDEN_MAXIMIZE, oPC)
          + GetHasFeat(FEAT_SUDDEN_EXTEND, oPC)
          + GetHasFeat(FEAT_SUDDEN_WIDEN, oPC);


    // At least two arcane feats, one tattoo focus
    if (iFeat > 2 && iFocus == 1)
    {
        SetLocalInt(oPC, "PRC_PrereqRedWiz", 0);
    }
}

void WildMageReq(object oPC)
{
    SetLocalInt(oPC, "PRC_PresWildMageReq", 1);

    int iFeat =  GetHasFeat(FEAT_EMPOWER_SPELL, oPC)
          + GetHasFeat(FEAT_EXTEND_SPELL, oPC)
          + GetHasFeat(FEAT_MAXIMIZE_SPELL, oPC)
          + GetHasFeat(FEAT_QUICKEN_SPELL, oPC)
          + GetHasFeat(FEAT_SILENCE_SPELL, oPC)
          + GetHasFeat(FEAT_STILL_SPELL, oPC)
          + GetHasFeat(FEAT_SUDDEN_EMPOWER, oPC)
          + GetHasFeat(FEAT_SUDDEN_MAXIMIZE, oPC)
          + GetHasFeat(FEAT_SUDDEN_EXTEND, oPC)
          + GetHasFeat(FEAT_SUDDEN_WIDEN, oPC);

    // At least one metamagic feat
    if (iFeat)
        SetLocalInt(oPC, "PRC_PresWildMageReq", 0);
}

void DalQuor(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqDalQuor", 1);

    // Psionic feats
    if(GetHasFeat(FEAT_COMBAT_MANIFESTATION        , oPC)
    || GetHasFeat(FEAT_MENTAL_LEAP                 , oPC)
    || GetHasFeat(FEAT_NARROW_MIND                 , oPC)
    || GetHasFeat(FEAT_POWER_PENETRATION           , oPC)
    || GetHasFeat(FEAT_GREATER_POWER_PENETRATION   , oPC)
    || GetHasFeat(FEAT_POWER_SPECIALIZATION        , oPC)
    || GetHasFeat(FEAT_GREATER_POWER_SPECIALIZATION, oPC)
    || GetHasFeat(FEAT_PSIONIC_DODGE               , oPC)
    || GetHasFeat(FEAT_PSIONIC_ENDOWMENT           , oPC)
    || GetHasFeat(FEAT_GREATER_PSIONIC_ENDOWMENT   , oPC)
    || GetHasFeat(FEAT_PSIONIC_FIST                , oPC)
    || GetHasFeat(FEAT_GREATER_PSIONIC_FIST        , oPC)
    || GetHasFeat(FEAT_PSIONIC_WEAPON              , oPC)
    || GetHasFeat(FEAT_GREATER_PSIONIC_WEAPON      , oPC)
    || GetHasFeat(FEAT_PSIONIC_SHOT                , oPC)
    || GetHasFeat(FEAT_GREATER_PSIONIC_SHOT        , oPC)
    || GetHasFeat(FEAT_OVERCHANNEL                 , oPC)
    || GetHasFeat(FEAT_PSIONIC_MEDITATION          , oPC)
    || GetHasFeat(FEAT_RAPID_METABOLISM            , oPC)
    || GetHasFeat(FEAT_TALENTED                    , oPC)
    || GetHasFeat(FEAT_UNAVOIDABLE_STRIKE          , oPC)
    || GetHasFeat(FEAT_WILD_TALENT                 , oPC)
    || GetHasFeat(FEAT_WOUNDING_ATTACK             , oPC)
    || GetHasFeat(FEAT_BOOST_CONSTRUCT             , oPC)
    || GetHasFeat(FEAT_SPEED_OF_THOUGHT            , oPC)
    || GetHasFeat(FEAT_PSIONIC_TALENT_1            , oPC)
    || GetHasFeat(FEAT_METAMORPHIC_TRANSFER_1      , oPC)
    || GetHasFeat(FEAT_DEEP_IMPACT                 , oPC)
    || GetHasFeat(FEAT_FELL_SHOT                   , oPC)
    || GetHasFeat(FEAT_EXPANDED_KNOWLEDGE_1        , oPC)
    || GetHasFeat(FEAT_INVEST_ARMOUR               , oPC))
        // At least one psionic feat
        SetLocalInt(oPC, "PRC_PrereqDalQuor", 0);
}

void Thrallherd(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqThrallherd", 1);

    // Technically, you must be able to manifest mindlink, and the only class that can do so is a Telepath Psion
    // Thus, this restriction.
    if(GetHasFeat(FEAT_PSION_DIS_TELEPATH, oPC))
    {
        // @todo Replace with some mechanism that is not dependent on power enumeration. Maybe a set of variables that tell how many powers of each discipline a character knows <- requires hooking to power gain / loss
        if(GetHasPower(POWER_CHARMPERSON, oPC)
        || GetHasPower(POWER_AVERSION, oPC)
        || GetHasPower(POWER_BRAINLOCK, oPC)
        || GetHasPower(POWER_CRISISBREATH, oPC)
        || GetHasPower(POWER_EMPATHICTRANSFERHOSTILE, oPC)
        || GetHasPower(POWER_DOMINATE, oPC)
        || GetHasPower(POWER_CRISISLIFE, oPC)
        || GetHasPower(POWER_PSYCHICCHIR_REPAIR, oPC))
        {
            SetLocalInt(oPC, "PRC_PrereqThrallherd", 0);
        }
    }
}

void Shadowmind(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqShadowmind", 1);

    if(GetHasPower(POWER_CONCEALAMORPHA, oPC))
        SetLocalInt(oPC, "PRC_PrereqShadowmind", 0);
}

void SoulEater(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqSoulEater", 1);

    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_ABERRATION
    || nRace == RACIAL_TYPE_ANIMAL
    || nRace == RACIAL_TYPE_BEAST
    || nRace == RACIAL_TYPE_DRAGON
    || nRace == RACIAL_TYPE_HUMANOID_MONSTROUS
    || nRace == RACIAL_TYPE_MAGICAL_BEAST
    || nRace == RACIAL_TYPE_OUTSIDER
    || nRace == RACIAL_TYPE_FEY
    || nRace == RACIAL_TYPE_GIANT
    || nRace == RACIAL_TYPE_ELEMENTAL)
        SetLocalInt(oPC, "PRC_PrereqSoulEater", 0);
}

void RacialHD(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAberration", 1);
    SetLocalInt(oPC, "PRC_PrereqAnimal", 1);
    SetLocalInt(oPC, "PRC_PrereqConstruct", 1);
    SetLocalInt(oPC, "PRC_PrereqHumanoid", 1);
    SetLocalInt(oPC, "PRC_PrereqMonstrous", 1);
    SetLocalInt(oPC, "PRC_PrereqEle", 1);
    SetLocalInt(oPC, "PRC_PrereqFey", 1);
    SetLocalInt(oPC, "PRC_PrereqDragon", 1);
    SetLocalInt(oPC, "PRC_PrereqUndead", 1);
    SetLocalInt(oPC, "PRC_PrereqBeast", 1);
    SetLocalInt(oPC, "PRC_PrereqGiant", 1);
    SetLocalInt(oPC, "PRC_PrereqMagicalBeast", 1);
    SetLocalInt(oPC, "PRC_PrereqOutsider", 1);
    SetLocalInt(oPC, "PRC_PrereqShapechanger", 1);
    SetLocalInt(oPC, "PRC_PrereqVermin", 1);
    SetLocalInt(oPC, "PRC_PrereqPlant", 1);
    if(GetPRCSwitch(PRC_XP_USE_SIMPLE_RACIAL_HD))
    {
        int nRealRace = GetRacialType(oPC);
        int nRacialHD = StringToInt(Get2DACache("ECL", "RaceHD", nRealRace));
        int nRacialClass = StringToInt(Get2DACache("ECL", "RaceClass", nRealRace));
        if(nRacialHD && GetLevelByClass(nRacialClass, oPC) < nRacialHD)
        {
            switch(nRacialClass)
            {
                case CLASS_TYPE_ABERRATION: SetLocalInt(oPC, "PRC_PrereqAberration", 0); break;
                case CLASS_TYPE_ANIMAL: SetLocalInt(oPC, "PRC_PrereqAnmal", 0); break;
                case CLASS_TYPE_CONSTRUCT: SetLocalInt(oPC, "PRC_PrereqConstruct", 0); break;
                case CLASS_TYPE_HUMANOID: SetLocalInt(oPC, "PRC_PrereqHumanoid", 0); break;
                case CLASS_TYPE_MONSTROUS: SetLocalInt(oPC, "PRC_PrereqMonstrous", 0); break;
                case CLASS_TYPE_ELEMENTAL: SetLocalInt(oPC, "PRC_PrereqEle", 0); break;
                case CLASS_TYPE_FEY: SetLocalInt(oPC, "PRC_PrereqFey", 0); break;
                case CLASS_TYPE_DRAGON: SetLocalInt(oPC, "PRC_PrereqDragon", 0); break;
                case CLASS_TYPE_UNDEAD: SetLocalInt(oPC, "PRC_PrereqUndead", 0); break;
                case CLASS_TYPE_BEAST: SetLocalInt(oPC, "PRC_PrereqBeast", 0); break;
                case CLASS_TYPE_GIANT: SetLocalInt(oPC, "PRC_PrereqGiant", 0); break;
                case CLASS_TYPE_MAGICAL_BEAST: SetLocalInt(oPC, "PRC_PrereqMagicalBeast", 0); break;
                case CLASS_TYPE_OUTSIDER: SetLocalInt(oPC, "PRC_PrereqOutsider", 0); break;
                case CLASS_TYPE_SHAPECHANGER: SetLocalInt(oPC, "PRC_PrereqShapechanger", 0); break;
                case CLASS_TYPE_VERMIN: SetLocalInt(oPC, "PRC_PrereqVermin", 0); break;
                case CLASS_TYPE_PLANT: SetLocalInt(oPC, "PRC_PrereqPlant", 0); break;
                default: SetLocalInt(oPC, "NoRace", 0);
            }
        }
    }
}

void Virtuoso(object oPC)
{   //Needs 6 ranks of Persuade OR 6 ranks of Intimidate
    SetLocalInt(oPC, "PRC_PrereqVirtuoso", 1);
    if((GetSkillRank(SKILL_PERSUADE, oPC) >= 6) || (GetSkillRank(SKILL_INTIMIDATE, oPC) >= 6))
        SetLocalInt(oPC, "PRC_PrereqVirtuoso", 0);
}

void FistRaziel(object oPC)
{
    /* The fist of Raziel can only be taken if the player is able to cast Divine Favor.
     * Base classes:
     * Cleric gets it at level 1. Paladin at level 4 (with wis > 11) to 6 (wis == 11)
     */

    SetLocalInt(oPC, "PRC_PrereqFistRaz", 1);
    object oSkin = GetPCSkin(oPC);
    int iWis = GetLocalInt(oSkin, "PRC_trueWIS");
    // hard code it to work for Bioware classes
    if (GetLevelByClass(CLASS_TYPE_CLERIC))
    {
        SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
        return;
    }

    if (GetLevelByClass(CLASS_TYPE_PALADIN))
    {
        if(iWis > 11 && GetLevelByClass(CLASS_TYPE_PALADIN) >= 4)
        {
            SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
            return;
        }
        else if (GetLevelByClass(CLASS_TYPE_PALADIN) >= 6)
        {
            SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
            return;
        }
    }

    if (PRCGetIsRealSpellKnown(SPELL_DIVINE_FAVOR, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqFistRaz", 0);
        return;
    }

}

void Pyro(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqPyro", 1);
    if(GetIsPsionicCharacter(oPC))
        SetLocalInt(oPC, "PRC_PrereqPyro", 0);
}

void Suel()
{
    SetLocalInt(OBJECT_SELF, "PRC_PrereqSuelWeap", 1);

              //martial weapon proficiences
    int nProf = GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHORTSWORD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_LONGSWORD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_BATTLEAXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_WARHAMMER)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_LONGBOW)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_LIGHT_FLAIL)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_HALBERD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHORTBOW)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_GREATSWORD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_GREATAXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_HEAVY_FLAIL)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_LIGHT_HAMMER)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_HANDAXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_RAPIER)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_SCIMITAR)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_THROWING_AXE);
              //exotic weapon proficiences
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_BASTARD_SWORD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_TWO_BLADED_SWORD)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_BATTLEAXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_DIRE_MACE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_DOUBLE_AXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_KAMA)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_KUKRI)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_KATANA)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_SCYTHE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_SHURIKEN)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_DWARVEN_WARAXE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_WHIP)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELVEN_THINBLADE)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_RAPIER)
              + GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELVEN_COURTBLADE);

    if(nProf > 3)
        DeleteLocalInt(OBJECT_SELF, "PRC_PrereqSuelWeap");
}

void TomeOfBattle(object oPC = OBJECT_SELF)
{
    // Deepstone Sentinel
    SetLocalInt(oPC, "PRC_PrereqDeepSt", 1);
    // Needs two Stone Dragon maneuvers
    int nMove = GetManeuverCountByDiscipline(oPC, DISCIPLINE_STONE_DRAGON, MANEUVER_TYPE_MANEUVER);
    // Needs one Stone Dragon Stance
    int nStance = GetManeuverCountByDiscipline(oPC, DISCIPLINE_STONE_DRAGON, MANEUVER_TYPE_STANCE);
    if(nMove > 1 && nStance)
        SetLocalInt(oPC, "PRC_PrereqDeepSt", 0);

    // Bloodclaw Master
    SetLocalInt(oPC, "PRC_PrereqBloodclaw", 1);
    // Needs three Tiger Claw maneuvers
    if(_CheckPrereqsByDiscipline(oPC, DISCIPLINE_TIGER_CLAW, 3))
        SetLocalInt(oPC, "PRC_PrereqBloodclaw", 0);

    // Ruby Knight Vindicator
    SetLocalInt(oPC, "PRC_PrereqRubyKnight", 1);
    // Needs one Devoted Spirit maneuver
    nMove = GetManeuverCountByDiscipline(oPC, DISCIPLINE_DEVOTED_SPIRIT, MANEUVER_TYPE_MANEUVER);
    // Needs one Devoted Spirit stance
    nStance = GetManeuverCountByDiscipline(oPC, DISCIPLINE_DEVOTED_SPIRIT, MANEUVER_TYPE_STANCE);
    // If it's a cleric, needs to have Death, Law and Magic as domains.
    int nDomain = TRUE;
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC))
    {
        nDomain = GetHasFeat(FEAT_DEATH_DOMAIN_POWER, oPC)
                + GetHasFeat(FEAT_MAGIC_DOMAIN_POWER, oPC)
                //+ GetHasFeat(FEAT_LAW_DOMAIN_POWER, oPC)
                > 1;
    }
    if(nMove && nStance && nDomain)
        SetLocalInt(oPC, "PRC_PrereqRubyKnight", 0);

    // Jade Phoenix Mage
    SetLocalInt(oPC, "PRC_PrereqJPM", 1);
    // Skip the rest of not an arcane caster
    if(GetLocalInt(oPC, "PRC_ArcSpell2") == 0)
    {
        int nUser;
        int nMove = 0;
        int nStance = 0;
        int nType;

        // Only need first blade magic class.  Can't take a second and Jade Phoenix and meet requirements.
        nUser = GetPrimaryBladeMagicClass(oPC);

        // If inv_inc_moveknwn can be included here, GetManeuverCount() can be used in place of GetPersistantLocalInt()
        // the following is pulled from the function

        nType = MANEUVER_TYPE_MANEUVER;
        nMove += GetPersistantLocalInt(oPC, "PRC_ManeuverList_" + IntToString(nUser) + IntToString(nType) + "_TotalKnown");

        nType = MANEUVER_TYPE_STANCE;
        nStance += GetPersistantLocalInt(oPC, "PRC_ManeuverList_" + IntToString(nUser) + IntToString(nType) + "_TotalKnown");

        if (nMove >= 2 && nStance >= 1)
            SetLocalInt(oPC, "PRC_PrereqJPM", 0);
    }

    //Master of Nine
    SetLocalInt(oPC, "PRC_PrereqMoNine", 1);
    // Needs 6 maneuvers, so check the persistent locals
    int i, nCount, nSkills;
    for(i = 1; i <= 256; i <<= 1)
    {
        // Loop over all disciplines, and total up how many he knows
        if(_CheckPrereqsByDiscipline(oPC, i))
            nCount++;
    }

    // Base ranks only
    if(GetSkillRank(SKILL_TUMBLE, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_INTIMIDATE, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_CONCENTRATION, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_BALANCE, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_SENSE_MOTIVE, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_HIDE, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_JUMP, oPC, TRUE) >= 10) nSkills += 1;
    if(GetSkillRank(SKILL_PERSUADE, oPC, TRUE) >= 10) nSkills += 1;

    if(nCount >= 6 && nSkills >= 4)
        SetLocalInt(oPC, "PRC_PrereqMoNine", 0);

    //Eternal Blade
    SetLocalInt(oPC, "PRC_PrereqETBL", 1);

    int iWF = WeaponFocusCount(oPC);
    nCount = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_DEVOTED_SPIRIT)
                + _CheckPrereqsByDiscipline(oPC, DISCIPLINE_DIAMOND_MIND);

    if(nCount >= 2 && iWF >= 1)
        SetLocalInt(oPC, "PRC_PrereqETBL", 0);

    //Shadow Sun Ninja
    SetLocalInt(oPC, "PRC_PrereqSSN", 1);

    int nLv2 = GetPersistantLocalInt(oPC, "ShadowSunNinjaLv2Req");
    int nSS = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_SETTING_SUN);
    int nSH = _CheckPrereqsByDiscipline(oPC, DISCIPLINE_SHADOW_HAND);

    // We have at least one 2nd level Shadow Hand or Setting Sun maneuver
    // And at least one of each Shadow Hand and Setting Sun maneuvers
    if(nLv2 && nSS && nSH && (nSS >= 2 || nSH >= 2))
        SetLocalInt(oPC, "PRC_PrereqSSN", 0);
}

void AOTS(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAOTS", 1);
    int iArcane = GetLocalInt(oPC, "PRC_ArcSpell3");
    if(iArcane == 0 || GetInvokerLevel(oPC) >= 5)
        SetLocalInt(oPC, "PRC_PrereqAOTS", 0);
}

void EnlF(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqEnlF", 1);
     int iArcane = GetLocalInt(oPC, "PRC_ArcSpell2");
     if(iArcane == 0 || GetInvokerLevel(oPC) >= 3)
         SetLocalInt(oPC, "PRC_PrereqEnlF", 0);
}

void LichPrereq(object oPC)
{
     SetLocalInt(oPC, "PRC_PrereqLich", 1);
     if(PRCAmIAHumanoid(oPC) || GetLevelByClass(CLASS_TYPE_LICH, oPC) >= 4)
         SetLocalInt(oPC, "PRC_PrereqLich", 0);
}

void DragDisciple(object oPC)
{
    int bRace = FALSE;
    int bSpells = FALSE;
    SetLocalInt(oPC, "PRC_PrereqDrDis", 1);

    //Any nondragon (cannot already be a half-dragon)
    int nRace = GetRacialType(oPC);
    if(!GetHasTemplate(TEMPLATE_HALF_DRAGON, oPC)
    && nRace != RACIAL_TYPE_BAAZ
    && nRace != RACIAL_TYPE_BOZAK
    && nRace != RACIAL_TYPE_KAPAK)
        bRace = TRUE;

    // Ability to cast arcane spells without preparation
    // (dragon blooded feat eliminates that requirement)
    if(GetHasFeat(DRAGON_BLOODED, oPC))
        bSpells = TRUE;
    else if(GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC)
    || GetLevelByClass(CLASS_TYPE_BARD, oPC)
    || GetLevelByClass(CLASS_TYPE_BEGUILER, oPC)
    || GetLevelByClass(CLASS_TYPE_DREAD_NECROMANCER, oPC)
    || GetLevelByClass(CLASS_TYPE_DUSKBLADE, oPC)
    || GetLevelByClass(CLASS_TYPE_HEXBLADE, oPC)
    || GetLevelByClass(CLASS_TYPE_SORCERER, oPC)
    || GetLevelByClass(CLASS_TYPE_SUEL_ARCHANAMACH, oPC)
    || GetLevelByClass(CLASS_TYPE_WARMAGE, oPC)
    || GetLevelByClass(CLASS_TYPE_WITCH, oPC))
    {
        if(!GetLocalInt(oPC, "PRC_ArcSpell0")
        || !GetLocalInt(oPC, "PRC_ArcSpell1"))
              bSpells = TRUE;
    }

    if(bRace && bSpells)
        SetLocalInt(oPC, "PRC_PrereqDrDis", 0);
}

void WarlockPrCs(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqHFWar", 1);
    SetLocalInt(oPC, "PRC_PrereqEDisc", 1);
    SetLocalInt(oPC, "PRC_PrereqETheurg", 1);

    if(GetHasInvocation(INVOKE_BRIMSTONE_BLAST, oPC)
    || GetHasInvocation(INVOKE_HELLRIME_BLAST, oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqHFWar", 0);
    }

    //currently there are only 2 invocation using classes
    //all start with least invocations so this should be accurate
    if(GetIsInvocationUser(oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqEDisc", 0);

        if(GetBlastDamageDices(oPC, GetInvokerLevel(oPC, CLASS_TYPE_WARLOCK)) > 1)
        {
            SetLocalInt(oPC, "PRC_PrereqETheurg", 0);
        }
    }
}

void Shadowbane(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqShadowbane", 1);
    if(GetLevelByClass(CLASS_TYPE_CLERIC, oPC) || 
       GetLevelByClass(CLASS_TYPE_ARCHIVIST, oPC) || 
       GetLevelByClass(CLASS_TYPE_PALADIN, oPC) ||
       GetLevelByClass(CLASS_TYPE_KNIGHT_CHALICE, oPC) ||
       GetLevelByClass(CLASS_TYPE_SOLDIER_OF_LIGHT, oPC) ||
       GetLevelByClass(CLASS_TYPE_SHAMAN, oPC) ||
       GetLevelByClass(CLASS_TYPE_SLAYER_OF_DOMIEL, oPC))
        SetLocalInt(oPC, "PRC_PrereqShadowbane", 0);
}

void KnightWeave(object oPC)
{
    int bSpontCaster = FALSE;
    //make sure user is a spontaneous arcane caster
    int i;
    for(i = 1; i <= 3; i++)
    {
        int nClass = GetClassByPosition(i, oPC);
        if((GetSpellbookTypeForClass(nClass) == SPELLBOOK_TYPE_SPONTANEOUS) && GetMaxSpellLevelForCasterLevel(nClass, GetLevelByTypeArcane(oPC)) >= 3)
              bSpontCaster = TRUE;
              
        //if (DEBUG) DoDebug("Knight of the Weave: Spellbook Type "+IntToString(GetSpellbookTypeForClass(nClass))+", MaxSpellLevel "+IntToString(GetMaxSpellLevelForCasterLevel(nClass, GetLevelByTypeArcane(oPC)))+", BAB "+IntToString(GetBaseAttackBonus(oPC)));      
    }
    
    SetLocalInt(oPC, "PRC_PrereqKnightWeave", 1);
    if((GetBaseAttackBonus(oPC) >= 5 || bSpontCaster) && !GetHasFeat(FEAT_SHADOWWEAVE, oPC)) // Shadow weave not allowed
        SetLocalInt(oPC, "PRC_PrereqKnightWeave", 0);
}

void Incarnate(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqIncarnate", 1);
    if(IncarnateAlignment(oPC) && (PRCGetIsAliveCreature(oPC) || GetHasFeat(FEAT_UNDEAD_MELDSHAPER, oPC)))
        SetLocalInt(oPC, "PRC_PrereqIncarnate", 0);
}

void Spinemeld(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqSpinemeld", 1);
    SetLocalInt(oPC, "PRC_PrereqUmbral", 1);
    SetLocalInt(oPC, "PRC_PrereqIncandescent", 1);
    if(GetTotalEssentia(oPC))
    {
        SetLocalInt(oPC, "PRC_PrereqSpinemeld", 0);    
        SetLocalInt(oPC, "PRC_PrereqUmbral", 0);
        SetLocalInt(oPC, "PRC_PrereqIncandescent", 0);
    }    
    //FloatingTextStringOnCreature("PRC_PrereqSpinemeld is "+IntToString(GetLocalInt(oPC, "PRC_PrereqSpinemeld"))+" GetBAB is "+IntToString(GetBaseAttackBonus(oPC))+" GetLawChaos is "+IntToString(GetAlignmentLawChaos(oPC))+" GetRace is "+IntToString(GetRacialType(oPC)), oPC, FALSE);    
}

void SapphireHierarch(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqSapphire", 1);
    if(GetTotalEssentia(oPC) >= 3 &&/* GetHasFeat(FEAT_LAW_DOMAIN_POWER, oPC) &&*/ GetTotalSoulmeldCount(oPC) >= 3)
        SetLocalInt(oPC, "PRC_PrereqSapphire", 0);    
}

void SoulcasterReq(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqSoulcaster", 1);
    if( GetMaxBindCount(oPC, GetPrimaryIncarnumClass(oPC)) >= 1 && GetTotalSoulmeldCount(oPC) >= 3 &&
    ((!GetLocalInt(oPC, "PRC_PsiPower2") && GetHasFeat(FEAT_AZURE_TALENT, oPC)) ||
    (!GetLocalInt(oPC, "PRC_ArcSpell2") && GetHasFeat(FEAT_INCARNUM_SPELLSHAPING))))
        SetLocalInt(oPC, "PRC_PrereqSoulcaster", 0);    
}

void Ironsoul(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqIronsoul", 1);
    if(GetTotalSoulmeldCount(oPC) >= 1)
        SetLocalInt(oPC, "PRC_PrereqIronsoul", 0);    
}

void Necrocarnum(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqNecrocarnum", 1);
    if(GetTotalSoulmeldCount(oPC) && GetCanBindChakra(oPC, CHAKRA_CROWN) && GetCanBindChakra(oPC, CHAKRA_FEET) && GetCanBindChakra(oPC, CHAKRA_HANDS))
        SetLocalInt(oPC, "PRC_PrereqNecrocarnum", 0);    
}

void Witchborn(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqWitchborn", 1);
    // Can't be arcane at all, Meldshaper level 6th
    if(GetPrimaryArcaneClass(oPC) == CLASS_TYPE_INVALID && GetHighestMeldshaperLevel(oPC) >= 6)
        SetLocalInt(oPC, "PRC_PrereqWitchborn", 0);    
}

void AbChamp(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAbjCha", 1);
    if(GetHasFeat(FEAT_COMBAT_CASTING, oPC))
        SetLocalInt(oPC, "PRC_PrereqAbjCha", 0);    
}

void AnimaMageReq(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqAnimaMage", 1);

    int iFeat = GetHasFeat(FEAT_EMPOWER_SPELL, oPC)
          + GetHasFeat(FEAT_EXTEND_SPELL, oPC)
          + GetHasFeat(FEAT_MAXIMIZE_SPELL, oPC)
          + GetHasFeat(FEAT_QUICKEN_SPELL, oPC)
          + GetHasFeat(FEAT_SILENCE_SPELL, oPC)
          + GetHasFeat(FEAT_STILL_SPELL, oPC);

    // At least one metamagic feat, 2nd level vestiges from Binder class
    if (iFeat && GetMaxVestigeLevel(oPC) >= 2 && GetLevelByClass(CLASS_TYPE_BINDER, oPC))
        SetLocalInt(oPC, "PRC_PrereqAnimaMage", 0);
}

void TenebrousReq(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqTenebrous", 1);
	int nDomain = FALSE;
    if(GetHasFeat(FEAT_DEATH_DOMAIN_POWER)
     + GetHasFeat(FEAT_TRICKERY_DOMAIN_POWER)
     + GetHasFeat(FEAT_EVIL_DOMAIN_POWER) >= 2)
     	nDomain = TRUE;

	// Tenebrous grants turn undead, so it actually meets that requirement.

    // 4th level vestiges from Binder class
    if ((nDomain || !GetLevelByClass(CLASS_TYPE_CLERIC, oPC)) && GetMaxVestigeLevel(oPC) >= 4 && GetLevelByClass(CLASS_TYPE_BINDER, oPC))
        SetLocalInt(oPC, "PRC_PrereqTenebrous", 0);
}

void ScionReq(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqScion", 1);
	int nCheck = FALSE;
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_HUMAN
    || nRace == RACIAL_TYPE_HALFORC
    || nRace == RACIAL_TYPE_HALFELF)
     	nCheck = TRUE;

    // 5th level vestiges from Binder class
    if (nCheck && GetMaxVestigeLevel(oPC) >= 5 && GetLevelByClass(CLASS_TYPE_BINDER, oPC))
        SetLocalInt(oPC, "PRC_PrereqScion", 0);
}

void DragonDevotee(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqDragonDevotee", 1);

    if(MyPRCGetRacialType(oPC) != RACIAL_TYPE_DRAGON)
        SetLocalInt(oPC, "PRC_PrereqDragonDevotee", 0);
}

void UrPriest(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqUrPriest", 1);

    if (GetWillSavingThrow(oPC) >= 3 && GetFortitudeSavingThrow(oPC) >= 3)
    {
        SetLocalInt(oPC, "PRC_PrereqUrPriest", 0);
    }
}

void Ocular(object oPC)
{
    SetLocalInt(oPC, "PRC_PrereqOcular", 1);

    if (GetFortitudeSavingThrow(oPC) >= 4)
    {
        SetLocalInt(oPC, "PRC_PrereqOcular", 0);
    }
}

void main()
{
    //Declare Major Variables
    object oPC = OBJECT_SELF;
    object oSkin = GetPCSkin(oPC);

    // Initialize all the variables.
    string sVariable, sCount;
    int iCount;
    for (iCount = 0; iCount <= 9; iCount++)
    {
       sCount = IntToString(iCount);

       sVariable = "PRC_AllSpell" + sCount;
       SetLocalInt(oPC, sVariable, 1);

       sVariable = "PRC_ArcSpell" + sCount;
       SetLocalInt(oPC, sVariable, 1);

       sVariable = "PRC_DivSpell" + sCount;
       SetLocalInt(oPC, sVariable, 1);

       sVariable = "PRC_PsiPower" + sCount;
       SetLocalInt(oPC, sVariable, 1);
       
        sVariable = "PRC_MystLevel" + sCount;
       SetLocalInt(oPC, sVariable, 1);       
    }

    for (iCount = 1; iCount <= 30; iCount++)
    {
       sCount = IntToString(iCount);

       sVariable = "PRC_SneakLevel" + sCount;
       SetLocalInt(oPC, sVariable, 1);

       sVariable = "PRC_SkirmishLevel" + sCount;
       SetLocalInt(oPC, sVariable, 1);

       sVariable = "PRC_SplAtkLevel" + sCount;
       SetLocalInt(oPC, sVariable, 1);
    }

     // Find the spell levels.
    int iCha = GetLocalInt(oSkin, "PRC_trueCHA") - 10;
    int iWis = GetLocalInt(oSkin, "PRC_trueWIS") - 10;
    int iInt = GetLocalInt(oSkin, "PRC_trueINT") - 10;
    int nArcHighest;
    int nDivHighest;
    int nPsiHighest;
    int bFirstArcClassFound, bFirstDivClassFound, bFirstPsiClassFound, bFirstShdClassFound;
    //for(i=1;i<3;i++)
    int nSpellLevel;
    int nClassSlot = 1;
    while(nClassSlot <= 3)
    {
        int nClass = GetClassByPosition(nClassSlot, oPC);
        nClassSlot += 1;
        if(GetIsDivineClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstDivClassFound &&
                GetPrimaryDivineClass(oPC) == nClass)
            {
                nLevel += GetDivinePRCLevels(oPC);
                bFirstDivClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);

            for(nSpellLevel = 0; nSpellLevel <= 9; nSpellLevel++)
            {
                int nSlots = GetSlotCount(nLevel, nSpellLevel, nAbility, nClass);
                if(nSlots > 0)
                {
                    SetLocalInt(oPC, "PRC_AllSpell"+IntToString(nSpellLevel), 0);
                    SetLocalInt(oPC, "PRC_DivSpell"+IntToString(nSpellLevel), 0);
                    if(nSpellLevel > nDivHighest)
                        nDivHighest = nSpellLevel;
                }
            }
        }
        else if(GetIsArcaneClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstArcClassFound &&
                GetPrimaryArcaneClass(oPC) == nClass)
            {
                nLevel += GetArcanePRCLevels(oPC);
                bFirstArcClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);

            for(nSpellLevel = 0; nSpellLevel <= 9; nSpellLevel++)
            {
                int nSlots = GetSlotCount(nLevel, nSpellLevel, nAbility, nClass);
                if(nSlots > 0)
                {
                    SetLocalInt(oPC, "PRC_AllSpell"+IntToString(nSpellLevel), 0);
                    SetLocalInt(oPC, "PRC_ArcSpell"+IntToString(nSpellLevel), 0);
                    if(nSpellLevel > nArcHighest)
                        nArcHighest = nSpellLevel;
                }
            }
        }
        else if(GetIsPsionicClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstPsiClassFound &&
                GetPrimaryPsionicClass(oPC) == nClass)
            {
                nLevel += GetPsionicPRCLevels(oPC);
                bFirstPsiClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);
            string sPsiFile = GetAMSKnownFileName(nClass);
            int nMaxLevel = StringToInt(Get2DACache(sPsiFile, "MaxPowerLevel", nLevel));

            int nPsiHighest = min(nMaxLevel, nAbility - 10);

            for(nSpellLevel = 1; nSpellLevel <= nPsiHighest; nSpellLevel++)
            {
                SetLocalInt(oPC, "PRC_PsiPower"+IntToString(nSpellLevel), 0);
                //if(DEBUG) DoDebug("Psionics power level Prereq Variable " + IntToString(nSpellLevel) +": " + IntToString(GetLocalInt(oPC, "PRC_PsiPower"+IntToString(nSpellLevel))), oPC);
            }
        }
        else if(GetIsShadowMagicClass(nClass))
        {
            int nLevel = GetLevelByClass(nClass, oPC);
            if (!bFirstShdClassFound &&
                GetPrimaryShadowMagicClass(oPC) == nClass)
            {
                nLevel += GetShadowMagicPRCLevels(oPC);
                bFirstShdClassFound = TRUE;
            }
            int nAbility = GetAbilityScoreForClass(nClass, oPC);
            string sShdFile = GetAMSKnownFileName(nClass);

            int nShdHighest = max(GetMaxMysteryLevelLearnable(oPC, nClass, 1), GetMaxMysteryLevelLearnable(oPC, nClass, 2));
                nShdHighest = max(nShdHighest, GetMaxMysteryLevelLearnable(oPC, nClass, 3));

            for(nSpellLevel = 1; nSpellLevel <= nShdHighest; nSpellLevel++)
            {
                SetLocalInt(oPC, "PRC_MystLevel"+IntToString(nSpellLevel), 0);
                //if(DEBUG) DoDebug("Shadowcasting mystery level Prereq Variable " + IntToString(nSpellLevel) +": " + IntToString(GetLocalInt(oPC, "PRC_MystLevel"+IntToString(nSpellLevel))), oPC);
            }
        }        
    }// end while - loop over all 3 class slots

    // special alignment requirements
    reqAlignment(oPC);
    // special gender requirements
    reqGender();
    // Find the sneak attack/skirmish capacity.
    reqSpecialAttack(oPC);

    // Cleric domain requirements
    if(GetLevelByClass(CLASS_TYPE_CLERIC))
        reqDomains();

    // Special requirements for several classes.
    Tempest();
    KOTC(oPC);
    RedWizard(oPC);
    Shadowlord(oPC, nArcHighest);
    Shifter(oPC, nArcHighest, nDivHighest);
    DemiLich(oPC);
    WWolf(oPC);
    Kord(oPC);
    Maester(oPC);
    reqCombatMedic(oPC);
    Thrallherd(oPC);
    Shadowmind(oPC);
    SoulEater(oPC);
    RacialHD(oPC);
    Virtuoso(oPC);
    LichPrereq(oPC);
    DalQuor(oPC);
    Pyro(oPC);
    Suel();
    TomeOfBattle(oPC);
    AOTS(oPC);
    EnlF(oPC);
    DragDisciple(oPC);
    WarlockPrCs(oPC);
    Purifier(oPC);
    Shadowbane(oPC);
    WildMageReq(oPC);
    KnightWeave(oPC);
    Dragonheart(oPC);
    Cultist(oPC);
    Incarnate(oPC);
    Spinemeld(oPC);
    SapphireHierarch(oPC);
    SoulcasterReq(oPC);
    Ironsoul(oPC);
    AbChamp(oPC);
    Necrocarnum(oPC);
    Witchborn(oPC);
    AnimaMageReq(oPC);
    TenebrousReq(oPC);
    ScionReq(oPC);
    DragonDevotee(oPC);
    UrPriest(oPC);
    Ocular(oPC);
    // Truly massive debug message flood if activated.
 /*   
    if (DEBUG)
    {
        string sPRC_AllSpell;
        string sPRC_ArcSpell;
        string sPRC_DivSpell;
        string sPRC_PsiPower;
        string sPRC_ShdMyst;
        for (iCount = 1; iCount <= 9; iCount++)
        {
           sPRC_AllSpell = "PRC_AllSpell" + IntToString(iCount);
           sPRC_ArcSpell = "PRC_ArcSpell" + IntToString(iCount);
           sPRC_DivSpell = "PRC_DivSpell" + IntToString(iCount);
           sPRC_PsiPower = "PRC_PsiPower" + IntToString(iCount);
           sPRC_ShdMyst = "PRC_MystLevel" + IntToString(iCount);
           SendMessageToPC(oPC, sPRC_AllSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_AllSpell)) + ". " +
                                sPRC_ArcSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_ArcSpell)) + ". " +
                                sPRC_DivSpell + " is " + IntToString(GetLocalInt(oPC, sPRC_DivSpell)) + ". " +
                                sPRC_PsiPower + " is " + IntToString(GetLocalInt(oPC, sPRC_PsiPower)) + ". " +
                                sPRC_ShdMyst + " is " + IntToString(GetLocalInt(oPC, sPRC_ShdMyst)) + ".");
        }
        for (iCount = 1; iCount <= 30; iCount++)
        {
           sVariable = "PRC_SneakLevel" + IntToString(iCount);
           SendMessageToPC(oPC, sVariable + " is " + IntToString(GetLocalInt(oPC, sVariable)) + ".");
        }
        
    }*/
}
