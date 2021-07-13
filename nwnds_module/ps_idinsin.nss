/************************************
*   Id Insinuation                  *
*                                   *
*   Cost: 5                         *
*   Power Score: Wis -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=5;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis=EffectVisualEffect(VFX_BEAM_MIND);
    effect eLink=EffectStunned();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_IMP_STUN));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ID_INSINUATION);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ID_INSINUATION)) return;

    int nDuration=GetEnhancedDuration(4);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_ID_INSINUATION, TRUE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 1.6);

    if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

}
