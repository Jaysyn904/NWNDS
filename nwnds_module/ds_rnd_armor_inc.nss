//
// NWN Dark Sun Random Armor Include
//
// By: Jaysyn
//

// Test VOID
//void main(){}

void RndDwarfGuardArmor(object oPC)
{
    //Randomizes Armor

    int nResult = d6(1);
    int nStackSize = 1; // Create 1 items;

    object oArmor;

    string sItem;

    if (nResult == 1)
        {
            sItem = "AR_ALTSL_BONE01";
        }
    else if(nResult == 2)
        {
            sItem = "AR_ALTSL_IVORY";
        }
    else if(nResult == 3)
        {
            sItem = "DS_AMDBP_KLED001";
        }
    else if(nResult ==4)
        {
            sItem = "AR_ALTLT_MEKILOT";
        }
    else if(nResult == 5)
        {
            sItem = "DS_AMDBP_KLED002";
        }
    else
        sItem = "DS_AMDBP_KLED003";

    CreateItemOnObject(sItem, OBJECT_SELF, nStackSize);

    AssignCommand(OBJECT_SELF, ActionEquipMostEffectiveArmor());

        // Loop the object's inventory and equip the first
    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while(GetIsObjectValid(oItem))
    {
        // Check if armor, of course
        if(GetBaseItemType(oItem) == BASE_ITEM_ARMOR)
        {
            // Equip it and stop the script
            AssignCommand(OBJECT_SELF, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));
            return;
        }

        oItem = GetNextItemInInventory(OBJECT_SELF);
    }
    DelayCommand(3.5f, ActionEquipMostEffectiveArmor());
}

void GuardArmor(object oPC)
{
        //Randomizes Armor
    int nResult = d6(1);
    object oArmor;
    string sItem;
    if (nResult == 1)
        {
            sItem = "AR_ALTSL_BONE01";
        }
    else if(nResult == 2)
        {
            sItem = "AR_ALTSL_IVORY";
        }
    else if(nResult == 3)
        {
            sItem = "AR_ALTLT_LEATHER";
        }
    else if(nResult ==4)
        {
            sItem = "AR_ALTLT_MEKILOT";
        }
    else if(nResult == 5)
        {
            sItem = "AR_ALTPD_CLOTH01";
        }
    else
        sItem = "AR_ACLCL_HARNESS";

    DelayCommand(3.0, ActionEquipItem(CreateItemOnObject(sItem), INVENTORY_SLOT_CHEST));
}

