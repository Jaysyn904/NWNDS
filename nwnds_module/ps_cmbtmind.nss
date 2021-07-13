/************************************
*   Combat Mind                     *
*                                   *
*   Cost: 9                         *
*   Power Score: Int -2             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=9;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_COMBAT_MIND);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_COMBAT_MIND)) return;

    effect eLink=EffectLinkEffects(EffectACIncrease(GetEnhancedEffect(2, FEAT_PSIONIC_COMBAT_MIND)), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, GetEnhancedEffect(2, FEAT_PSIONIC_COMBAT_MIND)), eLink);
    eLink=EffectLinkEffects(EffectAttackIncrease(GetEnhancedEffect(2, FEAT_PSIONIC_COMBAT_MIND)), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    RemoveEffectsFrom(oPC, SPELL_PSIONIC_COMBAT_MIND);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_COMBAT_MIND, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

}
