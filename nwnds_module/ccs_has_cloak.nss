int StartingConditional()
{
    object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, GetPCSpeaker());
    if(oCloak == OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
