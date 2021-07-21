
 // Use x2_it_example as a base for building more complicated items, that is items
// that will fire a script on more than one event
#include "x2_inc_switches"
//#include "prc_class_const"

const int CLASS_TYPE_GLADIATOR=45;

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
        // If they aren't a lvl 21 gladiator, unequip the item
        if(GetLevelByClass(45, oPC) <= 20)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionUnequipItem(oItem));
        }
    }
}

