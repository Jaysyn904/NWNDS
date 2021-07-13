// Raakle's Improved Grab & Acid Spit attack - Item Unique OnHit Script
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
    int nHD = GetHitDice(oPC);
    int nDC = 10 + (nHD / 2) + GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
    int nAcidDamage = d4(6);
    int nSTR_Target;
    int nSTR_Creature;
    int nAcidAttack = 0;

    effect eGrapple = EffectEntangle();
    effect eAcidSpray = EffectDamage(nAcidDamage, DAMAGE_TYPE_ACID);
    effect eAcidSpray2 = EffectDamage(nAcidDamage/2, DAMAGE_TYPE_ACID);
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_L);

// Can't grapple colossal creatures.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_COLOSSAL)
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
         nSTR_Creature = GetAbilityScore(oPC, ABILITY_STRENGTH) + d20();
      }
      while (nSTR_Target == nSTR_Creature);

// If the target wins, send a short message to it and return.
      if (nSTR_Target > nSTR_Creature)
      {
         FloatingTextStringOnCreature("You escape from the raakle's claws.", oTarget);
         return;
      }

// Check for immunity vs entangle. If the target is immune, tell him that the
// raakle TRIED to grapple him. Otherwise tell him that he GOT
// entangled.
      if (GetIsImmune(oTarget, IMMUNITY_TYPE_ENTANGLE, oPC))
      {
         FloatingTextStringOnCreature("The raakle tries to grapple you!", oTarget);
      }
      else
      {
         FloatingTextStringOnCreature("The raakle is grappling you!", oTarget);
      }
// Apply the Entangle effect no matter whether the target is immune or not. If
// it is, it will have already received an according message that the raakle's
// grapple attempt failed. Otherwise it simply gets entangled as intended.

      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGrapple, oTarget, 6.0f);


// Acid attack - Reflex Save vs. CON-based DC
    if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, nDC, SAVING_THROW_TYPE_ACID, oPC, 0.0f ))
         {
            //  Failed Reflex save, apply acid damage
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eAcidSpray,oTarget);
            FloatingTextStringOnCreature("The raakle sprays you with its digestive acids!", oTarget);
        }
    else
            {
            // Passed Relex save, apply 1/2 acid damage
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eAcidSpray2,oTarget);
            FloatingTextStringOnCreature("The raakle sprays you with its digestive acids!", oTarget);
            }

// Raakles flee if two acid attacks aren't enough to kill their prey.
      if (nAcidAttack >= 2)
      {
        SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
        return;
      }

// Acid attack counter
      nAcidAttack = nAcidAttack + 1;

FloatingTextStringOnCreature("The raakle has you grappled!", oTarget);

   }
