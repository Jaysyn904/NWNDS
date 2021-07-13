int GetTotalPlayerItemCost(object oPlayer);

void main()
{
    object oPlayer;
    int nTotalPlayerCost;

    oPlayer = GetPCSpeaker();

    nTotalPlayerCost = GetTotalPlayerItemCost(oPlayer);
    SetCustomToken(500,IntToString(nTotalPlayerCost));
}


int GetTotalPlayerItemCost( object oPlayer )
{
    int nCount, nTotalCost = 0;
    object oItem;

    // Calculate the total cost of items in the creature's
    // repository
    oItem = GetFirstItemInInventory(oPlayer);
    while ( GetIsObjectValid(oItem) == TRUE )
    {
        nTotalCost += GetGoldPieceValue(oItem);
        oItem = GetNextItemInInventory(oPlayer);
    }

    // Now iterate through each inventory slot and compute
    // the cost of the item (if one exists in that slot)
    // - BKH - Jun/09/02
    for ( nCount = 0; nCount < NUM_INVENTORY_SLOTS; nCount++ )
    {
        oItem = GetItemInSlot(nCount,oPlayer);
        if ( GetIsObjectValid(oItem) )
        {
            nTotalCost += GetGoldPieceValue(oItem);
        }
    }

    return nTotalCost;
}
