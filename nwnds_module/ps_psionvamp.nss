/************************************
*   Psionic Vampirism               *
*                                   *
*   Cost: 0                         *
*   Power Score: Wis -3             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    PSPCheck(oPC);
    int nPSP=GetPSP(oPC);
    int nCost=0;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_IMP_STUN);
    object oTarget=GetSpellTargetObject();
    PSPCheck(oTarget);
    int nTargPSP=GetPSP(oTarget);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSIONIC_VAMPIRISM);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSIONIC_VAMPIRISM, TRUE)) return;

    int nDamage=(nLevel>20)?d6(20):d6(nLevel);
    nDamage=GetEnhancedEffect(nDamage, FEAT_PSIONIC_PSIONIC_VAMPIRISM);

    if (GetIsDead(oTarget))
    {
        FloatingTextStringOnCreature("This creature is dead.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }


    if (GetTag(oTarget)=="PsychicClone" || oPC==oTarget)
    {
        FloatingTextStringOnCreature("You cannot drain yourself.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    else if (nTargPSP==0)
    {
        FloatingTextStringOnCreature("This creature has no psionic ability", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    else if (nTargPSP<nDamage)
    {
        nTargPSP=0;
        nPSP=nPSP+nTargPSP;
    }

    else
    {
        if (WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC))
            nDamage=nDamage/2;

        nTargPSP=nTargPSP-nDamage;
        nPSP=nPSP+nDamage;
    }
    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_PSIONIC_VAMPIRISM, TRUE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

    SetPSP(oPC, nPSP);
    SendMessageToPC(oPC, "Remaining Psionic Strength Points: "+IntToString(nPSP));

    SetPSP(oTarget, nTargPSP);
    SendMessageToPC(oTarget, "Remaining Psionic Strength Points: "+IntToString(nTargPSP));

}
