/************************************
*   Suppress Fear                   *
*                                   *
*   Cost: 5                         *
*   Power Score: Wis                *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=5;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM);
    effect eVis=EffectVisualEffect(VFX_IMP_HEALING_M);
    object oTarget=GetSpellTargetObject();
    effect eLink=GetFirstEffect(oTarget);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_SUPPRESS_FEAR);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_SUPPRESS_FEAR)) return;

    int nDuration=GetEnhancedDuration(3+nLevel);

    while (GetIsEffectValid(eLink))
    {
        if (GetEffectType(eLink)==EFFECT_TYPE_FRIGHTENED)
            RemoveEffect(oTarget, eLink);

        eLink=GetNextEffect(oTarget);
    }

    eLink=EffectImmunity(IMMUNITY_TYPE_FEAR);
    eLink=ExtraordinaryEffect(eLink);

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_SUPPRESS_FEAR, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));


}
