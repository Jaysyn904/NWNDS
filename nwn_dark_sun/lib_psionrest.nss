#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    object oWeap=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oHide=GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);

    if(GetEffectivePsionicLevel(oPC)<=0) return;

    PSPCheck(oPC);
    SetPSP(oPC, GetMaxPSP(oPC));

    if(GetTag(oWeap)=="Ps_PsychBlade_it")
        DestroyObject(oWeap);

    if(GetTag(oHide)=="Ps_CosAware_it")
        DestroyObject(oHide);

    SetEnhancement(oPC, PSIONIC_ENH_NONE);

}
