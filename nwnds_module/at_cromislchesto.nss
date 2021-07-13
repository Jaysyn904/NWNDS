//::///////////////////////////////////////////////
//:: FileName at_cromislchesto
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/30/2002 2:04:00 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 200);

    // Give the speaker some XP
    RewardPartyXP(50, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("bansheebolts", GetPCSpeaker(), 99);

}
