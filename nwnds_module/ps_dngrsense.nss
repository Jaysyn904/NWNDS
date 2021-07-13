/************************************
*   Danger Sense                    *
*                                   *
*   Cost: 7                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=7;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    effect eLink=EffectImmunity(IMMUNITY_TYPE_SNEAK_ATTACK);
    eLink=EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_TRAP), eLink);
    eLink=EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DANGER_SENSE);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DANGER_SENSE)) return;

    int nDuration=GetEnhancedDuration(4+nLevel);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);


}
