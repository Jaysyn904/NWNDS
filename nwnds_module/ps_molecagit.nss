/************************************
*   Molecular Agitation             *
*                                   *
*   Cost: 19                        *
*   Power Score: Wis                *
*                                   *
************************************/

#include "lib_psionic"

void MolecularAgitation(object oTarget, object oPC, int nRound, int nMult)
{
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MOLECULAR_AGITATION);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nDamage;
    effect eVis=EffectVisualEffect(VFX_COM_HIT_FIRE);
    effect eLink;

    if(nRound==1) nDamage=nMult*nLevel/2;
    else if(nRound==2) nDamage=nMult*d4(nLevel/2);
    else if(nRound>=3) nDamage=nMult*d6(nLevel/2);

    if (FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_FIRE, oPC))
        nDamage=nDamage/2;

    eLink=EffectDamage(nDamage/EFFECT_SCALING_FACTOR, DAMAGE_TYPE_FIRE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);

    if (nRound<4) DelayCommand(6.0, MolecularAgitation(oTarget, oPC, nRound+1, nMult));
    else DeleteLocalInt(oTarget, "MolecAgi");

}

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=19;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM);
    effect eVis=EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD);
    object oTarget=GetSpellTargetObject();


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MOLECULAR_AGITATION)) return;

    if (GetLocalInt(oTarget, "MolecAgi"))
    {
        FloatingTextStringOnCreature("This target is already under the effects of molecular agitation.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_MOLECULAR_AGITATION, TRUE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    SetLocalInt(oTarget, "MolecAgi", TRUE);
    MolecularAgitation(oTarget, oPC, 1, GetEnhancedEffect(EFFECT_SCALING_FACTOR, SPELL_PSIONIC_MOLECULAR_AGITATION));

}
