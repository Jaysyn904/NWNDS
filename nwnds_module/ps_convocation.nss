/************************************
*   Convocation                     *
*                                   *
*   Cost: 10                        *
*   Power Score: Wis -2             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=10;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    object oTarget=GetSpellTargetObject();
    location lDest=GetLocation(oPC);
    effect eVis=EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    vector vOrigin=GetPositionFromLocation(GetLocation(oTarget));
    vector vDest=GetPositionFromLocation(lDest);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CONVOCATION);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM);
    int bIsHostile=GetIsEnemy(oPC, oTarget);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CONVOCATION)) return;

    vOrigin=Vector(vOrigin.x+2.0, vOrigin.y-0.2, vOrigin.z);
    vDest=Vector(vDest.x+2.0, vDest.y-0.2, vDest.z);

    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_PSIONIC_CONVOCATION, bIsHostile));

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, Location(GetArea(oPC), vOrigin, 0.0), 0.8);
    DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, Location(GetArea(oPC), vDest, 0.0), 0.7));

    if(GetFactionEqual(oTarget, oPC)
        || !ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
    {
        DelayCommand(0.8, AssignCommand(oTarget, JumpToLocation(lDest)));
    }

}
