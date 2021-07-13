//::
//:: tliz_aura1
//::
//:: A pnp version of the T'liz's Fear & Unnatural Aura.
//::
//:: Modified by: DM Heatstroke 01-25-11
//::

#include "NW_I0_SPELLS"

void main()
{
    //:: Declare major variables
    object oTarget = GetEnteringObject();
    object oCaster = GetAreaOfEffectCreator();

    string sImmune = GetName(oCaster)+"_AURA_IMMUNE";

    int nDuration = d4(2)+2;
    int nRacial = GetRacialType(oTarget);
    int nLvl = GetHitDice(oTarget);
    int nHD = GetHitDice(oCaster);
    int nChaMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
    int nDC = 10 + nChaMod + nHD/2;
    int nCasterSeed = GetLocalInt(oCaster, sImmune);
    int nTargetSeed = GetLocalInt(oTarget, sImmune);


    //:: Setup visuals
    effect eVis1 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eVis2 = EffectVisualEffect(1965); //:: HGVFX_DUR_HALO_PURPLE

    //:: Setup Panic conditions for animals & those with less than 5 HD
    effect ePanic = EffectFrightened();
    effect ePanicSave = EffectSavingThrowDecrease(SAVING_THROW_ALL, 2);
    effect ePanicSkill = EffectSkillDecrease(SKILL_ALL_SKILLS, 2);
    effect ePanicLink = EffectLinkEffects(eVis1, ePanic);
    ePanicLink = EffectLinkEffects(ePanicSkill, ePanicSave);

    //:: Setup Shaken conditions for those with fewer HD than the T'liz
    effect eShakenSave = EffectSavingThrowDecrease(SAVING_THROW_ALL, 2);
    effect eShakenSkill = EffectSkillDecrease(SKILL_ALL_SKILLS, 2);
    effect eShakenAB = EffectAttackDecrease(2);
    effect eShakenLink = EffectLinkEffects(eVis2, eShakenSave);
    eShakenLink = EffectLinkEffects(eShakenAB, eShakenSkill);

    /*if (nTargetSeed |= 0 && nTargetSeed == nCasterSeed)
        {
            return;
        }*/

    //:: Animals get no save
    if (nRacial == RACIAL_TYPE_ANIMAL && !GetIsDead(oTarget))
        {
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(GetAreaOfEffectCreator(), SPELLABILITY_AURA_UNNATURAL));

            //Apply the VFX impact and effects
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePanicLink, oTarget, RoundsToSeconds(nDuration));
            //:: Debug
            FloatingTextStringOnCreature("Triggered Unnatural Aura", oTarget, FALSE);
            return;

        }

    if (GetIsEnemy(oTarget) && !GetIsDead(oTarget))
        {
            if (nLvl <= 5)
            {
                if (!MySavingThrow(SAVING_THROW_WILL, oTarget, nDC, SAVING_THROW_TYPE_FEAR))
                    {
                        //Apply the VFX impact and effects
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePanicLink, oTarget, RoundsToSeconds(nDuration));
                        SetLocalInt(oTarget, sImmune, nCasterSeed);
                        //:: Debug
                        FloatingTextStringOnCreature("Triggered Low Fear Aura", oTarget, FALSE);

                    }
            }

            else if (nLvl >= 6 && nLvl < nHD)
            {
                if (!MySavingThrow(SAVING_THROW_WILL, oTarget, nDC, SAVING_THROW_TYPE_FEAR))
                    {
                        //Apply the VFX impact and effects
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShakenLink, oTarget, RoundsToSeconds(nDuration));
                        SetLocalInt(oTarget, sImmune, nCasterSeed);
                        //:: Debug
                        FloatingTextStringOnCreature("Triggered High Fear Aura", oTarget, FALSE);
                    }
            }
        SetLocalInt(oTarget, sImmune, nCasterSeed);

        }

}
