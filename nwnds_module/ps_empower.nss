/************************************
*   Empower                         *
*                                   *
*   Cost: 16                        *
*   Power Score: Wis -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=16;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_EMPOWER);
    effect eVis=EffectVisualEffect(VFX_IMP_RESTORATION_LESSER);
    int nBonus=nLevel/4;
    itemproperty ipEnhance=ItemPropertyEnhancementBonus(nBonus);
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
        if(GetItemHasItemProperty(oTarget, ITEM_PROPERTY_ENHANCEMENT_BONUS)
            || !GetIsWeapon(oTarget))
        {
            FloatingTextStringOnCreature("You cannot empower this item.", oPC, FALSE);
        }

        else
        {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_EMPOWER, FALSE));

            if(GetBaseItemType(oTarget)==BASE_ITEM_GLOVES)
                ipEnhance=ItemPropertyAttackBonus(nBonus);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oCreatureTarget);
            AddItemProperty(DURATION_TYPE_TEMPORARY, ipEnhance, oTarget, HoursToSeconds(nDuration));
            AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyVisualEffect(ITEM_VISUAL_HOLY), oTarget, HoursToSeconds(nDuration));

        }
    }
}
