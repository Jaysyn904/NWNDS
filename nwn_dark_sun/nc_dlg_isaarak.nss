#include "ar_inc_pcspawn"


int StartingConditional()
{
    // Get the PC who is involved in this conversation
    object oPC = GetPCSpeaker();

    // The PC must be one of the listed races.
    if ( GetRacialType(oPC) != RACIAL_TYPE_AARAKOCRA )
        return FALSE;
        // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return FALSE;


    // If we make it this far, we have passed all tests.
    return TRUE;
}


