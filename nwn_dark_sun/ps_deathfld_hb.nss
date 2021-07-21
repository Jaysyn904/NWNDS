/************************************
*   Death Field Heartbeat script    *
*                                   *
* Inflicts 1d6 damage per 2 levels  *
* of the Psionicist.                *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{

    //Deprecated.  Script retained only for compatibility.

/*
    object oPC=GetAreaOfEffectCreator();
    object oTarget=GetFirstInPersistentObject();
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DEATH_FIELD);
    int nDamage;
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION);

    while(GetIsObjectValid(oTarget))
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DEATH_FIELD, TRUE));
        nDamage=(nLevel/2 > 10)?GetEnhancedEffect(d6(10), FEAT_PSIONIC_DEATH_FIELD):GetEnhancedEffect(d6(nLevel/2), FEAT_PSIONIC_DEATH_FIELD);

        if (oTarget!=oPC && GetRacialType(oTarget)==IP_CONST_RACIALTYPE_UNDEAD)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nDamage), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE), oTarget);
        }

        else if (oTarget!=oPC && !FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE, oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oTarget);
        }

        else if (oTarget!=oPC)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage/2, DAMAGE_TYPE_NEGATIVE), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oTarget);
        }

        oTarget=GetNextInPersistentObject();
    }
*/
}
