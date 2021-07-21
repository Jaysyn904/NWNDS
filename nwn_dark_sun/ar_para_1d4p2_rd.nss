//::///////////////////////////////////////////////
//:: Paralyze 1d4+2 Rounds
//:: AR_Para_1d4p2_Rd
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Induces Paralysis for 1d4+2 rounds
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
    int iTime = (d4(1));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(iTime+2));
}
