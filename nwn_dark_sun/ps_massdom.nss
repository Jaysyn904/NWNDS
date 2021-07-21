/************************************
*   Mass Domination                 *
*                                   *
*   Cost: 36                        *
*   Power Score: Wis -6             *
*                                   *
************************************/

#include "lib_psionic"
#include "x0_inc_henai"

void DominationSimulation(object oSlave=OBJECT_SELF);
int GetDominatedCount(object oPC=OBJECT_SELF);


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=36;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-6;
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_DOMINATE_S));
    effect eLink=EffectCurse(0,0,0,1,0,0);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MASS_DOMINATION);
    object oTarget=GetSpellTargetObject();
    location lTargLoc=GetLocation(oTarget);
    if (!GetIsObjectValid(oTarget))
        lTargLoc=GetSpellTargetLocation();
    oTarget=GetFirstObjectInShape(SHAPE_SPHERE, 4.0, lTargLoc, TRUE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);
    int nDominatedTot=GetDominatedCount(oPC);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MASS_DOMINATION)) return;

    int nDuration=GetEnhancedDuration(3+nLevel);

    SetMaxHenchmen(GetMaxHenchmen()+(3-nDominatedTot));
    DelayCommand(RoundsToSeconds(nDuration)+0.3, SetMaxHenchmen(GetMaxHenchmen()-(3-nDominatedTot)));

    while (GetIsObjectValid(oTarget) && nDominatedTot<3)
    {

        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DOMINATION, TRUE));

        if (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC) && !(nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
            && !(GetFactionEqual(oTarget, oPC)))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
            nDominatedTot++;

            AddHenchman(oPC, oTarget);
            DelayCommand(0.1, AssignCommand(oTarget, ClearAllActions()));
            DelayCommand(1.0, DominationSimulation(oTarget));
            DelayCommand(RoundsToSeconds(nDuration), RemoveHenchman(oPC, oTarget));
            DelayCommand(RoundsToSeconds(nDuration)+0.5, SetIsTemporaryEnemy(oPC, oTarget));

        }

        oTarget=GetNextObjectInShape(SHAPE_SPHERE, 4.0, lTargLoc, TRUE);
    }
}


void DominationSimulation(object oSlave=OBJECT_SELF)
{
    object oMaster=GetMaster(oSlave);
    if (!GetIsPC(oMaster)) oMaster=GetMaster(oMaster);

    if (!GetIsObjectValid(oMaster))
    {
        AssignCommand(oSlave, ClearAllActions());
        DelayCommand(0.2, AssignCommand(oSlave, DetermineCombatRound()));
        return;
    }
    object oMasterFighting=GetLastHostileActor(oMaster);

    int bMasterFighting=GetIsInCombat(oMaster);
    int bSlaveFighting=GetIsInCombat(oSlave);

    if (!bSlaveFighting)
    {

        if (GetAttackTarget(oMasterFighting)==oMaster)
        {
            AssignCommand(oSlave, ClearAllActions());
            DelayCommand(0.2, AssignCommand(oSlave, ActionAttack(oMasterFighting)));
            DelayCommand(0.3, AssignCommand(oSlave, HenchmenCombatRound(oMasterFighting)));
        }

        else
        {
            AssignCommand(oSlave, ClearAllActions());
            DelayCommand(0.2, AssignCommand(oSlave, ActionForceFollowObject(oMaster, 1.8)));
        }
    }

    else if (GetDistanceBetween(oSlave, GetAttackTarget(oSlave)) >= 20.0)
    {
        ClearAllActions();
    }

    DelayCommand(3.0, DominationSimulation(oSlave));

}

int GetDominatedCount(object oPC=OBJECT_SELF)
{
    object oGroupee=GetFirstFactionMember(oPC, FALSE);
    effect eEff;
    int nDomCount=0;

    while(GetIsObjectValid(oGroupee))
    {
        eEff=GetFirstEffect(oGroupee);

        while(GetIsEffectValid(eEff))
        {
            if(GetEffectCreator(eEff)==oPC
                && GetEffectSpellId(eEff)==SPELL_PSIONIC_MASS_DOMINATION
                && GetEffectType(eEff)==EFFECT_TYPE_CURSE )
            {
                nDomCount++;
                break;
            }

            eEff=GetNextEffect(oGroupee);
        }

        oGroupee=GetNextFactionMember(oPC, FALSE);
    }

    return nDomCount;
}


