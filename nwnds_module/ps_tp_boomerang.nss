/************************************
*   Boomerang Teleport              *
*                                   *
*   Cost: 16                        *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    location lDest=GetTeleportAnchor(oPC);
    location lLoc=GetLocation(oPC);
    effect eVis=EffectVisualEffect(VFX_IMP_DEATH);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_TELEPORT);

    if(!GetIsObjectValid(GetAreaFromLocation(lDest)))
    {
        FloatingTextStringOnCreature("No valid teleport anchor has been set.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TELEPORT)) return;

    SetTeleportAnchor(lLoc, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(1.2, AssignCommand(oPC, JumpToLocation(lDest)));
}

