/************************************
*   Daydream                        *
*                                   *
*   Cost: 9                         *
*   Power Score: Wis                *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=9;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM);
    effect eVis=EffectVisualEffect(VFX_DUR_SANCTUARY);
    effect eLink=EffectConfused();
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DAYDREAM);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DAYDREAM)) return;

    int nDuration=GetEnhancedDuration(4+nLevel);

    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_PSIONIC_DAYDREAM));

    if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_CONFUSION_S), oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

    }

}
