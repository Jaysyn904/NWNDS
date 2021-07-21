/************************************
*   Psychic Crush                   *
*                                   *
*   Cost: 7                         *
*   Power Score: Wis -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=7;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis=EffectVisualEffect(VFX_IMP_DOMINATE_S);
    effect eLink=EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    eLink=EffectLinkEffects(eLink, EffectSpellFailure(65));
    eLink=EffectLinkEffects(eLink, EffectMissChance(65));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSYCHIC_CRUSH);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSYCHIC_CRUSH)) return;

    int nDuration=GetEnhancedDuration(1+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_PSYCHIC_CRUSH, TRUE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

    if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMissChance(65), oTarget, RoundsToSeconds(nDuration));

    }
}
