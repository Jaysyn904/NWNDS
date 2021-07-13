//::////////////////////////////////////////////////////////////////////////////
//:: Store Open Script
//:: ar_st_ingredient
//:: For slightly faster store restocking
//::    -DM Heatstroke
//::////////////////////////////////////////////////////////////////////////////
/*
    This script will allow stores to partially reset
    themselves to their original state after some
    time has passed.

    Intended for persistent worlds.
*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: The Krit
//:: Created On: 3/2/07
//:: Replaces the "do-nothing" BioWare script.
//::////////////////////////////////////////////////////////////////////////////
//::////////////////////////////////////////////////////////////////////////////
//
// This script will cause a store's finite inventory
// and limited gold to be (partially) replenished
// after a certain amount of time passes. It will also
// clean out new items and excess gold. I call this
// restocking.
//
// The timer starts when the store is first opened
// after server rest or the last restock. The time
// is random, but will be at least RESTOCK_TIME_FIXED
// real-time hours. The random component of the time
// is added to this minimum, and will range from 0
// to RESTOCK_TIME_VARIABLE minutes.
//
// Items are only replaced if all of that type have
// been sold (and not bought back). The chance for an
// item to be replaced is RESTOCK_CHANCE.
//
// Items not in the store's original inventory have a
// chance to be removed (sold to unspecified NPC's, if
// you will) when the store restocks. This chance is
// UNSTOCK_CHANCE.
//
// After the store restocks, the store's gold supply -- if
// limited -- will be no more than GOLD_MAX_FRACTION times
// its starting value.
//
// After the store restocks, the store's gold supply -- if
// limited -- will be no less than GOLD_MIN_FRACTION times
// its starting value.
//
// If you try to mess with things and make GOLD_MAX_FRACTION
// less than GOLD_MIN_FRACTION, you deserve whatever happens.
// You may also smack yourself for making trouble. :)
//
//::////////////////////////////////////////////////////////////////////////////
//
// The variables mentioned above are set globally below.
// In addition, you can change the value for a particular
// store by setting a local variable of the same name
// (and type) on the store.
// NOTE: These variables must be set on the *store*, not
// the merchant.
//
//::////////////////////////////////////////////////////////////////////////////
//
// This script will (likely) break if you switch a
// store from unlimited gold to limited gold through
// scripting. Don't do that. There would be no
// original gold level to refer to when restocking.
//
//::////////////////////////////////////////////////////////////////////////////


// The following is the minimum number of real-time (not
// game-time) hours that elapse before a store gets
// restocked.
const int RESTOCK_TIME_FIXED = 1;

// The following is the maximum number of minutes (not
// hours) that a restock might be delayed beyond the
// above minimum number of hours.
const int RESTOCK_TIME_VARIABLE = 1;

// The following is the chance (percentage) that a depleted
// item will be replaced when the restocking occurs. Each
// item rolls this percentage individually.
const int RESTOCK_CHANCE = 75;

// The following is the chance (percentage) that an item
// not in the store's original inventory will be removed
// when a restocking occurs.
const int UNSTOCK_CHANCE = 15;

// The following is the fraction (floating point) of the
// stores original gold that is the most a store can have
// after restocking.
// (No effect on stores with unlimited gold.)
const float GOLD_MAX_FRACTION = 1.20;

// The following is the fraction (floating point) of the
// stores original gold that is the least a store can have
// after restocking.
// (No effect on stores with unlimited gold.)
const float GOLD_MIN_FRACTION = 0.80;


// The following are names of local variables used by
// this script.
const string STORE_GOLD      = "TK_STORE_STARTING_GOLD";
const string ORIG_INVENTORY  = "TK_STORE_STARTING_INVENTORY_";
const string CUR_INVENTORY   = "TK_STORE_CURRENT_INVENTORY_";
const string INVENTORY_STACK = "TK_STORE_INVENTORY_STACK_LIST_";
const string INVENTORY_LIST  = "TK_STORE_INVENTORY_LIST_";
const string INVENTORY_SIZE  = "TK_STORE_INVENTORY_SIZE";
const string INVENTORIED     = "TK_STORE_DID_INVENTORY";
const string RESTOCK_ORDERED = "TK_STORE_DID_DELAY";


// Records the store's current (starting) inventory.
void DoInventory();

// Restocks the store.
void Restock();


//////////////////////////////////////////////////
// main()
//
// Intended for a store's OnOpenStore event, replacing the BioWare default.
//
void main()
{
    // See if the store's original inventory has been recorded.
    if ( !GetLocalInt(OBJECT_SELF, INVENTORIED) )
    {
        // Record the current inventory.
        DoInventory();
        SetLocalInt(OBJECT_SELF, INVENTORIED, TRUE);
    }

    // See if a restock is currently on delay.
    if ( !GetLocalInt(OBJECT_SELF, RESTOCK_ORDERED) )
    {
        // Determine the restock times (possibly stored locally).
        int nRestockHours = GetLocalInt(OBJECT_SELF, "RESTOCK_TIME_FIXED");
        if ( nRestockHours == 0 )
            nRestockHours = RESTOCK_TIME_FIXED;
        int nRestockMinutes = GetLocalInt(OBJECT_SELF, "RESTOCK_TIME_VARIABLE");
        if ( nRestockMinutes == 0 )
            nRestockMinutes = RESTOCK_TIME_VARIABLE;

        // Order (delay) a restock.
        DelayCommand( TurnsToSeconds(60*nRestockHours + Random(nRestockMinutes+1)),
                      Restock());
        SetLocalInt(OBJECT_SELF, RESTOCK_ORDERED, TRUE);
    }
}


//////////////////////////////////////////////////
// DoInventory()
//
// Records the store's current (starting) inventory.
//
void DoInventory()
{
    // Record the store's current gold.
    SetLocalInt(OBJECT_SELF, STORE_GOLD, GetStoreGold(OBJECT_SELF));

    // Record the store's current inventory.
    int nCount = 0;
    object oItem = GetFirstItemInInventory();
    while ( oItem != OBJECT_INVALID )
    {
        // We are only concerned with items in finite supply.
        if ( !GetInfiniteFlag(oItem) )
        {
            string sResRef = GetResRef(oItem);
            // Set a boolean flag based on the blueprint name.
            SetLocalInt(OBJECT_SELF, ORIG_INVENTORY + sResRef, TRUE);
            // Add sResRef to the list of blueprints.
            SetLocalString(OBJECT_SELF, INVENTORY_LIST + IntToString(nCount), sResRef);
            // Record the stack size.
            SetLocalInt(OBJECT_SELF, INVENTORY_STACK + IntToString(nCount), GetItemStackSize(oItem));
            // Update the count.
            nCount++;
        }
        // Next item.
        oItem = GetNextItemInInventory();
    }

    // Record the length of the list of blueprints.
    SetLocalInt(OBJECT_SELF, INVENTORY_SIZE, nCount);
}


//////////////////////////////////////////////////
// Restock()
//
// Restocks the store.
//
void Restock()
{
    // Check the store's gold.
    int nCurGold = GetStoreGold(OBJECT_SELF);

    // We are only concerned if the store has limited gold.
    if ( nCurGold > -1 )
    {
        // Determine the min and max gold fractions (possibly stored locally).
        float fGoldMin = GetLocalFloat(OBJECT_SELF, "GOLD_MIN_FRACTION");
        if ( fGoldMin == 0.0 )
            fGoldMin = GOLD_MIN_FRACTION;
        float fGoldMax = GetLocalFloat(OBJECT_SELF, "GOLD_MAX_FRACTION");
        if ( fGoldMax == 0.0 )
            fGoldMax = GOLD_MAX_FRACTION;

        // Calculate the minimum and maximum gold levels.
        int nOrigGold = GetLocalInt(OBJECT_SELF, STORE_GOLD);
        int nMinGold = FloatToInt(IntToFloat(nOrigGold) * fGoldMin);
        int nMaxGold = FloatToInt(IntToFloat(nOrigGold) * fGoldMax);

        // Check for too little gold.
        if ( nCurGold < nMinGold )
            SetStoreGold(OBJECT_SELF, nMinGold);
        // Check for too much gold.
        else if ( nCurGold > nMaxGold )
            SetStoreGold(OBJECT_SELF, nMaxGold);
    }

    // Determine the unstock chance (possibly stored locally).
    int nUnstockChance = GetLocalInt(OBJECT_SELF, "UNSTOCK_CHANCE");
    if ( nUnstockChance == 0 )
        nUnstockChance = UNSTOCK_CHANCE;

    // Scan the store's current inventory.
    // Record which original items are still around.
    // Possibly remove non-original items.
    object oItem = GetFirstItemInInventory();
    while ( oItem != OBJECT_INVALID )
    {
        // We are only concerned with items in finite supply.
        if ( !GetInfiniteFlag(oItem) )
        {
            string sResRef = GetResRef(oItem);

            // See if this item is an original item.
            if ( GetLocalInt(OBJECT_SELF, ORIG_INVENTORY + sResRef) )
            {
                // Set a boolean flag (temporarily) based on the blueprint name.
                SetLocalInt(OBJECT_SELF, CUR_INVENTORY + sResRef, TRUE);
                DelayCommand(0.0, DeleteLocalInt(OBJECT_SELF, CUR_INVENTORY + sResRef));
            }
            // See if this (not original) item should be removed.
            else if ( d100() <= nUnstockChance )
                // Delete this item.
                DestroyObject(oItem);
        }
        // Next item.
        oItem = GetNextItemInInventory();
    }

    // Determine the restock chance (possibly stored locally).
    int nRestockChance = GetLocalInt(OBJECT_SELF, "RESTOCK_CHANCE");
    if ( nRestockChance == 0 )
        nRestockChance = RESTOCK_CHANCE;

    // Loop through the list of items that might be restored.
    int nCount = GetLocalInt(OBJECT_SELF, INVENTORY_SIZE);
    while ( nCount-- > 0 )
    {
        string sResRef = GetLocalString(OBJECT_SELF, INVENTORY_LIST + IntToString(nCount));

        // Make sure no items of this type are in the store's inventory (before this loop).
        if ( !GetLocalInt(OBJECT_SELF, CUR_INVENTORY + sResRef) )
            // See if this item should be restocked.
            if ( d100() <= nRestockChance )
                // Add this item to the store.
                CreateItemOnObject(sResRef, OBJECT_SELF,
                    GetLocalInt(OBJECT_SELF, INVENTORY_STACK + IntToString(nCount)));
    }

    // Restocking is no longer in progress.
    SetLocalInt(OBJECT_SELF, RESTOCK_ORDERED, FALSE);
}
