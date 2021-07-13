/************************************
*   Wrench                          *
*                                   *
*   Cost: 15                        *
*   Power Score: Wis -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=15;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_WRENCH);
    effect eVis=EffectVisualEffect(VFX_IMP_DISPEL);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (GetRacialType(oTarget)!=RACIAL_TYPE_UNDEAD && GetRacialType(oTarget)!=RACIAL_TYPE_OUTSIDER
        && GetRacialType(oTarget)!=RACIAL_TYPE_ELEMENTAL)
    {
        FloatingTextStringOnCreature("This power only affects extraplanar creatures and undead", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_WRENCH)) return;

    effect eLink=EffectTurnResistanceDecrease(GetEnhancedEffect(nLevel/2, FEAT_PSIONIC_WRENCH));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, EffectACDecrease(GetEnhancedEffect(d6(2), FEAT_PSIONIC_WRENCH)));
    eLink=EffectLinkEffects(eLink, EffectSpellResistanceDecrease(GetEnhancedEffect(d6(2), FEAT_PSIONIC_WRENCH)));
    eLink=EffectLinkEffects(eLink, EffectSavingThrowDecrease(SAVING_THROW_ALL, GetEnhancedEffect(d6(2), FEAT_PSIONIC_WRENCH)));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(1+nLevel);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_WRENCH, TRUE));

    if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
    }

}
