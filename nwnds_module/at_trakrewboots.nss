//::///////////////////////////////////////////////
//:: FileName at_trakrewboots
//:  Gives Light Boots as a reward.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 3:49:43 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(250, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("AR_ITMBTS_LIGHT", GetPCSpeaker(), 1);

}
