/************************************
*   Chemical Simulation, Acid       *
*                                   *
*   Cost: 9                         *
*   Power Score: Con -3             *
*                                   *
************************************/

#include "lib_psionic"

void AcidBurn(object oTarget, object oCaster, int nRoundsLeft, int nMult)
{
    effect eVis=EffectVisualEffect(VFX_IMP_ACID_S);
    int nLevel=GetEffectivePsionicLevel(oCaster, FEAT_PSIONIC_CHEMICAL_SIMULATION);
    int nDamage=(nMult*d6(nRoundsLeft))/EFFECT_SCALING_FACTOR;
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION, oCaster);

    if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_ACID, oCaster))
            nDamage=nDamage/2;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ACID), oTarget);

    nRoundsLeft--;
    if(nRoundsLeft>0) DelayCommand(6.0, AcidBurn(oTarget, oCaster, nRoundsLeft, nMult));
}


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=9;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_ACID_S);
    int nDuration=4;
    object oTarget=GetSpellTargetObject();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CHEMICAL_SIMULATION)) return;

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_CHEMICAL_SIMULATION));

    if(TouchAttackMelee(oTarget))
    {
        AcidBurn(oTarget, oPC, nDuration, GetEnhancedEffect(EFFECT_SCALING_FACTOR, FEAT_PSIONIC_CHEMICAL_SIMULATION));
    }

}
