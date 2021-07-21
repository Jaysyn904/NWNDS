// Ash Golem Burning Grasp - Item Unique OnHit Script
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
   effect eGrabDmg1 = EffectDamage(d10(1), DAMAGE_TYPE_FIRE);
   int nSTR_Target;
   int nSTR_Creature;

// COLOSSAL & larger creatures cannot be constricted.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_COLOSSAL)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }
// Deal 1d10 fire damage.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eGrabDmg1, oTarget);
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
         FloatingTextStringOnCreature("You escape the ash golem's grapple.", oTarget);
         return;
      }
// Check for immunity vs entangle. If the target is immune, tell him that the
// Shambling Mound TRIED to entangle him. Otherwise tell him that he GOT
// entangled.
      if (GetIsImmune(oTarget, IMMUNITY_TYPE_ENTANGLE, oPC))
      {
         FloatingTextStringOnCreature("The ash golem tries to grapple you!", oTarget);
      }
      else
      {
         FloatingTextStringOnCreature("The ash golem is grappling you!", oTarget);
      }
// Apply the Entangle effect no matter whether the target is immune or not. If
// it is, it will have already received an according message that the Shambling
// Mounds entangle attempt failed. Otherwise it simply gets entangled as
// intended.
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectEntangle(), oTarget, 9.0f);
   }

