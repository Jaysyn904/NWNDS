// Set this to the max cloak models you have in your mod
//const int CCS_MAX_CLOAK_MODELS = 14; // Standard NWN Cloaks
const int CCS_MAX_CLOAK_MODELS = 79; // Standard + Lisa's + an invisible Cloak

void main()
{
    // Find current cloak model and increment by 1
    int nModel = GetLocalInt(OBJECT_SELF, "current_cloak_model");
    nModel = nModel + 1;
    // Reset to 1 if past max
    if(nModel > CCS_MAX_CLOAK_MODELS) nModel = 60;
    SetLocalInt(OBJECT_SELF, "current_cloak_model", nModel);
    // Unequip current cloak
    object oOldCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, OBJECT_SELF);
    AssignCommand(OBJECT_SELF, ActionUnequipItem(oOldCloak));
    // Equip next cloak
    object oNewCloak = GetItemPossessedBy(OBJECT_SELF, "cloak_model_" + IntToString(nModel));
    AssignCommand(OBJECT_SELF, ActionEquipItem(oNewCloak, INVENTORY_SLOT_CLOAK));
    DelayCommand(1.0, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 5.0));
}
