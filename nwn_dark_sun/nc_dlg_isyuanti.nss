#include "ar_inc_pcspawn"


int StartingConditional()
{
    // Get the PC who is involved in this conversation
    object oPC = GetPCSpeaker();

    // The PC must be one of the listed races.
    if ( GetRacialType(oPC) != RACIAL_TYPE_PURE_YUAN  && // Yuan-Ti Pureblood
         GetRacialType(oPC) != RACIAL_TYPE_ABOM_YUAN )   // Yuan-Ti Abomination
        return FALSE;

    // If we make it this far, we have passed all tests.
    return TRUE;
}
