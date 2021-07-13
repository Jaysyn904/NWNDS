//::///////////////////////////////////////////////
//:: FileName goldforclock
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/17/2002 6:13:09 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    // Make sure the PC speaker has these items in their inventory
    if((GetGold(oPC)) < 500)
        return FALSE;

    return TRUE;
}
