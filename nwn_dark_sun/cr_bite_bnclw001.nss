// Lesser Boneclaw's Improved Grab & Gnaw attack - Item Unique OnHit Script
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
   int oFort = GetFortitudeSavingThrow(oTarget);
   int nDC = 10;
   //int nConDrain = d4(1);
   int nSTR_Target;
   int nSTR_Creature;
   //int nTickFull;
   effect eGnawDmg = EffectDamage(d4(1)-2, DAMAGE_TYPE_PIERCING && DAMAGE_TYPE_BLUDGEONING);
   effect eTickOn = EffectMovementSpeedIncrease(99);
   effect eTickOff = EffectMovementSpeedDecrease(99);
   effect ePoison = EffectPoison(61);

// Fine & smaller creatures cannot be attached to.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_DIMINUTIVE ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_FINE)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
        return;
      }
// Do bite damage & see if the boneclaw's poison is resisted.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eGnawDmg, oTarget);

      if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_POISON, oTarget))
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget);
            }

// Increase the boneclaw's speed so it can stay "attached" to it's victim
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOn, oPC);

// When the tick drains 8 CON worth of blood it will detach & run away.
      /*if (nTickFull >= 8)
      {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eTickOff, oPC);
        SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
        return;
      }

// Add CON loss to total drained
      nTickFull = nTickFull + nConDrain;*/

FloatingTextStringOnCreature("The boneclaw is gnawing on you!", oTarget);

   }
