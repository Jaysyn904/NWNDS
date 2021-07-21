//::///////////////////////////////////////////////
//:: FileName at_getftomb
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/21/2002 1:05:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(50, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("QST_ITBK_FORTOME", GetPCSpeaker(), 1);
{
SetLocalInt(GetPCSpeaker(), "Hendel", 2);
}
}
