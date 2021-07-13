/************************************
*   Regenerate                      *
*                                   *
*   Cost: 24                        *
*   Power Score: Con -4             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=24;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-4;
    effect eVis=EffectVisualEffect(VFX_DUR_PARALYZED);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_REGENERATE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_REGENERATE)) return;

    effect eLink=EffectRegenerate(GetEnhancedEffect(2, FEAT_PSIONIC_REGENERATE), 6.0);
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_REGENERATE, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}
