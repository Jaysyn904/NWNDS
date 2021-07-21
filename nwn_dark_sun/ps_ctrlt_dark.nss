/************************************
*   Control Light (Darken)          *
*                                   *
*   Cost: 12                        *
*   Power Score: Int                *
*                                   *
************************************/
#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    effect eVis=EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eLink=EffectAreaOfEffect(AOE_PER_DARKNESS);
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CONTROL_LIGHT);
    object oTarget=GetSpellTargetObject();
    location lLoc;
    if(GetIsObjectValid(oTarget)) lLoc=GetLocation(oTarget);
    else lLoc=GetSpellTargetLocation();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CONTROL_LIGHT)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eLink, lLoc, TurnsToSeconds(nDuration));

}
