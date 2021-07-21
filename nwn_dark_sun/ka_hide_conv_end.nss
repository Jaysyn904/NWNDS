#include "NW_I0_GENERIC"
string swow_ResRef = "testskin";

void wow_EquipHide(object oPC)
{
    object oHide = CreateItemOnObject(swow_ResRef, oPC);

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR));
    if(GetIsObjectValid(oHide)) SendMessageToPC(oPC, "Hide created, should be equipped");
    else SendMessageToPC(oPC, "Hide creation failed");
}

void main()
{
    object oPC = GetPCSpeaker();

    if(GetLocalInt(oPC, "WOW_EQUIP_HIDE"))
    {
        DeleteLocalInt(oPC, "WOW_EQUIP_HIDE");
        object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
        if(GetIsObjectValid(oHide)) DestroyObject(oHide);
        DelayCommand(1.0, wow_EquipHide(oPC));
    }
    WalkWayPoints();
}
