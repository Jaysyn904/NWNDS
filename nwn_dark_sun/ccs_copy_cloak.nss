object MatchItem(object oItem, object oDonor, int nType, int nIndex)
{
    int nValue = GetItemAppearance(oDonor,nType,nIndex);
    object oNew = CopyItemAndModify(oItem,nType,nIndex,nValue);
    DestroyObject(oItem);
    return oNew;
}

object ModifyCloakModel(object oItem, int nNewValue)
{
    // Bodge for CopyItemAndModify not working on cloak appearance in NWN v1.68
    // Create a new cloak with the correct model
    object oNewItem = CreateItemOnObject("cloak_model_" + IntToString(nNewValue),OBJECT_SELF);
    // Copy across all the colours for it
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_CLOTH1);
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_CLOTH2);
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_LEATHER1);
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_LEATHER2);
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_METAL1);
    oNewItem = MatchItem(oNewItem,oItem,ITEM_APPR_TYPE_ARMOR_COLOR,ITEM_APPR_ARMOR_COLOR_METAL2);
    itemproperty iProp = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(iProp))
        {
        if (GetItemPropertyDurationType(iProp) == DURATION_TYPE_PERMANENT)
            {
            AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oNewItem);
            iProp = GetNextItemProperty(oItem);
            }
        }
    SetName(oNewItem,GetName(oItem));
    return oNewItem;
}

void main()
{
    object oPC = GetPCSpeaker();
    // Get the current cloak model shown on NPC
    int nModel = GetLocalInt(OBJECT_SELF, "current_cloak_model");
    object oOldCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
    // Unequip PCs cloak
    AssignCommand(oPC, ActionUnequipItem(oOldCloak));
    // Modify the cloak
    object oNewCloak = ModifyCloakModel(oOldCloak, nModel);
    DestroyObject(oOldCloak);
    // Copy the cloak from the NPC to the PC
    object oCloak = CopyItem(oNewCloak, oPC, TRUE);
    DestroyObject(oNewCloak, 1.0);
    // Equip it for them
    AssignCommand(oPC, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK));
}
