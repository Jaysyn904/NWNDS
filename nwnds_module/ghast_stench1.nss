//::
//:: Ghast_stench1
//::
//:: A pnp version of the Ghast's sickening stench.
//:: Aura OnEnter script
//::
//:: Modified by: DM Heatstroke 01-20-11
//::

#include "NW_I0_SPELLS"

void main()
{
    object oTarget = GetEnteringObject();
    object oCaster = GetAreaOfEffectCreator();

    int nLevel = GetHitDice(oCaster);
    int nDC = 10 + nLevel / 2 + GetAbilityModifier(ABILITY_CHARISMA,oCaster);

    float fDuration = TurnsToSeconds(d6()+4);
    string sImmune = "GHAST_IMMUNE";

    if ( !GetIsEnemy(oTarget,oCaster) ||
          oTarget == oCaster ||
          GetIsImmune(oTarget, IMMUNITY_TYPE_POISON) ||
          GetLocalInt(oTarget, sImmune) )

    return;

    //:: Setup Sickening effect
    effect eSick1 = EffectAttackDecrease(2);
    effect eSick2 = EffectDamageDecrease(2,DAMAGE_TYPE_MAGICAL);
    effect eSick3 = EffectSavingThrowDecrease(SAVING_THROW_ALL, 2, SAVING_THROW_TYPE_ALL);
    effect eSick4 = EffectSkillDecrease(SKILL_ALL_SKILLS, 2);

    //:: Setup visuals
    effect eImp = EffectVisualEffect(VFX_IMP_POISON_S);
    effect eVis1 = EffectVisualEffect(VFX_DUR_FLIES);
    effect eVis2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

    //:: Setup EffectLink
    effect eSick = EffectLinkEffects(eSick1, eSick2);
    eSick = EffectLinkEffects(eSick, eSick3);
    eSick = EffectLinkEffects(eSick, eSick4);
    eSick = EffectLinkEffects(eSick, eVis1);
    eSick = EffectLinkEffects(eSick, eVis2);
    eSick = ExtraordinaryEffect(eSick);

    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_POISON, oCaster) )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSick, oTarget, fDuration);
    }
    else
    {
        SetLocalInt(oTarget, sImmune, 1);
    }

}
