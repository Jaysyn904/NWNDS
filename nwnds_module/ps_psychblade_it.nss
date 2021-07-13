#include "x2_inc_switches"
#include "lib_psionic"

void main()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oPC;
    object oItem;

    if (nEvent ==X2_ITEM_EVENT_UNEQUIP)
    {

        oPC    = GetPCItemLastUnequippedBy();
        oItem  = GetPCItemLastUnequipped();

        DestroyObject(oItem);
    }

    else if ( nEvent ==X2_ITEM_EVENT_ONHITCAST)
    {
        oItem  =  GetSpellCastItem();

        if(GetRealTime()>=GetLocalInt(oItem, "BladeExpiration"))
            DestroyObject(oItem);
    }

}
