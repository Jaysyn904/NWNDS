//::///////////////////////////////////////////////
//:: Custom AI Demo Template
//:: x2_ai_demo
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is a template for those who want to
    override the standard combat AI NWN uses.

    The code in this file effectivly replaces
    the DetermineCombatRound() function in
    nw_i0_generic.nss, which is the core of the
    NWN combat AI.

    To override the default AI with this or any
    other AI script you created, you can either
    call the SetCreatureOverrideAIScript from
    x2_inc_switches

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-08-21
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "x2_inc_switches"
#include "inc_AI"

void main()
{
    // The following two lines should not be touched
    object oIntruder = GetCreatureOverrideAIScriptTarget();
    ClearCreatureOverrideAIScriptTarget();

    if ( !GetCanAct(OBJECT_SELF) )
    {
        SetCreatureOverrideAIScriptFinished();
        return;
    }
    int bSummoned = GetLocalInt(OBJECT_SELF,"bones");
    if ( !bSummoned )
    {
//        ActionCastFakeSpellAtLocation(SPELL_SUMMON_SHADOW,GetLocation(OBJECT_SELF));

        ExecuteScript("summon_skelies",OBJECT_SELF);

//        SetCreatureOverrideAIScriptFinished();
        SetLocalInt(OBJECT_SELF,"bones",1);
        return;
    }

}
