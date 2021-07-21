//::///////////////////////////////////////////////
//:: FileName at_hendelcbon
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/21/2002 1:54:47 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("AR_ITMRNG_PORIUS", GetPCSpeaker(), 1);
  object oPC=GetPCSpeaker();
AdjustAlignment(oPC,ALIGNMENT_CHAOTIC, 3);

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_SCRLBINDING");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_ITBK_FORTOME");
    if(GetIsObjectValid(oItemToTake) != 0)
      DestroyObject(oItemToTake);
{
SetLocalInt(GetPCSpeaker(), "Hendel", 7);
}
}
