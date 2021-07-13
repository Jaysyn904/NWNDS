//::///////////////////////////////////////////////
//:: FileName at_trakrewboots
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 3:49:43 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(500, GetPCSpeaker());

object oPC = GetPCSpeaker();

RewardPartyGP(500, oPC, FALSE);

    // Give the speaker the items
    CreateItemOnObject("stiffcloak", GetPCSpeaker(), 1);

}
