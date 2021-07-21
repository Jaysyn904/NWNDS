/************************************
*   See Invisibility                *
*                                   *
*   Cost: 9                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=9;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_MAGICAL_VISION);
    effect eLink=EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectSeeInvisible());
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SEE_INVISIBILITY);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SEE_INVISIBILITY)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

