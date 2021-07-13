/************************************
*   Cosmic Awareness                *
*                                   *
*   Cost: 20                        *
*   Power Score: Wis -6             *
*                                   *
*************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=20;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-6;
    effect eVis=EffectVisualEffect(VFX_DUR_PROT_PREMONITION);
    eVis=EffectLinkEffects(EffectVisualEffect(VFX_DUR_LIGHT_WHITE_20), eVis);
    eVis=EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT), eVis);
    eVis=EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), eVis);
    effect eLink=EffectTrueSeeing();
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_TRAP), eLink);
    eLink=EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_SNEAK_ATTACK), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_COSMIC_AWARENESS);
    object oHide=GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_COSMIC_AWARENESS)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    if(GetIsObjectValid(oHide) && GetResRef(oHide)!="" )
    {
        AddItemProperty(DURATION_TYPE_TEMPORARY,
            ItemPropertySpellImmunitySchool(SPELL_SCHOOL_ILLUSION), oHide, TurnsToSeconds(nDuration));
    }

    else
    {
        oHide=CreateItemOnObject("ps_cosaware_it", oPC);
        DelayCommand(0.2, AssignCommand(oPC, ClearAllActions()));
        DelayCommand(0.2, AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR)));
        DelayCommand(0.2, AddItemProperty(DURATION_TYPE_TEMPORARY,
            ItemPropertySpellImmunitySchool(SPELL_SCHOOL_ILLUSION), oHide, TurnsToSeconds(nDuration)));
        DestroyObject(oHide, TurnsToSeconds(nDuration));
    }

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_COSMIC_AWARENESS, FALSE));

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));

}
