// Rock Cactus' Bloodsuck Attack - Item Unique OnHit Script
//

#include "nw_i0_spells"
//#include "x2_inc_spellhook"
#include "x2_inc_switches"

const int CREATURE_SIZE_DIMINUTIVE = 20;
const int CREATURE_SIZE_FINE = 21;
const int CREATURE_SIZE_GARGANTUAN = 22;
const int CREATURE_SIZE_COLOSSAL = 23;

void main()
    {
    object oPC = OBJECT_SELF;
    object oItem = GetSpellCastItem();
    object oTarget = GetSpellTargetObject();
    int nCreSTR = GetAbilityModifier(ABILITY_STRENGTH, oPC);
    int nThirst = GetLocalInt(oTarget,"nThirst");
    int nConDrain = d4(1);
    int nWaterLoss = d10(5);
    int nSTR_Target;
    int nSTR_Creature;
    int nTickFull;
    effect eTickOn = EffectMovementSpeedIncrease(99);
    effect eTickOff = EffectMovementSpeedDecrease(99);
    effect eBloodSuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);

    if (!nThirst)
        {
            SetLocalInt(oTarget, "nThirst", 0);
        }

// Fine & smaller creatures cannot be attached to.
    if (GetCreatureSize(oTarget) == CREATURE_SIZE_DIMINUTIVE ||
        GetCreatureSize(oTarget) == CREATURE_SIZE_FINE)
            {
                return;
            }
// Perform an opposed Strength check. If the target wins this check, it won't
// get entangled. To avoid ties, we do the rolling in a loop that breaks once
// the two results are NOT identical.
    do
        {
            nSTR_Target = GetAbilityScore(oTarget, ABILITY_STRENGTH) + d20();
            nSTR_Creature = 8 + GetAbilityScore(oPC, ABILITY_STRENGTH) + d20();  // Rock Cactus have a +8 racial bonus to grapple checks.
        }

    while (nSTR_Target == nSTR_Creature);

// If the target wins, send a short message to it and return.
    if (nSTR_Target > nSTR_Creature)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
            FloatingTextStringOnCreature("You force the rock cactus to detach from your body.", oTarget);
            return;
        }

// Drain 1d4 points of CON & run VFX.
    effect eBloodVis = EffectVisualEffect(VFX_COM_SPECIAL_WHITE_BLUE);
    effect eBloodsuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);
    eBloodsuck = ExtraordinaryEffect(eBloodsuck);

// Increase the rock cactus' speed so it can stay "attached" to it's victim
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOn, oPC);

// When the rock cactus drains 12 CON worth of blood it will detach.
      if (nTickFull >= 12)
        {
            FloatingTextStringOnCreature("Swollen with moisture, the rock cactus detaches.", oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
            SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
            return;
        }

// Add CON loss to total drained
    nTickFull = nTickFull + nConDrain;

// Increase Thirst Counter
    nThirst = nThirst + nWaterLoss;


    FloatingTextStringOnCreature("The rock cactus is draining your moisture!", oTarget);

   }
