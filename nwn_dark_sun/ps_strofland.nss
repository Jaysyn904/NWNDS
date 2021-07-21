/************************************
*   Strength of the Land            *
*                                   *
*   Cost: 18                        *
*   Power Score: Con -2             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=18;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_AC_BONUS);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_TORNADO));
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_STRENGTH_OF_LAND);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_STRENGTH_OF_LAND)) return;

    effect eLink=EffectTemporaryHitpoints(GetEnhancedEffect(25, FEAT_PSIONIC_STRENGTH_OF_LAND));
    eLink=EffectLinkEffects(eLink, EffectAttackIncrease(GetEnhancedEffect(3, FEAT_PSIONIC_STRENGTH_OF_LAND)));
    eLink=EffectLinkEffects(eLink, EffectDamageIncrease(GetEnhancedEffect(3, FEAT_PSIONIC_STRENGTH_OF_LAND)));
    eLink=EffectLinkEffects(eLink, EffectSpellResistanceIncrease(GetEnhancedEffect(5, FEAT_PSIONIC_STRENGTH_OF_LAND)));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel/2);

    RemoveEffectsFrom(oPC, SPELL_PSIONIC_STRENGTH_OF_LAND);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_STRENGTH_OF_LAND, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

