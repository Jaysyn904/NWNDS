/************************************
*   Summon Planar Energy (Negative) *
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
    effect eVis=EffectVisualEffect(VFX_FNF_SUMMON_EPIC_UNDEAD);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE);


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)) return;

    effect eLink=EffectDamage(GetEnhancedEffect(d12(3), FEAT_PSIONIC_SUMMON_PLANAR_ENERGY), DAMAGE_TYPE_NEGATIVE);

    if (GetRacialType(oTarget)==IP_CONST_RACIALTYPE_UNDEAD)
    {
        eLink=EffectHeal(GetEnhancedEffect(d12(3), FEAT_PSIONIC_SUMMON_PLANAR_ENERGY));
        eVis=EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget));
    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUMMON_PLANAR_ENERGY));

    if (!GetRacialType(oTarget)==IP_CONST_RACIALTYPE_UNDEAD &&
            !FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE, oPC))
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectNegativeLevel(GetEnhancedEffect(1, FEAT_PSIONIC_SUMMON_PLANAR_ENERGY)), oTarget);




}
