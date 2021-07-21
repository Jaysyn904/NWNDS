//::///////////////////////////////////////////////
//:: Sleep 1 Minute (turn)
//:: AR_Slp_1_Minute
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Character is rendered unconscious for
    1 minute (turn).
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
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(10));
}
