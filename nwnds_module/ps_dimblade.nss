/************************************
*   Dimensional Blade               *
*                                   *
*   Cost: 16                        *
*   Power Score: Wis -2             *
*                                   *
************************************/

#include "lib_psionic"

//returns TRUE if oItem is a slashing or piercing weapon
int GetIsSlashingOrPiercing(object oItem)
{
    int nItem = GetBaseItemType(oItem);

    if( (nItem == BASE_ITEM_BASTARDSWORD)
        || (nItem == BASE_ITEM_BATTLEAXE)
        || (nItem == BASE_ITEM_DOUBLEAXE)
        || (nItem == BASE_ITEM_GREATAXE)
        || (nItem == BASE_ITEM_GREATSWORD)
        || (nItem == BASE_ITEM_HALBERD)
        || (nItem == BASE_ITEM_HANDAXE)
        || (nItem == BASE_ITEM_KAMA)
        || (nItem == BASE_ITEM_KATANA)
        || (nItem == BASE_ITEM_KUKRI)
        || (nItem == BASE_ITEM_LONGSWORD)
        || (nItem == BASE_ITEM_SCIMITAR)
        || (nItem == BASE_ITEM_SCYTHE)
        || (nItem == BASE_ITEM_SICKLE)
        || (nItem == BASE_ITEM_TWOBLADEDSWORD)
        || (nItem == BASE_ITEM_DWARVENWARAXE)
        || (nItem == BASE_ITEM_THROWINGAXE)
        || (nItem == BASE_ITEM_WHIP)
        || (nItem == BASE_ITEM_ARROW)
        || (nItem == BASE_ITEM_DAGGER)
        || (nItem == BASE_ITEM_DART)
        || (nItem == BASE_ITEM_RAPIER)
        || (nItem == BASE_ITEM_SHORTSPEAR)
        || (nItem == BASE_ITEM_SHORTSWORD)
        || (nItem == BASE_ITEM_SHURIKEN) )
   {
        return TRUE;
   }

   else return FALSE;
}


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_EMPOWER);
    effect eVis=EffectVisualEffect(VFX_IMP_RESTORATION_LESSER);
    itemproperty ipEnhance=ItemPropertyKeen();
    object oTarget=GetSpellTargetObject();
    object oCreatureTarget=oPC;
    if(GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)
    {
        oCreatureTarget=oTarget;
        oTarget=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
    }


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_EMPOWER)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    if(GetIsObjectValid(oTarget))
    {
        if(!GetIsSlashingOrPiercing(oTarget)
            || GetItemHasItemProperty(oTarget, ITEM_PROPERTY_KEEN)
            || !GetIsWeapon(oTarget))
        {
            FloatingTextStringOnCreature("You cannot empower this item.", oPC, FALSE);
        }

        else
        {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_EMPOWER, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oCreatureTarget);
            AddItemProperty(DURATION_TYPE_TEMPORARY, ipEnhance, oTarget, HoursToSeconds(nDuration));
        }
    }
}
