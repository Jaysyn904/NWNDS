//::///////////////////////////////////////////////
//:: Filename: KA_SoulRewDEX
/*
      Quest:  Lost Souls

      Rewards the PC with 1500 XP & a Master's
      Amulet of Dexterity
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Kyriani Agriviar
//:: Created On: 10/10/2002 3:49:43 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(1500, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("AR_ITMNCK_DEX03", GetPCSpeaker(), 1);

}
