/************************************
*   Ectoplasmic Form                *
*                                   *
*   Cost: 18                        *
*   Power Score: Con -4             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=18;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-4;
    effect eVis=EffectVisualEffect(VFX_DUR_GHOST_SMOKE);
    effect eLink=EffectCutsceneGhost();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectEthereal());
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ECTOPLASMIC_FORM);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ECTOPLASMIC_FORM)) return;

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_ECTOPLASMIC_FORM, FALSE));

    int nDuration=GetEnhancedDuration(nLevel+5);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));
}

