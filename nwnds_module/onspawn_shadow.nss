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

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner, Georg Zoeller
//:: Created On: June 11/03
//:://////////////////////////////////////////////

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;


#include "x2_inc_switches"
void main()
{
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");

    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }

    /*  Fix for the new golems to reduce their number of attacks */

    int nNumber = GetLocalInt(OBJECT_SELF,CREATURE_VAR_NUMBER_OF_ATTACKS);
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }
    //modify to try fix on Various Aura effects.
    //NC:EDIT
    int nAtropal = GetTag(OBJECT_SELF)=="ATROPAL001" ? TRUE : FALSE;
    if(nAtropal)ExecuteScript("atropal_aura",OBJECT_SELF);
    int nNWalker = GetTag(OBJECT_SELF)=="Nightwalker" ? TRUE : FALSE;
    if(nNWalker)ExecuteScript("desecrating_aura",OBJECT_SELF);
    int nNCrawler = GetTag(OBJECT_SELF)=="Nightcrawler" ? TRUE : FALSE;
    if(nNCrawler)ExecuteScript("desecrating_aura",OBJECT_SELF);
    int nVoidWraith = GetTag(OBJECT_SELF)=="Voidwraith" ? TRUE : FALSE;
    if(nVoidWraith)ExecuteScript("airlessaura",OBJECT_SELF);
    int AtropalScion = GetTag(OBJECT_SELF)=="AtropalScion" ? TRUE : FALSE;
    if(AtropalScion)ExecuteScript("neaura",OBJECT_SELF);
    int nGhoul = GetTag(OBJECT_SELF)=="GHOUL001" ? TRUE : FALSE;
    if(nGhoul)ExecuteScript("ghoul_stench",OBJECT_SELF);

    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);


    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }

    effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    eVis = SupernaturalEffect(eVis);
    eVis = ExtraordinaryEffect(eVis);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,OBJECT_SELF);

    int nAttackBonus = GetLocalInt(OBJECT_SELF,"ATTACK_BONUS");
    if ( nAttackBonus )
    {
        effect eAttack = EffectAttackIncrease(nAttackBonus);
        eAttack = SupernaturalEffect(eAttack);
        eAttack = ExtraordinaryEffect(eAttack);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAttack,OBJECT_SELF);
    }
    int nSR = GetLocalInt(OBJECT_SELF,"SPELL_RESISTANCE");
    if ( nSR )
    {
        effect eSR = EffectSpellResistanceIncrease(nSR);
        eSR = SupernaturalEffect(eSR);
        eSR = ExtraordinaryEffect(eSR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSR,OBJECT_SELF);
    }
}

