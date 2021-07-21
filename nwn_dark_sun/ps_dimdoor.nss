/************************************
*   Dimension Door                  *
*                                   *
*   Cost: 6                         *
*   Power Score: Wis -1             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=6;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-1;
    object oTarget=GetSpellTargetObject();
    location lDest;
    if (GetIsObjectValid(oTarget)) lDest=GetLocation(oTarget);
    else lDest=GetSpellTargetLocation();
    effect eVis=EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    vector vOrigin=GetPositionFromLocation(GetLocation(oPC));
    vector vDest=GetPositionFromLocation(lDest);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DIMENSION_DOOR)) return;

    vOrigin=Vector(vOrigin.x+2.0, vOrigin.y-0.2, vOrigin.z);
    vDest=Vector(vDest.x+2.0, vDest.y-0.2, vDest.z);

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, Location(GetArea(oPC), vOrigin, 0.0), 0.8);
    DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, Location(GetArea(oPC), vDest, 0.0), 0.7));
    DelayCommand(0.8, AssignCommand(oPC, JumpToLocation(lDest)));
    DelayCommand(1.0, AssignCommand(oPC, ClearAllActions()));


}
