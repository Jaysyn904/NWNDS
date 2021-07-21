/************************************
*   Cannibalize                     *
*                                   *
*   Cost: 0                         *
*   Power Score: Con                *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=0;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION);
    int nCon=GetAbilityScore(oPC, ABILITY_CONSTITUTION);

    if (nCon==3)
    {
        FloatingTextStringOnCreature("You do not have enough constitution.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CANNIBALIZE, TRUE)) return;

    if (GetIsImmune(oPC, IMMUNITY_TYPE_ABILITY_DECREASE))
    {
        FloatingTextStringOnCreature("You are immune to the draining effects of this power.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    SetLocalObject(GetModule(), "Cani", oPC);
    ExecuteScript("ps_cani2", GetModule());

}
