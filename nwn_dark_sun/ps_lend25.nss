/************************************
*   Lend Health 25%                 *
*                                   *
*   Cost: 5                         *
*   Power Score: Con -1             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=5;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-1;
    int nHP=GetCurrentHitPoints(oPC)/4;
    effect eLink1=EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    eLink1=EffectLinkEffects(eLink1, EffectDamage(nHP));
    effect eLink2=EffectVisualEffect(VFX_IMP_HEALING_L);
    eLink2=EffectLinkEffects(eLink2, EffectHeal(nHP));
    object oTarget=GetSpellTargetObject();


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_LEND_HEALTH)) return;

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_LEND_HEALTH, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, oTarget);


}
