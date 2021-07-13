/************************************
*   Control Light (Brighten)        *
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
    effect eLink=EffectVisualEffect(VFX_DUR_LIGHT_WHITE_20);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CONTROL_LIGHT);
    object oTarget=GetSpellTargetObject();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CONTROL_LIGHT)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    if(GetIsObjectValid(oTarget))
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(nDuration));
    else
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eLink, GetSpellTargetLocation(), HoursToSeconds(nDuration));

}
