/************************************
*   Mind Blank                      *
*                                   *
*   Cost: 0                         *
*   Power Score: Wis                *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=0;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MIND_BLANK);
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_MIND);
    effect eLink=EffectImmunity(IMMUNITY_TYPE_CHARM);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectImmunity(IMMUNITY_TYPE_DOMINATE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MIND_BLANK)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_MIND_BLANK, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

