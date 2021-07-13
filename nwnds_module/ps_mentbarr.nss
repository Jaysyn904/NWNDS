/************************************
*   Mental Barrier                  *
*                                   *
*   Cost: 3                         *
*   Power Score: Wis -2             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=3;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MENTAL_BARRIER);
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MENTAL_BARRIER)) return;

    effect eLink=EffectSavingThrowIncrease(SAVING_THROW_WILL, GetEnhancedEffect(nLevel, FEAT_PSIONIC_MENTAL_BARRIER));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_MENTAL_BARRIER, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

