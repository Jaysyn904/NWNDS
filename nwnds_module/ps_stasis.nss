/************************************
*   Stasis Field                    *
*                                   *
*   Cost: 45                        *
*   Power Score: Int -8             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=45;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-8;
    effect eVis=EffectVisualEffect(VFX_FNF_TIME_STOP);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_STASIS_FIELD);
    effect eLink=EffectTimeStop();
    eLink=ExtraordinaryEffect(eLink);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_STASIS_FIELD)) return;

    int nDuration=GetEnhancedDuration(1+nLevel/10);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(0.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration)));

}
