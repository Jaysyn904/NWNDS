/************************************
*   Cause Sleep                     *
*                                   *
*   Cost: 11                        *
*   Power Score: Wis -2             *
*                                   *
************************************/

#include "lib_psionic"

void Zzzz(object oSleeper)
{
    effect eChk=GetFirstEffect(oSleeper);
    int bSleepFound=FALSE;

    while(GetIsEffectValid(eChk))
    {
        if (GetEffectType(eChk)==EFFECT_TYPE_SLEEP)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), oSleeper);
            DelayCommand(4.0, Zzzz(oSleeper));
            return;
        }

        eChk=GetNextEffect(oSleeper);
    }

}




void main()
{
    object oPC=OBJECT_SELF;
    int nCost=11;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eLink=EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_IMP_SLEEP));
    eLink=EffectLinkEffects(eLink, EffectSleep());
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CAUSE_SLEEP);
    object oTarget=GetSpellTargetObject();
    int nTargRace=GetRacialType(oTarget);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This being never sleeps.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CAUSE_SLEEP)) return;

    int nDuration=GetEnhancedDuration(3+nLevel/2);

    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_PSIONIC_CAUSE_SLEEP));

    if(!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        AssignCommand(oTarget, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, IntToFloat(nDuration)));
        DelayCommand(4.0, Zzzz(oTarget));
    }

    else ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_WILL_SAVING_THROW_USE), oTarget);

}
