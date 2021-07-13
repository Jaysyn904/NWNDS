/************************************
*   Ego Whip                        *
*                                   *
*   Cost: 4                         *
*   Power Score: Wis -3             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=4;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_BEAM_FIRE_LASH);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_EGO_WHIP);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_EGO_WHIP)) return;

    effect eLink=EffectSavingThrowDecrease(SAVING_THROW_ALL, GetEnhancedEffect(5, FEAT_PSIONIC_EGO_WHIP));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, EffectAttackDecrease(GetEnhancedEffect(5, FEAT_PSIONIC_EGO_WHIP)));
    eLink=EffectLinkEffects(eLink, EffectSkillDecrease(SKILL_ALL_SKILLS, GetEnhancedEffect(5, FEAT_PSIONIC_EGO_WHIP)));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(1+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_EGO_WHIP, TRUE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 1.6);

    if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

}
