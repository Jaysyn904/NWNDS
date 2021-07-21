//::///////////////////////////////////////////////
//:: FileName sc_brill03
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 7:20:21 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "QST_SMITHHAMMER"))
        return FALSE;

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nBrillQuest") == 1))
        return FALSE;

    return TRUE;
}
