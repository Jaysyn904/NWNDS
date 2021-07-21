//::///////////////////////////////////////////////
//:: FileName sc_hasleash
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 11:38:54 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "KankLeash"))
        return FALSE;

    return TRUE;
}
