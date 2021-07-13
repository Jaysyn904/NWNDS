/************************************
*   Inflict Pain                    *
*                                   *
*   Cost: 8                         *
*   Power Score: Con -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=8;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-4;
    effect eVis=EffectVisualEffect(VFX_IMP_SILENCE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_INFLICT_PAIN);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_INFLICT_PAIN)) return;

    effect eLink=EffectAttackDecrease(GetEnhancedEffect(4, FEAT_PSIONIC_INFLICT_PAIN));
    eLink=EffectLinkEffects(eLink, EffectDamageDecrease(GetEnhancedEffect(4, FEAT_PSIONIC_INFLICT_PAIN)));
    eLink=EffectLinkEffects(eLink, EffectACDecrease(GetEnhancedEffect(4, FEAT_PSIONIC_INFLICT_PAIN)));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(2+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_INFLICT_PAIN, TRUE));

    if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
        AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM, 1.7));
    }
}
