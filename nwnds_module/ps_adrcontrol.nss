/************************************
*   Adrenaline Control              *
*                                   *
*   Cost: 12                        *
*   Power Score: Con -2             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    effect eVis=EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MINOR);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ADRENALINE_CONTROL);
    int nDuration=nLevel;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ADRENALINE_CONTROL)) return;

    effect eLink=EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, GetEnhancedEffect(d4(), FEAT_PSIONIC_ADRENALINE_CONTROL)), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, GetEnhancedEffect(d4(), FEAT_PSIONIC_ADRENALINE_CONTROL)), eLink);
    eLink=EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, GetEnhancedEffect(d4(), FEAT_PSIONIC_ADRENALINE_CONTROL)), eLink);
    eLink=ExtraordinaryEffect(eLink);
    nDuration=GetEnhancedDuration(nDuration);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);


}
