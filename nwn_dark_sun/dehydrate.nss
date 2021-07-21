// Dehydration Grapple Attack - Item Unique OnHit Script
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
    string sCreName = GetName(oPC);
    int nCreSTR = GetAbilityModifier(ABILITY_STRENGTH, oPC);
    effect eGrabDmg = EffectDamage(d6(3), DAMAGE_TYPE_BLUDGEONING);
    effect eSaltDmg = EffectDamage(d6(3), DAMAGE_TYPE_FIRE);
    int nSTR_Target;
    int nSTR_Creature;

    int nCreCONMod = GetAbilityModifier(ABILITY_CONSTITUTION, oPC);
    int nCreHD = GetHitDice (oPC);
    int nNauseateDC = (10 + (nCreHD/2) + nCreCONMod);
    float fNauseateDur = RoundsToSeconds(d4(1));
    int nBAB = GetBaseAttackBonus(oTarget);

    effect eVis1 = EffectVisualEffect(VFX_IMP_FORTITUDE_SAVING_THROW_USE);
    effect eVis2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

    effect eNausea1 = EffectSpellFailure(100);
    effect eNausea2 = EffectAttackDecrease(nBAB);
    effect eNausea = EffectLinkEffects(eNausea1, eNausea2);
    eNausea = EffectLinkEffects(eNausea, eVis2);
    eNausea = ExtraordinaryEffect(eNausea);

    if (!MySavingThrow(SAVING_THROW_FORT, oTarget, nNauseateDC, SAVING_THROW_TYPE_ALL, oPC) &&
        !GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT &&
        !GetRacialType(oTarget) == RACIAL_TYPE_ELEMENTAL &&
        !GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis1, oTarget);
        FloatingTextStringOnCreature("** You are nauseated **.", oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eNausea, oTarget, fNauseateDur);
    }


// Gargantuan & larger creatures cannot be constricted.
      if (GetCreatureSize(oTarget) == CREATURE_SIZE_GARGANTUAN ||
          GetCreatureSize(oTarget) == CREATURE_SIZE_COLOSSAL)
      {
         return;
      }
// Perform a melee touch attack. Return if it missed.
      if (!TouchAttackMelee(oTarget))
      {
         return;
      }
// Deal dehydration & constriction damage.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eGrabDmg, oTarget);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eSaltDmg, oTarget);
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
         FloatingTextStringOnCreature("You escape the "+sCreName+"'s grapple attack.", oTarget, FALSE);
         return;
      }
// Check for immunity vs entangle. If the target is immune, tell him that the
// Shambling Mound TRIED to entangle him. Otherwise tell him that he GOT
// entangled.
      if (GetIsImmune(oTarget, IMMUNITY_TYPE_ENTANGLE, oPC))
      {
         FloatingTextStringOnCreature("The "+sCreName+" tries to grapple you!", oTarget, FALSE);
      }
      else
      {
         FloatingTextStringOnCreature("The "+sCreName+" is grappling you!", oTarget, FALSE);
      }
// Apply the Entangle effect no matter whether the target is immune or not. If
// it is, it will have already received an according message that the Shambling
// Mounds entangle attempt failed. Otherwise it simply gets entangled as
// intended.
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectEntangle(), oTarget, 9.0f);
   }
