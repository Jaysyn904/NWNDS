//::///////////////////////////////////////////////
//:: FileName at_trakrewcloak
//:: Gives a Slick Cloak as a reward.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 3:50:12 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(250, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("AR_ITCLK_SLICK", GetPCSpeaker(), 1);

}
