// Elven Rope Improved Grab & Blood Drain - Item Unique OnHit Script
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
    int nSTR_Target;
    int nSTR_Creature;
    int nConDrain = d4(1);

    //effect eWebVis = EffectVisualEffect(VFX_DUR_WEB);
    effect eCocoon = EffectEntangle();
    eCocoon = ExtraordinaryEffect(eCocoon);
    //effect eLink = EffectLinkEffects(eWebVis, eCocoon);


    effect eBloodVis = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    effect eBloodsuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);
    eBloodsuck = ExtraordinaryEffect(eBloodsuck);

// Colossal creatures cannot be constricted.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_COLOSSAL)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }
// Deal 1d4 CON Damage.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eBloodVis, oTarget);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eBloodsuck, oTarget);

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
         FloatingTextStringOnCreature("You escape the elven rope's grapple.", oTarget);
         return;
      }
// Check for immunity vs entangle. If the target is immune, tell him that the
// silk wyrm TRIED to entangle him. Otherwise tell him that he GOT
// entangled.
      if (GetIsImmune(oTarget, IMMUNITY_TYPE_ENTANGLE, oPC))
      {
         FloatingTextStringOnCreature("The elven rope tries to grapple you!", oTarget);
      }
      else
      {
         FloatingTextStringOnCreature("The elven rope is grappling you!", oTarget);
      }
// Apply the Entangle effect no matter whether the target is immune or not. If
// it is, it will have already received an according message that the elven
// rope's entangle attempt failed. Otherwise it simply gets entangled as
// intended.

      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCocoon, oTarget, 6.0f);

}


