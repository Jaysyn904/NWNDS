/************************************
*   Attraction                      *
*                                   *
*   Cost: 12                        *
*   Power Score: Wis -4             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis=EffectVisualEffect(VFX_IMP_CHARM);
    effect eLink=EffectLinkEffects(EffectCharmed(), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ATTRACTION);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ATTRACTION)) return;

    int nDuration=GetEnhancedDuration(nLevel+1);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_ATTRACTION, FALSE));

    if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
    }

}
