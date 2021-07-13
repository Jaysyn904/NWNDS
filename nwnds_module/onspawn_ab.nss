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
    //modify to try fix aura effects.
    //NC:EDIT
    int nAOD = GetTag(OBJECT_SELF)=="AngelofDecay" ? TRUE : FALSE;
    if(nAOD)ExecuteScript("rotaura",OBJECT_SELF);
    int nPrism = GetTag(OBJECT_SELF)=="Prismasaurus" ? TRUE : FALSE;
    if(nPrism)ExecuteScript("prism_aura",OBJECT_SELF);
    int nDreamV = GetTag(OBJECT_SELF)=="DreamVestige" ? TRUE : FALSE;
    if(nDreamV)ExecuteScript("desecrating_aura",OBJECT_SELF);
    int nCryptC = GetTag(OBJECT_SELF)=="CryptChanter" ? TRUE : FALSE;
    if(nCryptC)ExecuteScript("DrainingMelody",OBJECT_SELF);
    int nHunefer = GetTag(OBJECT_SELF)=="Hunefer" ? TRUE : FALSE;
    if(nHunefer)ExecuteScript("fear2_aura",OBJECT_SELF);
    int nPlagueBlight = GetTag(OBJECT_SELF)=="PlagueBlight" ? TRUE : FALSE;
    if(nPlagueBlight)ExecuteScript("plagueaura",OBJECT_SELF);
    int nBDrinker = GetTag(OBJECT_SELF)=="ar_brdrinker_001" ? TRUE : FALSE;
    if(nBDrinker)ExecuteScript("airlessaura",OBJECT_SELF);

    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);


    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }

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
