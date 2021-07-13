/************************************
*   Object Reading                  *
*                                   *
*   Cost: 8                         *
*   Power Score: Int -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=8;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_MAGICAL_VISION);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_OBJECT_READING);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_OBJECT_READING)) return;

    effect eLink=EffectSkillIncrease(SKILL_APPRAISE, GetEnhancedEffect(10, FEAT_PSIONIC_OBJECT_READING));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_LORE, GetEnhancedEffect(10, FEAT_PSIONIC_OBJECT_READING)));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(5+nLevel);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));

}
