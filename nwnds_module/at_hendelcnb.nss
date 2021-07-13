//::///////////////////////////////////////////////
//:: FileName at_hendelcnb
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/21/2002 1:38:59 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(600, GetPCSpeaker());

    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 500);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_ITBK_FORTOME");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_SCRLBINDING");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
{
SetLocalInt(GetPCSpeaker(), "Hendel", 7);
}
}
