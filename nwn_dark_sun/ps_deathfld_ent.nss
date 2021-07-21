/************************************
*   Death Field onEnter script      *
*                                   *
* Inflicts 1d6 damage per 2 levels  *
* of the Psionicist.                *
*                                   *
*************************************/

#include "lib_psionic"

void DeathField(object oTarget, object oPC)
{
    string sVarName=GetName(oPC)+"Field";
    int nState=GetLocalInt(oTarget, sVarName);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DEATH_FIELD);
    int nDamage;
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION);

    //apply damage
    if(nState==1)
    {

        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DEATH_FIELD, TRUE));
        nDamage=GetEnhancedEffect(d6((nLevel/2 > 10)?10:nLevel/2), FEAT_PSIONIC_DEATH_FIELD);

        if (GetRacialType(oTarget)==IP_CONST_RACIALTYPE_UNDEAD)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nDamage), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE), oTarget);
        }

        else if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NEGATIVE, oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oTarget);
        }

        else
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage/2, DAMAGE_TYPE_NEGATIVE), oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oTarget);
        }

        DelayCommand(6.0, DeathField(oTarget, oPC));
    }

    else if(nState==-1) DeleteLocalInt(oTarget, sVarName);

}


void main()
{
    object oPC=GetAreaOfEffectCreator();
    object oTarget=GetEnteringObject();
    string sVarName=GetName(oPC)+"Field";
    int nState=GetLocalInt(oTarget, sVarName);

    if (oTarget==oPC) return;

    //if in a neutral state, set the field to active and start the damage recurring
    if(nState==0)
    {
        SetLocalInt(oTarget, sVarName, 1);
        DeathField(oTarget, oPC);
    }

    //if oTarget has gone out and back in the field before the timer has reset,
    //reactivate the field but don't call another death field instance
    else if(nState==-1)
        SetLocalInt(oTarget, sVarName, 1);

}
