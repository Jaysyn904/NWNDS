//::///////////////////////////////////////////////
//:: FileName at_givebottlewat
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 2:03:18 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("water001", GetPCSpeaker(), 1);
       // Remove some gold from the player
TakeGoldFromCreature(500, GetPCSpeaker(), TRUE);
}
