//::///////////////////////////////////////////////
//:: FileName at_getcloie
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 11:39:27 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items

    CreateItemOnObject("cloie", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "KankLeash");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    DestroyObject(GetObjectByTag("KankCloie"), 1.0);
}
