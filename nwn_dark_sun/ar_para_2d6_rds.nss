//::///////////////////////////////////////////////
//:: Paralyze 2d6 Rounds
//:: AR_Para_2d6_Rds
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Induces Paralysis for 2d6 rounds
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 12, 2012
//:://////////////////////////////////////////////

void main()
{
    object oTarget = OBJECT_SELF;
    effect eParal = EffectParalyze();
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    effect eLink = EffectLinkEffects(eParal, eLink);
    int iTime = (d6(2));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(iTime));
}
