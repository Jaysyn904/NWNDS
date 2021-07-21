//::///////////////////////////////////////////////
//:: FileName at_004
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 7:20:59 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "CRFT_SPIDERSAC");

    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
