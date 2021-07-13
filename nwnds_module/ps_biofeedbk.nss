/************************************
*   Biofeedback                     *
*                                   *
*   Cost: 10                        *
*   Power Score: Con -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=10;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    effect eVis=EffectVisualEffect(VFX_IMP_DEATH_WARD);
    effect eLink=EffectACIncrease(1, AC_NATURAL_BONUS);
    eLink=EffectLinkEffects(eLink, EffectDamageReduction(5, DAMAGE_POWER_PLUS_TWENTY));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_BIOFEEDBACK);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_BIOFEEDBACK)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    RemoveEffectsFrom(oPC, SPELL_PSIONIC_BIOFEEDBACK);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));

}
