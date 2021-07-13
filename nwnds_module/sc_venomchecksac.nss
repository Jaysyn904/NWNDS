//::///////////////////////////////////////////////
//:: FileName sc_venomchecksac
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2002 12:38:20 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "QueensPoisonSack"))
        return FALSE;

    return TRUE;
}
