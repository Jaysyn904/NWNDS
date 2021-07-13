//::///////////////////////////////////////////////
//::
//:: FileName at_olinarew3
//:: Rewards 700xp & 5000 Ceramic
//::
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/17/2002 12:21:14 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 5000);

    // Give the speaker some XP
    RewardPartyXP(700, GetPCSpeaker());

}
