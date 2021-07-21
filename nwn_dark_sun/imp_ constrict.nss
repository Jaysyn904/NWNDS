// Improved Constriction Attack - Item Unique OnHit Script
//

#include "nw_i0_spells"
//#include "x2_inc_spellhook"
#include "x2_inc_switches"

const int CREATURE_SIZE_GARGANTUAN = 22;
const int CREATURE_SIZE_COLOSSAL = 23;

void main()
{

   object oPC = OBJECT_SELF;
   object oItem = GetSpellCastItem();
   object oTarget = GetSpellTargetObject();
   int nCreSTR = GetAbilityModifier(ABILITY_STRENGTH, oPC);
   effect eGrabDmg = EffectDamage(d6(2)+nCreSTR, DAMAGE_TYPE_BLUDGEONING);
   int nSTR_Target;
   int nSTR_Creature;

// Huge & larger creatures cannot be constricted.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_HUGE ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_GARGANTUAN ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_COLOSSAL)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }
// Deal 2d6+7 bludgeoning damage.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eGrabDmg, oTarget);
// Perform an opposed Strength check. If the target wins this check, it won't
// get entangled. To avoid ties, we do the rolling in a loop that breaks once
// the two results are NOT identical.
      do
      {
         nSTR_Target = GetAbilityScore(oTarget, ABILITY_STRENGTH) + d20();
         nSTR_Creature = GetAbilityScore(oPC, ABILITY_STRENGTH) + d20();
      }
      while (nSTR_Target == nSTR_Creature);
// If the target wins, send a short message to it and return.
      if (nSTR_Target > nSTR_Creature)
      {
         FloatingTextStringOnCreature("You escape the constriction attack.", oTarget);
         return;
      }
// Check for immunity vs entangle. If the target is immune, tell him that the
// creature TRIED to entangle him. Otherwise tell him that he GOT entangled.

      if (GetIsImmune(oTarget, IMMUNITY_TYPE_ENTANGLE, oPC))
      {
         FloatingTextStringOnCreature("The creature tries to constrict you!", oTarget);
      }
      else
      {
         FloatingTextStringOnCreature("The creature is constricting you!", oTarget);
      }
// Apply the Entangle effect no matter whether the target is immune or not. If
// it is, it will have already received an according message that the Shambling
// Mounds entangle attempt failed. Otherwise it simply gets entangled as
// intended.
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectEntangle(), oTarget, 9.0f);
   }

