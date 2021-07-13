/************************************
*   Thought Shield                  *
*                                   *
*   Cost: 1                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=1;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_THOUGHT_SHIELD);
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    effect eLink=EffectImmunity(IMMUNITY_TYPE_CONFUSED);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectImmunity(IMMUNITY_TYPE_DAZED));
    eLink=EffectLinkEffects(eLink, EffectImmunity(IMMUNITY_TYPE_STUN));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_THOUGHT_SHIELD)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_THOUGHT_SHIELD, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

