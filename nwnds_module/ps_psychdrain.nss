/************************************
*   Psychic Drain                   *
*                                   *
*   Cost: 10                        *
*   Power Score: Wis -6             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=10;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-6;
    object oTarget=GetSpellTargetObject();
    int nLastDrained=GetLocalInt(oTarget, "PsDrained")==0?GetRealTime()-60
        :GetLocalInt(oTarget, "PsDrained");

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSYCHIC_DRAIN, TRUE)) return;

    int nPSP=GetPSP(oPC);

    if (GetIsDead(oTarget))
    {
        FloatingTextStringOnCreature("This creature is dead.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));
    }

    else if(GetIsImmune(oTarget, IMMUNITY_TYPE_ABILITY_DECREASE))
    {
        FloatingTextStringOnCreature("This creature is immune to your attempts to drain them.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));
    }

    else if (!GetFactionEqual(oPC, oTarget))
    {
        FloatingTextStringOnCreature("This ability only works on willing victims who are in your party.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));
    }

    else if (GetAbilityScore(oTarget, ABILITY_WISDOM)<=4 || GetAbilityScore(oTarget, ABILITY_INTELLIGENCE)<=4
        || GetAbilityScore(oTarget, ABILITY_CONSTITUTION)<=4)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oTarget, 8.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));
    }

    else if (nLastDrained>GetRealTime())
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oTarget, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oTarget);
        FloatingTextStringOnCreature("You cannot drain this target any further right now.", oPC, FALSE);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));
    }


    else
    {
        SetLocalObject(GetModule(), "PsychicDrainer", oPC);
        SetLocalObject(GetModule(), "PsychicDrainee", oTarget);

        SetLocalInt(oTarget, "PsDrained", GetRealTime()+30);

        ExecuteScript("ps_psdrn2", GetModule());
    }

}
