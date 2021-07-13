//::///////////////////////////////////////////////
//::
//:: FileName at_olinarew2
//:: Rewards 700xp, and a Surgical Blade
//::
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/17/2002 12:20:38 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(700, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("AR_WSWDG_SURGICL", GetPCSpeaker(), 1);

}
