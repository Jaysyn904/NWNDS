/************************************
*   Intellect Fortress              *
*                                   *
*   Cost: 4                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=4;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_INTELLECT_FORTRESS);
    effect eVis=EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_INTELLECT_FORTRESS)) return;

    effect eLink=EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    eLink=EffectLinkEffects(eLink, EffectSavingThrowIncrease(SAVING_THROW_ALL, GetEnhancedEffect(nLevel/2, FEAT_PSIONIC_INTELLECT_FORTRESS), SAVING_THROW_TYPE_MIND_SPELLS));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_AURA_COLD));
    eLink=EffectLinkEffects(eLink, EffectAreaOfEffect(AOE_PSIONIC_INTELLECT_FORTRESS));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    TransferEnhancements(GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT));
}
