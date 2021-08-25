//::///////////////////////////////////////////////
//:: Black Blade of Disaster
//:: X2_S0_BlckBlde
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Summons a greatsword to battle for the caster
*/
//:://////////////////////////////////////////////
//:: Created By: Andrew Nobbs
//:: Created On: Nov 26, 2002
//:://////////////////////////////////////////////
//:: Last Updated By: Georg Zoeller, July 28 - 2003

//:: modified by mr_bumpkin Dec 4, 2003 for prc stuff

#include "inc_utility"
#include "prc_inc_spells"
#include "prc_inc_sp_tch"
#include "prc_add_spell_dc"

void DoPnPAttack(object oSummon)
{
    object oTarget = GetAttackTarget(oSummon);
    if(GetIsObjectValid(oTarget)
        && GetDistanceBetween(oTarget, oSummon) < 5.0)
    {
        int nAttackResult = PRCDoMeleeTouchAttack(oTarget);;
        if(nAttackResult)
        {
            //hit or critical hit
            //touch attacks are only crit on 20
            //BBoD is crit on 18-20
            //so 2/20ths of attacks that hit, but not crit, will be turned into crits
            if(nAttackResult == 1 & d20(1)>=19)
                nAttackResult = 2;
            int nDamage = d12(2);
            if(nAttackResult == 2)
                nDamage *=2; //critical doubles damage
            //its magical damage because the description is unclear
            AssignCommand(oSummon, ApplyEffectToObject(
                DURATION_TYPE_INSTANT, PRCEffectDamage(oTarget, nDamage,
                    DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE), oTarget));
        }
        if(nAttackResult == 2)
        {
            //critical hit
            //cast disintegrate
            int nLevel = GetLocalInt(oSummon, "BBoD_Level");

            SetLocalInt(oSummon, PRC_CASTERLEVEL_OVERRIDE, nLevel);
            // Make sure this variable gets deleted as quickly as possible in case it's added in error.
            AssignCommand(oSummon, DelayCommand(1.0, DeleteLocalInt(oSummon, PRC_CASTERLEVEL_OVERRIDE)));

            // Make SR check
           if (!PRCDoResistSpell(OBJECT_SELF, oTarget))
           {
                // Generate the RTA beam.
                AssignCommand(oSummon, SPApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                EffectBeam(VFX_BEAM_DISINTEGRATE, OBJECT_SELF, BODY_NODE_HAND), oTarget, 1.0,FALSE));

                // Fort save or die time, but we implement death by doing massive damage
                // since disintegrate works on constructs, undead, etc.  At some point EffectDie()
                // should be tested to see if it works on non-living targets, and if it does it should
                // be used instead.
                // Test done. Result: It does kill them.
                int nDamage = 9999;
                if (PRCMySavingThrow(SAVING_THROW_FORT, oTarget, PRCGetSaveDC(oTarget,OBJECT_SELF), SAVING_THROW_TYPE_SPELL))
                {
                     nDamage = PRCGetMetaMagicDamage(DAMAGE_TYPE_MAGICAL, 1 == nAttackResult ? 5 : 10, 6);
                }
                else
                {
                     // If FB passes saving throw it survives, else it dies
                     //DeathlessFrenzyCheck(oTarget);

                     // For targets with > 9999 HP. Uncomment if you have such in your module and would like Disintegrate
                     // to be sure to blast them
                     //DelayCommand(0.30, SPApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));
                }

                // Apply damage effect and VFX impact, and if the target is dead then apply
                // the fancy rune circle too.
                if (nDamage >= GetCurrentHitPoints (oTarget))
                     DelayCommand(0.25, SPApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), oTarget));
                //DelayCommand(0.25, SPApplyEffectToObject(DURATION_TYPE_INSTANT, PRCEffectDamage(oTarget, nDamage, DAMAGE_TYPE_MAGICAL), oTarget));
                DelayCommand(0.25, SPApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGBLUE), oTarget));
                ApplyTouchAttackDamage(OBJECT_SELF, oTarget, nAttackResult, nDamage, DAMAGE_TYPE_MAGICAL);
           }

        }
    }
    if(GetIsObjectValid(oSummon))
        DelayCommand(6.0, DoPnPAttack(oSummon));
}

//Creates the weapon that the creature will be using.
void spellsCreateItemForSummoned()
{
    //Declare major variables
    int nStat;

    // cast from scroll, we just assume +5 ability modifier
    if (GetSpellCastItem() != OBJECT_INVALID)
    {
        nStat = 5;
    }
     else
    {
        int nClass = PRCGetLastSpellCastClass();
        int nLevel = GetLevelByClass(nClass);

        int nStat;

        int nCha =  GetAbilityModifier(ABILITY_CHARISMA,OBJECT_SELF);
        int nInt =  GetAbilityModifier(ABILITY_INTELLIGENCE,OBJECT_SELF);

        if (nClass == CLASS_TYPE_WIZARD || nClass == CLASS_TYPE_DEFILER)
        {
            nStat = nInt;
        }
        else
        {
            nStat = nCha;
        }

        if (nStat >20)
        {
            nStat =20;
        }

        if (nStat <1)
        {
           nStat = 0;
        }
    }
    int i = 1;
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, OBJECT_SELF, i);
    while(GetIsObjectValid(oSummon))
    {
        oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, OBJECT_SELF, i);
        i++;
    }
    // Make the blade require concentration
    SetLocalInt(oSummon,"X2_L_CREATURE_NEEDS_CONCENTRATION",TRUE);
    object oWeapon;
    //Create item on the creature, epuip it and add properties.
    oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oSummon);
    if (nStat > 0 && !GetPRCSwitch(PRC_PNP_BLACK_BLADE_OF_DISASTER))
    {
        IPSetWeaponEnhancementBonus(oWeapon, nStat);
    }
    SetDroppableFlag(oWeapon, FALSE);
    SetPlotFlag (oSummon,TRUE);

    if(GetPRCSwitch(PRC_PNP_BLACK_BLADE_OF_DISASTER))
    {
        itemproperty ipTest = GetFirstItemProperty(oWeapon);
        while(GetIsItemPropertyValid(ipTest))
        {
            ipTest = GetNextItemProperty(oWeapon);
        }
        itemproperty ipNoDam = ItemPropertyNoDamage();
        AddItemProperty(DURATION_TYPE_PERMANENT, ipNoDam, oWeapon);
        itemproperty ipVFX = ItemPropertyVisualEffect(ITEM_VISUAL_ELECTRICAL);
        AddItemProperty(DURATION_TYPE_PERMANENT, ipVFX, oWeapon);
        //store the level on the summon
        SetLocalInt(oSummon, "BBoD_Level", GetLocalInt(OBJECT_SELF, "BBoD_Level"));
        DeleteLocalInt(OBJECT_SELF, "BBoD_Level");
        //attacks are handled through a pseudoHB
        DoPnPAttack(oSummon);
    }
}

void main()
{
DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
SetLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR", SPELL_SCHOOL_CONJURATION);
/*
  Spellcast Hook Code
  Added 2003-07-07 by Georg Zoeller
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    int nMetaMagic = PRCGetMetaMagicFeat();
    int nDuration = PRCGetCasterLevel(OBJECT_SELF);
    effect eSummon = EffectSummonCreature("x2_s_bblade");
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    //Make metamagic check for extend
    if ((nMetaMagic & METAMAGIC_EXTEND))
        nDuration = nDuration *2;//Duration is +100%
    //Apply the VFX impact and summon effect
    MultisummonPreSummon();
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, PRCGetSpellTargetLocation());

    float fDuration = RoundsToSeconds(nDuration);
    if(GetPRCSwitch(PRC_SUMMON_ROUND_PER_LEVEL))
        fDuration = RoundsToSeconds(nDuration*GetPRCSwitch(PRC_SUMMON_ROUND_PER_LEVEL));
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, PRCGetSpellTargetLocation(), fDuration);
    DelayCommand(1.5, spellsCreateItemForSummoned());
    if(GetPRCSwitch(PRC_PNP_BLACK_BLADE_OF_DISASTER))
    {
        SetLocalInt(OBJECT_SELF, "BBoD_Level", PRCGetCasterLevel(OBJECT_SELF));
    }

DeleteLocalInt(OBJECT_SELF, "X2_L_LAST_SPELLSCHOOL_VAR");
// Erasing the variable used to store the spell's spell school
}
