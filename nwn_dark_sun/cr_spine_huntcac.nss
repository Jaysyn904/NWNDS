// Hunting Cactus' Bloodsuck Attack - Item Unique OnHit Script
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
   int nConDrain = d2(1);
   int nTickFull;
   effect eBloodSuck = EffectAbilityDecrease(ABILITY_CONSTITUTION, nConDrain);

// Fine & smaller creatures cannot be attached to.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_DIMINUTIVE ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_FINE)
      {
         return;
      }

// Only feeds on paralyzed creatures


// Drain 1d2 points of CON.
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBloodSuck, oTarget);

// When the hunting cactus drains 10 CON worth of blood it will leave.
      if (nTickFull >= 10)
      {
        SetLocalInt(oPC, "X2_L_BEH_OFFENSE", 0);
        return;
      }

// Add CON loss to total drained
      nTickFull = nTickFull + nConDrain;

FloatingTextStringOnCreature("The hunting cactus is draining your blood!", oTarget);

   }
