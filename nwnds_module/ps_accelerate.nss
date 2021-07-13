/************************************
*   Accelerate                      *
*                                   *
*   Cost: 20                        *
*   Power Score: Con -2             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=20;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_HASTE);
    effect eLink=EffectLinkEffects(EffectHaste(), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ACCELERATE);
    int nDuration=nLevel;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ACCELERATE)) return;

    nDuration=GetEnhancedDuration(nDuration);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

}
