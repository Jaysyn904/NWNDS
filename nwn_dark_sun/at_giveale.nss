//::///////////////////////////////////////////////
//:: FileName at_giveale
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/10/2002 2:06:30 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
    CreateItemOnObject("nw_it_mpotion021", GetPCSpeaker(), 1);
    // Remove some gold from the player
TakeGoldFromCreature(10, GetPCSpeaker(), TRUE);
}
