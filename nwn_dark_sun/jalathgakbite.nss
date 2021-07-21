// Jalath'gak Blood Drain Attack - Item Unique OnHit Script
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
   int nConDrain = d6(1);
   int nSTR_Target;
   int nSTR_Creature;
   int nTickFull;
   effect eTickOn = EffectMovementSpeedIncrease(99);
   effect eTickOff = EffectMovementSpeedDecrease(99);
   effect eBloodSuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);

// Tiny & smaller creatures cannot be attached to.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_TINY ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_DIMINUTIVE ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_FINE)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }
// Drain 1d6 points of CON.
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBloodSuck, oTarget);

// Increase the tick's speed so it can stay "attached" to it's victim
//    ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOn, oPC);

// When the tick drains 32 CON worth of blood it will detach & run away.
      if (nTickFull >= 32)
      {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
        SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
        return;
      }

// Add CON loss to total drained
      nTickFull = nTickFull + nConDrain;

FloatingTextStringOnCreature("The jalath'gak is draining your blood!", oTarget);

   }
