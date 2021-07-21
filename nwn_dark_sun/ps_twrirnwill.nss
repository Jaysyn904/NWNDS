/************************************
*   Tower of Iron Will              *
*                                   *
*   Cost: 6                         *
*   Power Score: Wis -2             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=6;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_TOWER_OF_IRON_WILL);
    effect eVis=EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY);
    effect eLink=EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TOWER_OF_IRON_WILL)) return;

    int nDuration=GetEnhancedEffect(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_TOWER_OF_IRON_WILL, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

