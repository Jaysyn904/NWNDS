/************************************
*   Ballistic Attack                *
*                                   *
*   Cost: 5                         *
*   Power Score: Con -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=5;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_BALLISTIC_ATTACK);
    effect eVis=EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE);
    object oTarget=GetSpellTargetObject();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_BALLISTIC_ATTACK)) return;

    effect eLink=EffectLinkEffects(eVis,EffectVisualEffect(VFX_COM_HIT_FROST));
    eLink=EffectLinkEffects(eLink, EffectDamage(GetEnhancedEffect(d6()+nLevel, FEAT_PSIONIC_BALLISTIC_ATTACK), DAMAGE_TYPE_BLUDGEONING, (nLevel/7)));
    eLink=ExtraordinaryEffect(eLink);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_BALLISTIC_ATTACK));

    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget));


}
