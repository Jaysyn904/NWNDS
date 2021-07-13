/************************************
*   Teleport Anchor                 *
*                                   *
*   Cost: 1                         *
*   Power Score: Wis +1             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=1;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)+1;
    location lLoc=GetLocation(oPC);
    effect eVis=EffectVisualEffect(VFX_IMP_HEAD_FIRE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TELEPORT)) return;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SetTeleportAnchor(lLoc, oPC);

}
