//::///////////////////////////////////////////////
//:: Sleep 2d6 Minutes (Turns)
//:: AR_Slp_2d6_Min
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Character is rendered unconscious for
    2d6 minutes (turns).
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 12, 2012
//:://////////////////////////////////////////////

void main()
{
    object oTarget = OBJECT_SELF;
    effect eSleep = EffectSleep();
    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eLink = EffectLinkEffects(eSleep, eVis);
    int iTime = (d6(2));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(iTime));
}
