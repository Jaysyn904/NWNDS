/************************************
*   Cell Adjustment                 *
*                                   *
*   Cost: 12                        *
*   Power Score: Con -3             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_HEALING_S);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CELL_ADJUSTMENT);
    object oTarget=GetSpellTargetObject();
    effect eChk=GetFirstEffect(oTarget);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CELL_ADJUSTMENT)) return;

    effect eLink=EffectHeal(GetEnhancedEffect(d8()+2*nLevel, FEAT_PSIONIC_CELL_ADJUSTMENT));
    eLink=EffectLinkEffects(eLink, eVis);

    while (GetIsEffectValid(eChk))
    {
        if (GetEffectType(eChk)==EFFECT_TYPE_DISEASE)
            RemoveEffect(oTarget, eChk);

        eChk=GetNextEffect(oTarget);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);
}
