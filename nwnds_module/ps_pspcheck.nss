#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    PSPCheck(oPC);

    int nPSP=GetPSP(oPC);
    int nPSPMax=GetMaxPSP(oPC);


    FloatingTextStringOnCreature("PSP: "+IntToString(nPSP)+" / "+IntToString(nPSPMax), oPC, FALSE);
}
