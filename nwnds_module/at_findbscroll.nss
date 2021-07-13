//::///////////////////////////////////////////////
//:: FileName at_findbscroll
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/21/2002 12:27:06 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(50, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("scrollofbinding", GetPCSpeaker(), 1);
 {
SetLocalInt(GetPCSpeaker(), "Hendel", 4);
}
}
