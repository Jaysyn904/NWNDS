/************************************
*   Mind Whipe                      *
*                                   *
*   Cost: 16                        *
*   Power Score: Int -6             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-6;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MIND_WHIPE);
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MIND_WHIPE)) return;

    effect eLink=EffectAbilityDecrease(ABILITY_INTELLIGENCE, GetEnhancedEffect(2, FEAT_PSIONIC_MIND_WHIPE));
    eLink=EffectLinkEffects(eLink, EffectAbilityDecrease(ABILITY_WISDOM, GetEnhancedEffect(2, FEAT_PSIONIC_MIND_WHIPE)));
    eLink=EffectLinkEffects(eLink, EffectNegativeLevel(GetEnhancedEffect(2, FEAT_PSIONIC_MIND_WHIPE)));
    eLink=ExtraordinaryEffect(eLink);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_MIND_WHIPE, TRUE));

    if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
    }

}
