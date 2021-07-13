#include "ar_inc_pcspawn"


int StartingConditional()
{
    // Get the PC who is involved in this conversation
    object oPC = GetPCSpeaker();

    // The PC must be one of the listed races.
    if ( GetRacialType(oPC) != RACIAL_TYPE_THRIKREEN  &&
         GetRacialType(oPC) != RACIAL_TYPE_JEZ  &&
         GetRacialType(oPC) != RACIAL_TYPE_TONDI  &&
         GetRacialType(oPC) != RACIAL_TYPE_TOKSA  &&
         GetRacialType(oPC) != RACIAL_TYPE_JHOL  &&
         GetRacialType(oPC) != RACIAL_TYPE_TKEECH  &&
         GetRacialType(oPC) != RACIAL_TYPE_JERAL )
        return FALSE;

    // If we make it this far, we have passed all tests.
    return TRUE;
}
