/************************************
*   Psychic Surgery                 *
*                                   *
*   Cost: 15                        *
*   Power Score: Wis -5             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    object oTarget=GetSpellTargetObject();
    int nCost=15;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-5;
    effect eVis=EffectVisualEffect(VFX_IMP_SONIC);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_HEALING_M));
    effect eRem=GetFirstEffect(oTarget);
    int nType;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSYCHIC_SURGERY);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSYCHIC_SURGERY)) return;

    while (GetIsEffectValid(eRem))
    {
        nType=GetEffectType(eRem);

        if (nType==EFFECT_TYPE_CHARMED || nType==EFFECT_TYPE_CONFUSED
            || nType==EFFECT_TYPE_DAZED || nType==EFFECT_TYPE_DOMINATED
            || nType==EFFECT_TYPE_FRIGHTENED || nType==EFFECT_TYPE_SLEEP
            || nType==EFFECT_TYPE_STUNNED
            || ( (nType==EFFECT_TYPE_SPELL_FAILURE || nType==EFFECT_TYPE_SLOW
                || nType==EFFECT_TYPE_NEGATIVELEVEL || nType==EFFECT_TYPE_SAVING_THROW_DECREASE
                || nType==EFFECT_TYPE_AC_DECREASE || nType==EFFECT_TYPE_ATTACK_DECREASE
                || nType==EFFECT_TYPE_SKILL_DECREASE || nType==EFFECT_TYPE_BLINDNESS
                || nType==EFFECT_TYPE_DAMAGE_DECREASE || nType==EFFECT_TYPE_DEAF)
                && GetEffectSubType(eRem)==SUBTYPE_EXTRAORDINARY))
        {
                RemoveEffect(oTarget, eRem);
                break;
        }

        eRem=GetNextEffect(oTarget);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

}
