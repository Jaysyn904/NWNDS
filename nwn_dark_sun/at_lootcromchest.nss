//::///////////////////////////////////////////////
//:: FileName at_lootcromchest
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/17/2002 12:32:17 AM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 200);

    // Give the speaker the items
    CreateItemOnObject("bansheebolts", GetPCSpeaker(), 99);

    // Set the variables
    SetLocalInt(GetPCSpeaker(), "nLootedCromChest", 1);

}
