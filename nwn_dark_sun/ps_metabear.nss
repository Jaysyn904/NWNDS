/************************************
*   Metamorphosis (Bear)            *
*                                   *
*   Cost: 25                        *
*   Power Score: Con -6             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=25;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-6;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_METAMORPHOSIS);
    effect eVis=EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect eLink=EffectPolymorph(POLYMORPH_TYPE_BROWN_BEAR);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_METAMORPHOSIS)) return;

    int nDuration=GetEnhancedDuration(nLevel/2);

    RemoveEffectsFrom(oPC, SPELL_PSIONIC_ENHANCED_STRENGTH);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_METAMORPHOSIS, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

