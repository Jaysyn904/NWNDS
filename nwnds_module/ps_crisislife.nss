/************************************
*   Crisis Of Life                  *
*                                   *
*   Cost: 36                        *
*   Power Score: Con -5             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=36;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-5;
    effect eVis1=EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eVis2=EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oTarget=GetSpellTargetObject();
    int nTargRace=GetRacialType(oTarget);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CRISIS_OF_LIFE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD
        || nTargRace==RACIAL_TYPE_ELEMENTAL || nTargRace==RACIAL_TYPE_OOZE)
    {
        FloatingTextStringOnCreature("This power only affects creatures with hearts", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CRISIS_OF_LIFE)) return;

    if(GetIsDead(oTarget) && GetIsPC(oTarget))
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_CRISIS_OF_LIFE, FALSE));

        if(d100()<=70)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oTarget);
            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oTarget, 10.0));
        }

        else
        {
            FloatingTextStringOnCreature("You were unable to shock the patient's heart into starting.", oPC, FALSE);
        }
    }


    else if(TouchAttackMelee(oTarget))
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_CRISIS_OF_LIFE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis1, oTarget);

        if(!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_DEATH, oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget);
        }

        else
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(), oTarget, 6.0);
        }
    }


}
