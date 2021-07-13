//::///////////////////////////////////////////////
//:: Name ds_rnd_kledg_spw
//:: Copyright (c) 2001 Bioware Corp.
//:: Copyright (c) NWN Dark Sun
//:://////////////////////////////////////////////
/*
    Randomized Appearance Guard On Spawn script


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

    2021-03-17: DMH
    Added randomization bits.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner, Georg Zoeller
//:: Created On: June 11/03
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

#include "NW_I0_GENERIC"
#include "ms_name_inc"
#include "NW_O2_CONINCLUDE"
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

//:: Sets a random integer on the creature to use with other spell functions

    string sImmune = GetName(OBJECT_SELF)+"_AURA_IMMUNE";
    int nRandomSeed = Random(999);
    SetLocalInt(OBJECT_SELF, sImmune, nRandomSeed);

//:: Creature will quickly & automatically buff itself up with any defensive
//:: spells it has memorized.

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

    int nNoStun = GetLocalInt(OBJECT_SELF,"NOSTUN");
    if (nNoStun > 0)
    {
        effect eNoStun = EffectImmunity(IMMUNITY_TYPE_STUN);
        eNoStun = SupernaturalEffect(eNoStun);
        eNoStun = ExtraordinaryEffect(eNoStun);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoStun,OBJECT_SELF));
    }

    int nNoDaze = GetLocalInt(OBJECT_SELF,"NODAZE");
    if (nNoDaze > 0)
    {
        effect eNoDaze = EffectImmunity(IMMUNITY_TYPE_DAZED);
        eNoDaze = SupernaturalEffect(eNoDaze);
        eNoDaze = ExtraordinaryEffect(eNoDaze);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoDaze,OBJECT_SELF));
    }

    int nDeaf = GetLocalInt(OBJECT_SELF,"IS_DEAF");
    if (nDeaf > 0)
    {
        effect eDeaf = EffectDeaf();
        eDeaf = SupernaturalEffect(eDeaf);
        eDeaf = ExtraordinaryEffect(eDeaf);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDeaf,OBJECT_SELF));
    }

//:: Fix for the new golems to reduce their number of attacks.
    int nNumber = GetLocalInt(OBJECT_SELF,"CREATURE_VAR_NUMBER_OF_ATTACKS");
    if (nNumber > 0 )
    {
        SetBaseAttackBonus(nNumber);
    }

    int nVFX = GetLocalInt(OBJECT_SELF,"SpawnVFX");
    if(nVFX)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,SupernaturalEffect(EffectVisualEffect(nVFX)),OBJECT_SELF);
        }

    int nRegen = GetLocalInt(OBJECT_SELF,"FAST_HEALING");
    if(nRegen)
        {
            effect eRegen = EffectRegenerate(nRegen, 6.0f);
            eRegen = SupernaturalEffect(eRegen);
            eRegen = ExtraordinaryEffect(eRegen);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eRegen, OBJECT_SELF));
        }

    int nShadowy = GetLocalInt(OBJECT_SELF,"SHADOWY");
    if (nShadowy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nStony = GetLocalInt(OBJECT_SELF,"STONY");
    if (nStony)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_STONESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nWoody = GetLocalInt(OBJECT_SELF,"WOODY");
    if (nWoody)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_PROT_BARKSKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }

    int nConcealed20 = GetLocalInt(OBJECT_SELF,"CONCEALED20");
    if (nConcealed20)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_BLUR );
            effect eConceal = EffectConcealment(20, 0);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }


        int nIcy = GetLocalInt(OBJECT_SELF,"ICY");
    if (nIcy)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_ICESKIN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
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
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 2)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 3)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 4)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_GREY);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 5)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 6)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BROWN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 7)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_GREEN);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 8)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 9)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 10)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 11)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 12)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_ORANGE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 13)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_PURPLE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 14)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 15)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_WHITE);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
        }
    else if (nGlow == 16)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
            eVis = SupernaturalEffect(eVis);
            eVis = ExtraordinaryEffect(eVis);
            DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF));
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

    int nSkinColor;
    nSkinColor = Random(15);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_SKIN, nSkinColor);

    int nKeephead = GetLocalInt(OBJECT_SELF,"AR_KEEPHEAD");
    int nHeadNumber;
    nHeadNumber = Random(12)+1;
    if (nKeephead != 1)
            {
                SetCreatureBodyPart(CREATURE_PART_HEAD, nHeadNumber, OBJECT_SELF);
            }

    int nHairColor;
    nHairColor = Random(15);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_HAIR, nHairColor);

    int nTattoo1;
    nTattoo1 = Random(15);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_1, nTattoo1);

    int nTattoo2;
    nTattoo2 = Random(15);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_2, nTattoo2);

 //Calls the Random Name Generator
    ms_Nomenclature(OBJECT_SELF);

//Randomizes Armor
    int nResult = d6(1);
    object oArmor;
    string sItem;
    if (nResult == 1)
        {
            sItem = "AR_ALTSL_BONE01";
        }
    else if(nResult == 2)
        {
            sItem = "AR_ALTSL_IVORY";
        }
    else if(nResult == 3)
        {
            sItem = "DS_AMDBP_KLED001";
        }
    else if(nResult ==4)
        {
            sItem = "AR_ALTLT_MEKILOT";
        }
    else if(nResult == 5)
        {
            sItem = "DS_AMDBP_KLED002";
        }
    else
        sItem = "DS_AMDBP_KLED003";

    DelayCommand(1.0, ActionEquipItem(CreateItemOnObject(sItem), INVENTORY_SLOT_CHEST));


    SetLocalInt(OBJECT_SELF, "iDialogue", Random(10) + 1);
    //SetLocalString(OBJECT_SELF, "sName", RandomName());
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    //WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature


}
