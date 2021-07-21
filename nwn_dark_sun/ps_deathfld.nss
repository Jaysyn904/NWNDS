/************************************
*   Death Field                     *
*                                   *
*   Cost: 40                        *
*   Power Score: Con -6             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=40;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-6;
    effect eVis=EffectVisualEffect(VFX_IMP_DISEASE_S);
    eVis=EffectLinkEffects(eVis, EffectDamage(GetCurrentHitPoints(oPC)/2, DAMAGE_TYPE_NEGATIVE));
    effect eLink=EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_AURA_DISEASE));
    eLink=EffectLinkEffects(eLink, EffectAreaOfEffect(AOE_PSIONIC_DEATH_FIELD));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DEATH_FIELD);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DEATH_FIELD)) return;

    int nDuration=GetEnhancedDuration(2+nLevel/2);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    TransferEnhancements(GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT));

}
