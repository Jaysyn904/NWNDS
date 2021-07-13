//::///////////////////////////////////////////////
//:: Tailoring - Fix Clothing
//:: tlr_fixclothing.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 9, 2004
//:://////////////////////////////////////////////
void main()
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
    AssignCommand(OBJECT_SELF, ActionUnequipItem(oArmor));
    DelayCommand(2.0f, AssignCommand(OBJECT_SELF, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST)));
}
