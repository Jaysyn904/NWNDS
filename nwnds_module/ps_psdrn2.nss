#include "lib_psionic"

void main()
{
    object oPC=GetLocalObject(GetModule(), "PsychicDrainer");
    object oTarget=GetLocalObject(GetModule(), "PsychicDrainee");
    int nPSP=GetPSP(oPC);
    int nPSPMax=GetMaxPSP(oPC);
    effect eVis1=EffectVisualEffect(VFX_IMP_HEAD_MIND);
    effect eVis2=EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eLink=EffectAbilityDecrease(ABILITY_CONSTITUTION, 1);
    eLink=EffectLinkEffects(eLink, EffectAbilityDecrease(ABILITY_WISDOM, 1));
    eLink=EffectLinkEffects(eLink, EffectAbilityDecrease(ABILITY_INTELLIGENCE, 1));
    eLink=ExtraordinaryEffect(eLink);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(24));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis1, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
    nPSP=nPSP+30;
    if (nPSP>nPSPMax) nPSP=nPSPMax;
    SetPSP(oPC, nPSP);
    SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));

    DeleteLocalObject(GetModule(), "PsychicDrainer");
    DeleteLocalObject(GetModule(), "PsychicDraine");
}
