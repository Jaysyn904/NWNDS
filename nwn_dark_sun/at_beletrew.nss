//::///////////////////////////////////////////////
//:: FileName at_beletrew
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/12/2002 11:19:05 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(700, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("nw_it_gem012", GetPCSpeaker(), 1);

    // Set the variables
    SetLocalInt(GetPCSpeaker(), "nBeletQuest", 2);

}
