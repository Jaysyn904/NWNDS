//:://////////////////////////////////////////////
//:: Poison: 2d4 Constitution damage
//:: poison_2d4_con
//:://////////////////////////////////////////////
/** @file
    This is one of the scripts that implement causing
    poison ability damage using the ApplyAbilityDamage()
    wrapper.
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: 01.11.2012
//:://////////////////////////////////////////////

#include "inc_abil_damage"

void main()
{
    object oTarget = OBJECT_SELF;
    int nDamage = d4(2);
    int nAbility = ABILITY_CONSTITUTION;

    ApplyAbilityDamage(oTarget, nAbility, nDamage, DURATION_TYPE_TEMPORARY, TRUE, -1.0f);
}
