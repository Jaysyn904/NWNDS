/************************************
*   Flesh Armor                     *
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
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_FLESH_ARMOR);
    effect eVis=EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    int nBonus=2+nLevel/2;
    if (nLevel>=10) nBonus=7;
    effect eLink=EffectACIncrease(nBonus, AC_NATURAL_BONUS);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_FLESH_ARMOR)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    RemoveEffectsFrom(oPC, SPELL_PSIONIC_FLESH_ARMOR);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_FLESH_ARMOR, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

