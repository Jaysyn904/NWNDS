// Shaqat beetle's Bloodsuck Attack - Item Unique OnHit Script
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
   int nConDrain = 1;
   int nSTR_Target;
   int nSTR_Creature;
   int nTickFull;
   effect eTickOn = EffectMovementSpeedIncrease(99);
   effect eTickOff = EffectMovementSpeedDecrease(99);
   effect eBloodSuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);

// Fine & smaller creatures cannot be attached to.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_DIMINUTIVE ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_FINE)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }

// Perform an opposed Strength check. If the target wins this check, it won't
// get entangled. To avoid ties, we do the rolling in a loop that breaks once
// the two results are NOT identical.
      do
      {
         nSTR_Target = GetAbilityScore(oTarget, ABILITY_STRENGTH) + d20();
         nSTR_Creature = 16 + GetAbilityScore(oPC, ABILITY_STRENGTH) + d20(); // Shaqat Beetle's get a +16 bonus to grapple checks.
      }
      while (nSTR_Target == nSTR_Creature);

// If the target wins, send a short message to it and return.
      if (nSTR_Target > nSTR_Creature)
      {
         FloatingTextStringOnCreature("You force the shaqat beetle to detach from your body.", oTarget);
         return;
      }

// Drain 1 point of CON.
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBloodSuck, oTarget);

// Increase the tick's speed so it can stay "attached" to it's victim
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOn, oPC);

// When the tick drains 8 CON worth of blood it will detach & run away.
      if (nTickFull >= 8)
      {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
        SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
        return;
      }

// Add CON loss to total drained
      nTickFull = nTickFull + nConDrain;

FloatingTextStringOnCreature("The shaqat beetle is draining your blood!", oTarget);

   }
