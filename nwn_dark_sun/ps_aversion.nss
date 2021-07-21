/************************************
*   Aversion                        *
*                                   *
*   Cost: 12                        *
*   Power Score: Wis -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eLink=EffectLinkEffects(eVis, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, EffectFrightened());
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_AVERSION);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_AVERSION)) return;

    int nDuration=GetEnhancedDuration(2+nLevel);

    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_PSIONIC_AVERSION));

    if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
    }

}
