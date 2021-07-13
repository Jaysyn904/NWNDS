/************************************
*   Psionic Residue                 *
*                                   *
*   Cost: 4                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"


//time between uses in seconds
int TIME_BETWEEN_USES=30;


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=4;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR);
    eVis=EffectLinkEffects(eVis,EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS));
    int nCurrentTime=GetRealTime();
    int nLastUsed=GetLocalInt(oPC, "ResidueUsed")==0
        ? nCurrentTime-7*TIME_BETWEEN_USES
        : GetLocalInt(oPC, "ResidueUsed");
    int nInterval=nCurrentTime-nLastUsed;
    int nPSP;
    int nPSPMax;
    int nPSPGain=(nInterval/TIME_BETWEEN_USES > 7)
            ? d8(7) : d8(nInterval/TIME_BETWEEN_USES);

    if (nInterval<TIME_BETWEEN_USES)
    {
        FloatingTextStringOnCreature("There is no more psionic residue nearby", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSIONIC_RESIDUE, TRUE)) return;

    nPSP=GetPSP(oPC);
    nPSPMax=GetMaxPSP(oPC);
    nPSP=nPSP+nPSPGain;
    if (nPSP>nPSPMax) nPSP=nPSPMax;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SetLocalInt(oPC, "ResidueUsed", nCurrentTime);
    SetPSP(oPC, nPSP);
    SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));

}
