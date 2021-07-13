#include "ar_inc_pcspawn"


int StartingConditional()
{
object oPC=GetPCSpeaker();
string sSubRace=GetStringLowerCase(GetSubRace(oPC));
    int iResult;
     iResult= sSubRace==AR_SUBRACE_THRAX ? TRUE: FALSE;
    return iResult;
}


