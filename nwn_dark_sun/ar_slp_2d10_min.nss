//::///////////////////////////////////////////////
//:: Sleep 2d10 Minutes (turns)
//:: AR_Slp_2d10_Min
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Character is rendered unconscious for
    2-20 minutes (turns).
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
    int iTime = (d10(2));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(iTime));
}
