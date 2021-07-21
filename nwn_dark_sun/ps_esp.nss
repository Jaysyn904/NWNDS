/************************************
*   ESP                             *
*                                   *
*   Cost: 6                         *
*   Power Score: Wis -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=6;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_SILENCE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ESP);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ESP)) return;

    effect eLink=EffectSkillIncrease(SKILL_BLUFF, GetEnhancedEffect(10, FEAT_PSIONIC_ESP));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_INTIMIDATE, GetEnhancedEffect(10, FEAT_PSIONIC_ESP)));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_PERSUADE, GetEnhancedEffect(10, FEAT_PSIONIC_ESP)));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(5+nLevel);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));

}
