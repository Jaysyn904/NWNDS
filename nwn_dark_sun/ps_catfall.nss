/************************************
*   Catfall                         *
*                                   *
*   Cost: 8                         *
*   Power Score: Con -1             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=8;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-1;
    effect eVis=EffectVisualEffect(VFX_IMP_HASTE);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_HOLY_AID));
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CATFALL);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CATFALL)) return;

    effect eLink=EffectImmunity(IMMUNITY_TYPE_KNOCKDOWN);
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_TUMBLE, GetEnhancedEffect(5, FEAT_PSIONIC_CATFALL)));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));

}
