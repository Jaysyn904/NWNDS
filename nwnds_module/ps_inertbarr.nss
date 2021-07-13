/************************************
*   Inertial Barrier                *
*                                   *
*   Cost: 7                         *
*   Power Score: Con -3             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=7;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    effect eVis=EffectVisualEffect(VFX_DUR_GLOBE_MINOR);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    effect eLink=EffectDamageImmunityIncrease(DAMAGE_TYPE_SLASHING, 20);
    eLink=EffectLinkEffects(eVis, eLink);
    eLink=EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_BLUDGEONING, 20), eLink);
    eLink=EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 30), eLink);
    eLink=EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_ACID, 30), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_INERTIAL_BARRIER);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_INERTIAL_BARRIER)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));

}
