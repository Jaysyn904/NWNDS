/************************************
*   Hallucinations                  *
*                                   *
*   Cost: 20                        *
*   Power Score: Int -3             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=20;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_SONIC);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_DEATH));
    effect eLink=EffectDeath();
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_HALLUCINATIONS);
    int nDamage = d6(3);
    object oTarget=GetSpellTargetObject();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_HALLUCINATIONS)) return;

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_HALLUCINATIONS, TRUE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

    if(GetIsImmune(oTarget, IMMUNITY_TYPE_MIND_SPELLS, oPC)) return;

    else if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);

    else ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget);

}
