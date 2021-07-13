/************************************
*   Complete Healing                *
*                                   *
*   Cost: 30                        *
*   Power Score: Con                *
*                                   *
*************************************/

#include "lib_psionic"

void RemoveIllEffects(object oPC)
{
    effect eEff = GetFirstEffect(oPC);


    while(GetIsEffectValid(eEff))
    {
        int nEffType=GetEffectType(eEff);

        if (nEffType == EFFECT_TYPE_ABILITY_DECREASE ||
            nEffType == EFFECT_TYPE_AC_DECREASE ||
            nEffType == EFFECT_TYPE_ATTACK_DECREASE ||
            nEffType == EFFECT_TYPE_DAMAGE_DECREASE ||
            nEffType == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            nEffType == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            nEffType == EFFECT_TYPE_SKILL_DECREASE ||
            nEffType == EFFECT_TYPE_BLINDNESS ||
            nEffType == EFFECT_TYPE_DEAF ||
            nEffType == EFFECT_TYPE_DISEASE ||
            nEffType == EFFECT_TYPE_POISON ||
            nEffType == EFFECT_TYPE_PARALYZE ||
            nEffType == EFFECT_TYPE_CHARMED ||
            nEffType == EFFECT_TYPE_DOMINATED ||
            nEffType == EFFECT_TYPE_DAZED ||
            nEffType == EFFECT_TYPE_CONFUSED ||
            nEffType == EFFECT_TYPE_FRIGHTENED ||
            nEffType == EFFECT_TYPE_SLOW ||
            nEffType == EFFECT_TYPE_STUNNED)
        {
            RemoveEffect(oPC, eEff);
        }

        eEff=GetNextEffect(oPC);
    }
}


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=30;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION);
    effect eVis=EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
    effect eLink=EffectHeal(GetMaxHitPoints(oPC)-GetCurrentHitPoints(oPC));
    eLink=EffectLinkEffects(eLink, eVis);

    if (GetIsInCombat(oPC))
    {
        SendMessageToPC(oPC, "You cannot use this power while fighting");
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_COMPLETE_HEALING)) return;

    AssignCommand(oPC, ClearAllActions());
    DelayCommand(0.6, AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 9.4)));
    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 9.4));
    DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC));
    DelayCommand(10.0, RemoveIllEffects(oPC));

}
