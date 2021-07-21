/************************************
*   Group Teleport                  *
*                                   *
*   Cost: 32                        *
*   Power Score: Wis -5             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=32;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-5;
    location lDest=GetTeleportAnchor(oPC);
    effect eVis=EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_GROUP_TELEPORT);
    object oGroupee=GetFirstFactionMember(oPC, FALSE);

    if(!GetIsObjectValid(GetAreaFromLocation(lDest)))
    {
        FloatingTextStringOnCreature("No valid teleport anchor has been set.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_GROUP_TELEPORT)) return;

    while(GetIsObjectValid(oGroupee))
    {
        if(GetDistanceToObject(oGroupee)>=0.0 && GetDistanceToObject(oGroupee)<5.0)
        {
            DelayCommand(1.8, AssignCommand(oGroupee, JumpToLocation(lDest)));
        }

        oGroupee=GetNextFactionMember(oPC, FALSE);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(1.8, AssignCommand(oPC, JumpToLocation(lDest)));
}
