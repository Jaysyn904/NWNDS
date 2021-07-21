/************************************
*   Chameleon Power                 *
*                                   *
*   Cost: 12                        *
*   Power Score: Con -1             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-1;
    effect eVis=EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CHAMELEON_POWER);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CHAMELEON_POWER)) return;

    effect eLink=EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE);
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_HIDE, GetEnhancedEffect(10, FEAT_PSIONIC_CHAMELEON_POWER)));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_MOVE_SILENTLY, GetEnhancedEffect(10, FEAT_PSIONIC_CHAMELEON_POWER)));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

