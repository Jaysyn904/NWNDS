/************************************
*   Psionic Blast                   *
*                                   *
*   Cost: 10                        *
*   Power Score: Wis -5             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=10;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-5;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSIONIC_BLAST);
    object oTarget=GetSpellTargetObject();
    effect eVis=EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_HOLY);
    effect eLink=EffectSlow();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_IMP_SLOW));
    eLink=ExtraordinaryEffect(eLink);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);
    int nDamage=GetCurrentHitPoints(oTarget)/5;
    if (nDamage<1) nDamage=1;

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSIONIC_BLAST)) return;

    int nDuration=GetEnhancedDuration(1+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_PSIONIC_BLAST, TRUE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

    if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget);
    }
}
