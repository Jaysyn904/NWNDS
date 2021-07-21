//::///////////////////////////////////////////////
//:: Name ar_def_spawnbuff
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Auto-Buff On Spawn script


    2003-07-28: Georg Zoeller:

    If you set a ninteger on the creature named
    "X2_USERDEFINED_ONSPAWN_EVENTS"
    The creature will fire a pre and a post-spawn
    event on itself, depending on the value of that
    variable
    1 - Fire Userdefined Event 1510 (pre spawn)
    2 - Fire Userdefined Event 1511 (post spawn)
    3 - Fire both events

    2007-12-31: Deva Winblood
    Modified to look for X3_HORSE_OWNER_TAG and if
    it is defined look for an NPC with that tag
    nearby or in the module (checks near first).
    It will make that NPC this horse's master.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner, Georg Zoeller
//:: Created On: June 11/03
//:://////////////////////////////////////////////
//:: Modified By: DM Heatstroke
//:: Modified On: 1-24-11
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

#include "NW_I0_GENERIC"
#include "ms_name_inc"
#include "x2_inc_switches"

void main()
{
    string sTag;
    object oNPC;
    ExecuteScript("prc_npc_spawn", OBJECT_SELF);
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");


    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }

    sTag=GetLocalString(OBJECT_SELF,"X3_HORSE_OWNER_TAG");
    if (GetStringLength(sTag)>0)
    { // look for master
        oNPC=GetNearestObjectByTag(sTag);
        if (GetIsObjectValid(oNPC)&&GetObjectType(oNPC)==OBJECT_TYPE_CREATURE)
        { // master found
            AddHenchman(oNPC);
        } // master found
        else
        { // look in module
            oNPC=GetObjectByTag(sTag);
            if (GetIsObjectValid(oNPC)&&GetObjectType(oNPC)==OBJECT_TYPE_CREATURE)
            { // master found
                AddHenchman(oNPC);
            } // master found
            else
            { // master does not exist - remove X3_HORSE_OWNER_TAG
                DeleteLocalString(OBJECT_SELF,"X3_HORSE_OWNER_TAG");
            } // master does not exist - remove X3_HORSE_OWNER_TAG
        } // look in module
    } // look for master

    int nAutobuff = GetLocalInt(OBJECT_SELF,"AUTOBUFF");
    if (nAutobuff > 0 )
    {
        SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
    }


//:: Creature will flee those that close within 7m if they are not friends,
//:: Rangers or Druids.

    int nHerbivore = GetLocalInt(OBJECT_SELF,"CREATURE_VAR_HERBIVORE");
    if (nHerbivore > 0 )
    {
        SetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL);
        SetBehaviorState(NW_FLAG_BEHAVIOR_HERBIVORE);
    }

//:: Creature will only attack those that close within 5m and are not friends,
//:: Rangers or Druids.

    int nOmnivore = GetLocalInt(OBJECT_SELF,"CREATURE_VAR_OMNIVORE");
    if (nOmnivore > 0 )
    {
        SetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL);
        SetBehaviorState(NW_FLAG_BEHAVIOR_OMNIVORE);
    }

//:: Fix for the new golems to reduce their number of attacks.

    int nNumber = GetLocalInt(OBJECT_SELF,"CREATURE_VAR_NUMBER_OF_ATTACKS");
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }

    int nShadowy = GetLocalInt(OBJECT_SELF,"SHADOWY");
    if (nShadowy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nStony = GetLocalInt(OBJECT_SELF,"STONY");
    if (nStony)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nWoody = GetLocalInt(OBJECT_SELF,"WOODY");
    if (nWoody)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_BARKSKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

        int nIcy = GetLocalInt(OBJECT_SELF,"ICY");
    if (nIcy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_ICESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    int nSR = GetLocalInt(OBJECT_SELF,"SPELL_RESISTANCE");
    if ( nSR )
    {
        effect eSR = EffectSpellResistanceIncrease(nSR);
        eSR = SupernaturalEffect(eSR);
        eSR = ExtraordinaryEffect(eSR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSR,OBJECT_SELF);
    }

    int nAttackBonus = GetLocalInt(OBJECT_SELF,"ATTACK_BONUS");
    if ( nAttackBonus )
    {
        effect eAttack = EffectAttackIncrease(nAttackBonus);
        eAttack = SupernaturalEffect(eAttack);
        eAttack = ExtraordinaryEffect(eAttack);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAttack,OBJECT_SELF);
    }

    int nGlow = GetLocalInt (OBJECT_SELF,"GLOW_COLOR");
    if (nGlow == 1)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 2)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 3)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 4)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREY);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 5)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 6)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 7)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 8)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 9)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 10)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 11)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 12)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 13)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 14)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 15)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }
    else if (nGlow == 16)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);
        }

    //modify to try fix on Various Aura effects.
    //NC:EDIT
/*    int nAtropal = GetTag(OBJECT_SELF)=="ATROPAL001" ? TRUE : FALSE;
    if(nAtropal)ExecuteScript("atropal_aura",OBJECT_SELF);
    int nNWalker = GetTag(OBJECT_SELF)=="Nightwalker" ? TRUE : FALSE;
    if(nNWalker)ExecuteScript("desecrating_aura",OBJECT_SELF);
    int nNCrawler = GetTag(OBJECT_SELF)=="Nightcrawler" ? TRUE : FALSE;
    if(nNCrawler)ExecuteScript("desecrating_aura",OBJECT_SELF);
    int nVoidWraith = GetTag(OBJECT_SELF)=="Voidwraith" ? TRUE : FALSE;
    if(nVoidWraith)ExecuteScript("airlessaura",OBJECT_SELF);
    int AtropalScion = GetTag(OBJECT_SELF)=="AtropalScion" ? TRUE : FALSE;
    if(AtropalScion)ExecuteScript("neaura",OBJECT_SELF);
    int nGhast = GetTag(OBJECT_SELF)=="GHAST001" ? TRUE : FALSE;
    if(nGhast)ExecuteScript("ghast_stench",OBJECT_SELF);   */


    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);


    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }

    ms_Nomenclature(OBJECT_SELF);

}
