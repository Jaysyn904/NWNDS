//::///////////////////////////////////////////////
//:: FileName sc_checkinvwater
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/6/2002 3:14:18 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPartyForItem(GetPCSpeaker(), "AR_IT_WATER002"))
        return FALSE;

    return TRUE;
}
