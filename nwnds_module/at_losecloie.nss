//::///////////////////////////////////////////////
//:: FileName at_losecloie
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 12:23:16 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "Cloie");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
     SetLocalInt(GetPCSpeaker(),"DydrinaFirstTimeTalked",2);
}
