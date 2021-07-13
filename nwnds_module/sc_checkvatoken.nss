//::///////////////////////////////////////////////
//:: FileName sc_checkvatoken
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2002 1:05:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "VeiledAllianceAmulet")))
        return FALSE;

    return TRUE;
}
