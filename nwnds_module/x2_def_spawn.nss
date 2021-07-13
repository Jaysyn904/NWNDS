//::///////////////////////////////////////////////
//:: Name x2_def_spawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Spawn script


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

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

#include "NW_I0_GENERIC"
#include "ms_name_inc"
#include "x2_inc_switches"

void ShrinkEm(object oPC)
{
    SetObjectVisualTransform(oPC, OBJECT_VISUAL_TRANSFORM_SCALE, 0.5f);
}

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

    int nOLM = GetLocalInt(OBJECT_SELF,"OLM");
    if (nOLM > 0)
    {
        DelayCommand(0.0f, ShrinkEm(OBJECT_SELF));

        effect eSlow = EffectMovementSpeedDecrease(50);
        eSlow = SupernaturalEffect(eSlow);
        eSlow = ExtraordinaryEffect(eSlow);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSlow,OBJECT_SELF));
    }

    int nNoStun = GetLocalInt(OBJECT_SELF,"NOSTUN");
    if (nNoStun > 0)
    {
        effect eNoStun = EffectImmunity(IMMUNITY_TYPE_STUN);
        eNoStun = SupernaturalEffect(eNoStun);
        eNoStun = ExtraordinaryEffect(eNoStun);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoStun,OBJECT_SELF));
    }
    int nNatInvis = GetLocalInt(OBJECT_SELF,"NATURAL_INVIS");
    if (nNatInvis > 0)
    {
        effect eNatInvis = EffectInvisibility(4);
        eNatInvis = SupernaturalEffect(eNatInvis);
        eNatInvis = ExtraordinaryEffect(eNatInvis);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNatInvis,OBJECT_SELF));
    }

    int nNoSleep = GetLocalInt(OBJECT_SELF,"NOSLEEP");
    if (nNoSleep > 0)
    {
        effect eNoSleep = EffectImmunity(IMMUNITY_TYPE_SLEEP);
        eNoSleep = SupernaturalEffect(eNoSleep);
        eNoSleep = ExtraordinaryEffect(eNoSleep);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoSleep,OBJECT_SELF));
    }

    int nNoDaze = GetLocalInt(OBJECT_SELF,"NODAZE");
    if (nNoDaze > 0)
    {
        effect eNoDaze = EffectImmunity(IMMUNITY_TYPE_DAZED);
        eNoDaze = SupernaturalEffect(eNoDaze);
        eNoDaze = ExtraordinaryEffect(eNoDaze);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoDaze,OBJECT_SELF));
    }

    int nNoBlind = GetLocalInt(OBJECT_SELF,"NOBLIND");
    if (nNoBlind > 0)
    {
        effect eNoBlind = EffectImmunity(IMMUNITY_TYPE_BLINDNESS);
        eNoBlind = SupernaturalEffect(eNoBlind);
        eNoBlind = ExtraordinaryEffect(eNoBlind);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoBlind,OBJECT_SELF));
    }

    int nNoDeaf = GetLocalInt(OBJECT_SELF,"NODEAF");
    if (nNoDeaf > 0)
    {
        effect eNoDeaf = EffectImmunity(IMMUNITY_TYPE_DEAFNESS);
        eNoDeaf = SupernaturalEffect(eNoDeaf);
        eNoDeaf = ExtraordinaryEffect(eNoDeaf);
        DelayCommand(0.0f, ApplyEffectToObject(DURATION_TYPE_PERMANENT,eNoDeaf,OBJECT_SELF));
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
    int nFirey = GetLocalInt(OBJECT_SELF,"FIREY");
    if (nFirey)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_INFERNO_NO_SOUND);
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

    int nConcealed50 = GetLocalInt(OBJECT_SELF,"CONCEALED50");
    if (nConcealed50)
        {
            effect eVis = EffectVisualEffect(VFX_DUR_BLUR );
            effect eConceal = EffectConcealment(50, 0);
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

    int nAcidShield = GetLocalInt(OBJECT_SELF,"ACID_SHIELD");
    if ( nAcidShield )
    {
        effect eShield = EffectDamageShield(0,DAMAGE_BONUS_1d8,DAMAGE_TYPE_ACID);
        eShield = SupernaturalEffect(eShield);
        eShield = ExtraordinaryEffect(eShield);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eShield,OBJECT_SELF);
    }

    int nSerratedEdge = GetLocalInt(OBJECT_SELF,"SERRATED_EDGE");
    if ( nSerratedEdge )
    {
        effect eShield = EffectDamageShield(0,DAMAGE_BONUS_1d6,DAMAGE_TYPE_SLASHING);
        eShield = SupernaturalEffect(eShield);
        eShield = ExtraordinaryEffect(eShield);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eShield,OBJECT_SELF);
    }

    int nSpikedArmor = GetLocalInt(OBJECT_SELF,"SPIKED_ARMOR");
    if ( nSpikedArmor )
    {
        effect eShield = EffectDamageShield(0,DAMAGE_BONUS_1d4,DAMAGE_TYPE_PIERCING);
        eShield = SupernaturalEffect(eShield);
        eShield = ExtraordinaryEffect(eShield);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eShield,OBJECT_SELF);
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

    ms_Nomenclature(OBJECT_SELF);

}
