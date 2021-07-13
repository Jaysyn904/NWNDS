/************************************
*   Time Shift                      *
*                                   *
*   Cost: 16                        *
*   Power Score: Int -2                *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-2;
    effect eVis=EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MAJOR);
    effect eLink=EffectCutsceneGhost();
    eLink=EffectLinkEffects(eLink, EffectEthereal());
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_ACID, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_COLD, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_DIVINE, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_ELECTRICAL, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_MAGICAL, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_POSITIVE, 100));
    eLink=EffectLinkEffects(eLink, EffectDamageImmunityIncrease(DAMAGE_TYPE_SONIC, 100));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_TIME_SHIFT);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TIME_SHIFT)) return;

    int nDuration=GetEnhancedDuration(3);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_TIME_SHIFT, FALSE));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oPC));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));
}

