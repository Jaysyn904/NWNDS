/************************************
*   Sensory Suppression             *
*                                   *
*   Cost: 8                         *
*   Power Score: Int -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=8;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SENSORY_SUPPRESSION);
    object oTarget=GetSpellTargetObject();
    effect eVis=EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eLink=EffectBlindness();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, EffectDeaf());
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SENSORY_SUPPRESSION)) return;

    int nDuration=GetEnhancedDuration(2+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SENSORY_SUPPRESSION, TRUE));

    if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

}
