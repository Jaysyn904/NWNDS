//::///////////////////////////////////////////////
//:: FileName sc_007
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 1:06:41 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "QST_DRIEDFISH"))
        return FALSE;

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nTriciQuest") == 1))
        return FALSE;

    return TRUE;
}

