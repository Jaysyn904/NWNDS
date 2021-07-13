/************************************
*   Stunning Strike                 *
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
    int nDC=(nLevel/4)-3<6?(nLevel/4)-3:6; //see nwscript.nss for IP_CONST_ONHIT_SAVEDC_*
    itemproperty ipEnhance=ItemPropertyOnHitProps(IP_CONST_ONHIT_STUN, nDC,
                IP_CONST_ONHIT_DURATION_50_PERCENT_2_ROUNDS);

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
        if(GetItemHasItemProperty(oTarget, ITEM_PROPERTY_ON_HIT_PROPERTIES)
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
