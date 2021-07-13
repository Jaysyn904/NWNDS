#include "lib_psionic"
#include "x2_inc_switches"

void main()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oItem;
    object oPC;
    int nPSP;
    int nPSPMax;
    effect eVis=EffectVisualEffect(VFX_IMP_SILENCE);


    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        oItem=GetItemActivated();
        oPC=GetItemActivator();
        nPSP=GetPSP(oPC);
        nPSPMax=GetMaxPSP(oPC);
        int nBoost=GetLocalInt(oItem, "PSPStored");
        string sResRef=GetLocalString(oItem, "OldGemType");

        nPSP=nPSP+nBoost;
        if (nPSP>nPSPMax) nPSP=nPSPMax;


        SetPSP(oPC, nPSP);
        SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        if(d20()>1) CreateItemOnObject(sResRef, oPC, 1);
        else FloatingTextStringOnCreature("Your gem has shattered.", oPC, FALSE);

        DestroyObject(oItem, 0.2);
    }
}
