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
        // If they aren't a Fighter or are a Druid or a Villichi, unequip the item
        if((GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) <= 0) ||
           (GetLevelByClass(CLASS_TYPE_DRUID, oPC) >= 1) ||
           (GetStringLowerCase(GetSubRace(oPC)) == "villichi"))
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionUnequipItem(oItem));
        }
    }
}
