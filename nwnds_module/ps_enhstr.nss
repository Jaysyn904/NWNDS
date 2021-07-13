/************************************
*   Enhanced Strength               *
*                                   *
*   Cost: 18-Str                    *
*   Power Score: Wis -1             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=18-GetAbilityScore(oPC, ABILITY_STRENGTH);
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-1;
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_ODD);
    effect eLink=EffectAbilityIncrease(ABILITY_STRENGTH, 18-GetAbilityScore(oPC, ABILITY_STRENGTH));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_BLUR));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_ENHANCED_STRENGTH);

    if(GetAbilityScore(oPC, ABILITY_STRENGTH)>=18)
    {
        FloatingTextStringOnCreature("You are too strong to benefit from this power.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_ENHANCED_STRENGTH)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_ENHANCED_STRENGTH, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

