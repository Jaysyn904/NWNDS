//::///////////////////////////////////////////////
//:: FileName goldenkey
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/2/02 6:18:05 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("QST_GOLDENKEY3", GetPCSpeaker(), 1);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_GOLDENKEY1");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);

    object oItemToTake2;
    oItemToTake2 = GetItemPossessedBy(GetPCSpeaker(), "QST_GOLDENKEY2");
    if(GetIsObjectValid(oItemToTake2) != 0)
        DestroyObject(oItemToTake2);


}
