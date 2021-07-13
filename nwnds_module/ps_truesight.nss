/************************************
*   True Sight                      *
*                                   *
*   Cost: 15                        *
*   Power Score: Wis -4             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=15;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis=EffectVisualEffect(VFX_DUR_PROT_PREMONITION);
    effect eLink=EffectTrueSeeing();
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_TRUE_SIGHT);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TRUE_SIGHT)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_TRUE_SIGHT, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));

}
