#include "lib_psionic"

void main()
{
    object oPC=GetLocalObject(GetModule(), "Cani");
    int nPSP=GetPSP(oPC);
    int nPSPMax=GetMaxPSP(oPC);
    effect eVis=EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eLink=EffectAbilityDecrease(ABILITY_CONSTITUTION, 1);
    eLink=ExtraordinaryEffect(eLink);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, HoursToSeconds(24));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    nPSP=nPSP+16;
    if (nPSP>nPSPMax) nPSP=nPSPMax;
    SetPSP(oPC, nPSP);
    SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));

    DeleteLocalObject(GetModule(), "Cani");

}
