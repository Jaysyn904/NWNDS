#include "lib_psionic"
//does any special pre-psionic hooking.
//can include anti-psionic area checks,
//power restrictions, etc.
//to prevent powers being used set bContinue to FALSE

void main()
{
//setting up variables.  Do not modify this.
/***********************************************************************/
/**/    int bContinue=TRUE;                                          /**/
/**/    object oPC=GetLocalObject(GetModule(), "Ps_Player");         /**/
/**/    int nFeatID=GetLocalInt(GetModule(), "Ps_FeatID");           /**/
/**/                                                                 /**/
/**/    DeleteLocalInt(GetModule(), "Ps_FeatID");                    /**/
/**/    DeleteLocalObject(GetModule(), "Ps_Player");                 /**/
/***********************************************************************/

    //Add statements here to change how psionics work
    //examples:
    //FloatingTextStringOnCreature("Psionic Used!", oPC);
    //if(GetTag(GetArea(oPC))=="AntiPsionicArea") bContinue=FALSE;
    //if(nFeatID==FEAT_PSIONIC_TELEKINESIS) FloatingTextStringOnCreature("Telekinesis Used!", oPC);





    //"return" value.  Do not modify anything below here.
//------------------------------------------------------------------------------
    SetLocalInt(GetModule(), "Ps_HookReturn", bContinue);
}


