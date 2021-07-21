//::
//:: Fire_Infusion
//::
//:: A pnp version of the Fire Krag's elemental infusion attack.
//::
//:: Modified by: DM Heatstroke 02-07-12
//::

/*
Elemental Infusion (Su): The victim of a krag’s bite must make
a  Fortitude save ( DC 18) or become cursed with a painful and fast-spreading
elemental transformation. The creature suffers  1d6
points of damage per round until it dies or is cured. The type of
damage varies by krag: acid damage for earth and silt; cold
damage for water; electricity damage for air and rain; and fire
damage for fire, magma, and sun. A remove curse  or  heal  spell stops
the infusion. The save  DC is Charisma-based.
*/

/*
I think those spells should be affected by this ability - duration will be decreased with every HB
SPELL_PROTECTION_FROM_ELEMENTS
SPELL_ELEMENTAL_SHIELD
SPELL_ENDURE_ELEMENTS
SPELL_ENERGY_BUFFER
SPELL_RESIST_ELEMENTS

I'm almost sure this one is checked in MySavingThrow()
FEAT_DRAGON_IMMUNE_FIRE

And I'm pretty sure creatures will die from damage, so do you really need that kill check?

*/

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

int GetIsImmuneToInfusion(object oTarget, int nDamage)
{
    if(nDamage == DAMAGE_TYPE_ACID)
    {
        return GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ACID_10, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ACID_9, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ACID_8, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ACID_7, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ACID_6, oTarget);
    }
    else if(nDamage == DAMAGE_TYPE_COLD)
    {
        return GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_COLD_10, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_COLD_9, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_COLD_8, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_COLD_7, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_COLD_6, oTarget);
    }
    else if(nDamage == DAMAGE_TYPE_ELECTRICAL)
    {
        return GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ELECTRICAL_10, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ELECTRICAL_9, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ELECTRICAL_8, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ELECTRICAL_7, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_ELECTRICAL_6, oTarget);
    }
    else if(nDamage == DAMAGE_TYPE_FIRE)
    {
        return GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_FIRE_10, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_FIRE_9, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_FIRE_8, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_FIRE_7, oTarget)
             || GetHasFeat(FEAT_EPIC_ENERGY_RESISTANCE_FIRE_6, oTarget)
             || GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oTarget);
    }
    return FALSE;
}

void DoBurn(object oCaster, object oTarget, int nDamage, int nSaveType, int nVfx)
{
    if(!GetIsObjectValid(oTarget) || !GetIsObjectValid(oCaster))
        return;

    if(GetIsImmuneToInfusion(oTarget, nDamage))
    {
        DeleteLocalInt(oTarget, "krags_infusion");
        return;
    }

    if(GetLocalInt(oTarget,"krags_infusion"))
    {
        // Normally Elemental Infusion can only be removed by Remove Curse or Heal, not by
        // making saving throws
        if(GetGameDifficulty() < GAME_DIFFICULTY_CORE_RULES && GetIsPC(oTarget))
        {
            if(MySavingThrow(SAVING_THROW_FORT, oTarget, 18, nSaveType))
            {
                DeleteLocalInt(oTarget, "krags_infusion");
                SendMessageToPC(oTarget,"Recovered from Krag's Infusion.");
            }
            else
            {
                //Apply damage for this round
                effect eBurn = EffectDamage(d6(), nDamage, DAMAGE_POWER_ENERGY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVfx), oTarget);
                DelayCommand(6.0f, DoBurn(oCaster, oTarget, nDamage, nSaveType, nVfx));
            }
        }
        else//apply damage without saving throw
        {
            int nDam = d6();
            if((GetCurrentHitPoints(oTarget) - nDam) < -9)
            {
                effect eHP = EffectDamage( 9999 , DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
                effect eDeath = EffectDeath();
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVfx), oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP,oTarget);
            }
            else
            {
                //Apply damage for this round
                effect eBurn = EffectDamage(d6(), nDamage, DAMAGE_POWER_ENERGY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVfx), oTarget);
                DelayCommand(6.0f, DoBurn(oCaster, oTarget, nDamage, nSaveType, nVfx));
            }
        }
    }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;
    string sDamage = GetLocalString(oCaster, "KragType");

    int nDamage, nSaveType, nVfx;
    if(sDamage == "acid")
    {
        nDamage   = DAMAGE_TYPE_ACID;
        nSaveType = SAVING_THROW_TYPE_ACID;
        nVfx      = VFX_IMP_ACID_S;
    }
    else if(sDamage == "cold")
    {
        nDamage   = DAMAGE_TYPE_COLD;
        nSaveType = SAVING_THROW_TYPE_COLD;
        nVfx      = VFX_IMP_FROST_S;
    }
    else if(sDamage == "electricity")
    {
        nDamage   = DAMAGE_TYPE_ELECTRICAL;
        nSaveType = SAVING_THROW_TYPE_ELECTRICITY;
        nVfx      = VFX_IMP_LIGHTNING_S;
    }
    else //if(sDamage == "fire")
    {
        nDamage   = DAMAGE_TYPE_FIRE;
        nSaveType = SAVING_THROW_TYPE_FIRE;
        nVfx      = VFX_IMP_FLAME_S;
    }

    if(!GetLocalInt(oTarget, "krags_infusion") && !GetIsImmuneToInfusion(oTarget, nDamage))
    {
        if(!MySavingThrow(SAVING_THROW_FORT, oTarget, 18, nSaveType))
        {
            SetLocalInt(oTarget, "krags_infusion", 1);
            //Apply damage for first round
            effect eBurn = EffectDamage(d6(), nDamage, DAMAGE_POWER_ENERGY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVfx), oTarget);
            //start pseudo heartbeat
            DelayCommand(6.0f, DoBurn(oCaster, oTarget, nDamage, nSaveType, nVfx));
        }
    }
}
