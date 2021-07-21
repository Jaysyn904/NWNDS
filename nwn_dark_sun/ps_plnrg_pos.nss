/************************************
*   Summon Planar Energy (Positive) *
*                                   *
*   Cost: 16                        *
*   Power Score: Int                *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY);
    effect eVis=EffectVisualEffect(VFX_COM_HIT_DIVINE);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE);
    int nDamage=(GetRacialType(oTarget)==IP_CONST_RACIALTYPE_UNDEAD?2*d12(3):d12(3));

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)) return;

    effect eLink=EffectDamage(GetEnhancedEffect(nDamage, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY), DAMAGE_TYPE_POSITIVE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);
    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUMMON_PLANAR_ENERGY));


}
