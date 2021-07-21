/************************************
*   Psychic Blade                   *
*                                   *
*   Cost: 21                        *
*   Power Score: Con -2             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=21;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSYCHIC_BLADE);
    effect eVis=EffectVisualEffect(VFX_IMP_RESTORATION_LESSER);
    object oBlade;
    int nCurrentTime=GetRealTime();
    int nBonus=nLevel/4;
    int nDC=(nLevel/4)-3<6?(nLevel/4)-3:6; //see nwscript.nss for IP_CONST_ONHIT_SAVEDC_*

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSYCHIC_BLADE)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_PSYCHIC_BLADE, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    oBlade=CreateItemOnObject("ps_psychblade_it", oPC);
    AssignCommand(oPC, ActionEquipItem(oBlade, INVENTORY_SLOT_RIGHTHAND));
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyEnhancementBonus(nBonus), oBlade, TurnsToSeconds(nDuration));

    if(nLevel>=20)
        AddItemProperty(DURATION_TYPE_TEMPORARY,
            ItemPropertyOnHitProps(IP_CONST_ONHIT_STUN, nDC,
                IP_CONST_ONHIT_DURATION_50_PERCENT_2_ROUNDS), oBlade, TurnsToSeconds(nDuration));

    if(nLevel>=10)
        AddItemProperty(DURATION_TYPE_TEMPORARY,
            ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d6), oBlade, TurnsToSeconds(nDuration));

    DestroyObject(oBlade, TurnsToSeconds(nDuration));
    SetLocalInt(oBlade, "BladeExpiration", nCurrentTime+FloatToInt(TurnsToSeconds(nDuration)));
}

