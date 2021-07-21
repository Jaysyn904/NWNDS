//::///////////////////////////////////////////////
//::
//:: FileName: at_olinarew
//:: Rewards 700xp, a Critical Care Medical Belt
//:: & some Advanced Healing Kits
//::
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2002 1:34:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(700, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("AR_ITBLT_CRITCARE", GetPCSpeaker(), 1);
    CreateItemOnObject("KIT_HEAL_3_002", GetPCSpeaker(), 1);

}
