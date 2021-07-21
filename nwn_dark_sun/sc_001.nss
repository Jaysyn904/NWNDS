//::///////////////////////////////////////////////
//:: FileName sc_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 4:54:01 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "QST_OFFICIALDOCS"))
        return FALSE;

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nIbodQuest") == 1))
        return FALSE;

    return TRUE;
}
