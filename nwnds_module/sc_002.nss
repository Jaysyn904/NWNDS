//::///////////////////////////////////////////////
//:: FileName sc_002
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 2:54:23 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "QST_GOLDENKEY1"))
        return FALSE;
    if(!CheckPartyForItem(GetPCSpeaker(), "QST_GOLDENKEY2"))
        return FALSE;

    return TRUE;
}
