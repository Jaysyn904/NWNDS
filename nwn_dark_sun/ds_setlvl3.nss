void main()
{
 if (GetHitDice(GetPCSpeaker()) < 3)
 SetXP(GetPCSpeaker(), 3000);

// Capture the PC in a variable for later use in the AssignCommand
// object oPC = GetPCSpeaker();
// Give the speaker the items
// object oSpecialItem = CreateItemOnObject ("PsionicLevel1", GetPCSpeaker(), 1);
//Force the speaker to equip the item that was just given
// AssignCommand(oPC, ActionEquipItem (oSpecialItem, INVENTORY_SLOT_CARMOUR));

}
