//::///////////////////////////////////////////////
//:: FileName at_belet2rew
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/18/2002 12:28:04 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(500, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("nw_it_gem010", GetPCSpeaker(), 1);
    CreateItemOnObject("nw_it_gem002", GetPCSpeaker(), 1);
    CreateItemOnObject("nw_it_gem006", GetPCSpeaker(), 1);
    CreateItemOnObject("nw_it_gem005", GetPCSpeaker(), 1);

}
