//::///////////////////////////////////////////////
//:: Paralyze 2d4 Rounds
//:: AR_Para_2d4_Rds
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Induces Paralysis for 2d4 rounds
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 11, 2012
//:://////////////////////////////////////////////

void main()
{
    object oTarget = OBJECT_SELF;
    effect eParal = EffectParalyze();
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    effect eLink = EffectLinkEffects(eParal, eLink);
    int iTime = (d4(2));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(iTime));
}
