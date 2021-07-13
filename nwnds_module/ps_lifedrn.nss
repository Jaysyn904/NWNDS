/************************************
*   Life Draining                   *
*                                   *
*   Cost: 9                         *
*   Power Score: Con -3             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=11;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_LIFE_DRAINING);
    effect eVis1=EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eVis2=EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_LIFE_DRAINING)) return;

    int nDamage = GetEnhancedEffect(d6()+nLevel, FEAT_PSIONIC_LIFE_DRAINING);
    effect eLink1=EffectHeal(nDamage);
    eLink1=EffectLinkEffects(eLink1, eVis1);
    effect eLink2=EffectDamage(nDamage);
    eLink2=EffectLinkEffects(eLink2, eVis2);


    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_LIFE_DRAINING, TRUE));

    if (nTargRace==RACIAL_TYPE_UNDEAD)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, oPC);
    }

    else if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, oTarget);
    }

}
