// Use x2_it_example as a base for building more complicated items, that is items
// that will fire a script on more than one event
#include "x2_inc_switches"
void main()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oPC;
    object oItem;

    // * This code runs when the item is equipped
    // * Note that this event fires PCs only
    if (nEvent ==X2_ITEM_EVENT_EQUIP)
    {

        oPC = GetPCItemLastEquippedBy();
        oItem = GetPCItemLastEquipped();
        // If they don't have Fire domain, unequip the item
        if(!GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oPC))
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionUnequipItem(oItem));
        }
    }
}
