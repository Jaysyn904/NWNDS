//::///////////////////////////////////////////////
//:: Sleep 2d4 Days
//:: AR_Slp_2d4_Days
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Character is rendered unconscious for
    2d4 days!.
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
    int iTime = (d4(2));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(iTime*24));
}
