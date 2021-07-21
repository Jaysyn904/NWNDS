//::///////////////////////////////////////////////
//:: Paralyze 2d12 Minutes (Turns)
//:: AR_Para_2d12_Min
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Induces Paralysis for 2d12 minutes (turns).
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 12, 2012
//:://////////////////////////////////////////////

void main()
{
    object oTarget = OBJECT_SELF;
    int iTime = d12(2);
    effect eParal = EffectParalyze();
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    effect eLink = EffectLinkEffects(eParal, eLink);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(iTime));
}
