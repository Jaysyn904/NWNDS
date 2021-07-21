//::///////////////////////////////////////////////
//:: FileName at_trici02
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/02 8:50:29 PM
//:://////////////////////////////////////////////
void main()
{


    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 30);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 250);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_DRIEDFISH");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    // Set the variables
    SetLocalInt(GetPCSpeaker(), "nTriciQuest", 2);



}
