/************************************
*   Clairvoyance/Clairaudience      *
*                                   *
*   Cost: 6                         *
*   Power Score: Wis -1             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=6;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-1;
    effect eVis=EffectVisualEffect(VFX_IMP_MAGICAL_VISION);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CLAIRVOYANCE_CLAIRAUDIENCE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CLAIRVOYANCE_CLAIRAUDIENCE)) return;

    effect eLink=EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_SPOT, GetEnhancedEffect(10, FEAT_PSIONIC_CLAIRVOYANCE_CLAIRAUDIENCE)));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_LISTEN, GetEnhancedEffect(10, FEAT_PSIONIC_CLAIRVOYANCE_CLAIRAUDIENCE)));
    eLink=EffectLinkEffects(eLink, EffectSkillIncrease(SKILL_SEARCH, GetEnhancedEffect(10, FEAT_PSIONIC_CLAIRVOYANCE_CLAIRAUDIENCE)));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);


    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

