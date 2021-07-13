/************************************
*   Receptacle                      *
*                                   *
*   Cost: (Gem Value)/100           *
*   Power Score: Wis -5             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    object oTarget=GetSpellTargetObject();
    string sResRef=GetResRef(oTarget);
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-5;
    effect eVis=EffectVisualEffect(VFX_IMP_SILENCE);
    int nStackSize=GetItemStackSize(oTarget);
    int nCost=GetGoldPieceValue(oTarget)/nStackSize/100;

    if(GetBaseItemType(oTarget)!=BASE_ITEM_GEM)
    {
        FloatingTextStringOnCreature("You can only store psionic strength in gems.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    else if(nCost<1)
    {
        FloatingTextStringOnCreature("This gem is not pure enough to store psionic strength.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_RECEPTACLE)) return;

    if (nStackSize==1) DestroyObject(oTarget);

    else
    {
        nStackSize--;
        SetItemStackSize(oTarget, nStackSize);
    }

    object oNewGem=CreateItemOnObject("ps_receptacle_it", oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    DelayCommand(0.2, SetLocalInt(oNewGem, "PSPStored", nCost));
    DelayCommand(0.2, SetLocalString(oNewGem, "OldGemType", sResRef));

    SendMessageToPC(oPC, IntToString(nCost)+" psionic strength points stored.");

}

