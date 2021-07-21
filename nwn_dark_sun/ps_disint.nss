/************************************
*   Disintegrate                    *
*                                   *
*   Cost: 40                        *
*   Power Score: Con -6             *
*                                   *
************************************/

#include "lib_psionic"

void DestroyAllItems(object oTarg);

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=40;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-6;
    effect eVis=EffectVisualEffect(VFX_IMP_BREACH);
    effect eLink=EffectVisualEffect(447); //VFX_BEAM_DISINTEGRATE
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DISINTEGRATE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM);
    int nDamage=d6(nLevel/2);
    object oTarget=GetSpellTargetObject();


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DISINTEGRATE)) return;

    location lWhere=GetLocation(oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 0.9);
    DelayCommand(0.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lWhere));

    DelayCommand(0.1, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_DISINTEGRATE, TRUE)));

    if(!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_DEATH, oPC) && !GetPlotFlag(oTarget))
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oTarget, 1.0);
        DelayCommand(0.4, DestroyAllItems(oTarget));
        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(2*GetMaxHitPoints(oTarget)), oTarget));

        if (GetIsPC(oTarget) || GetTag(oTarget)=="PsychicClone")
            DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));
        else DelayCommand(0.7, DestroyObject(oTarget));
    }

    else
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oTarget, 0.8);

        if(FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
        {
            nDamage=nDamage/2;
        }

        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage), oTarget));
    }
}

void DestroyAllItems(object oTarg)
{
    if(!GetHasInventory(oTarg)) return;

    object oItem=GetFirstItemInInventory(oTarg);

    while(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem, 0.3);
        oItem=GetNextItemInInventory(oTarg);
    }

    TakeGoldFromCreature(GetGold(oTarg), oTarg, TRUE);
}


