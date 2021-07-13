/************************************
*   Psychic Clone                   *
*                                   *
*   Cost: 50                        *
*   Power Score: Wis -8             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=50;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-8;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PSYCHIC_CLONE);
    effect eVis=EffectVisualEffect(VFX_FNF_DISPEL);
    object oParty=GetFirstFactionMember(oPC, FALSE);


    while (GetIsObjectValid(oParty))
    {
        if (GetTag(oParty)=="PsychicClone" && GetName(oParty)==GetName(oPC))
        {
            FloatingTextStringOnCreature("You can only have one active clone of yourself.", oPC, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
            return;
        }

        oParty=GetNextFactionMember(oPC, FALSE);
    }


    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PSYCHIC_CLONE)) return;

    int nDuration=GetEnhancedDuration(nLevel/2);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oPC));

    object oClone = CopyObject(oPC, GetLocation(oPC), OBJECT_INVALID, "PsychicClone");
    int nGold = GetGold(oClone);
    int nHP = GetMaxHitPoints(oClone);
    object oItem=GetFirstItemInInventory(oClone);

    TakeGoldFromCreature(nGold, oClone, TRUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHP), oClone);

    while(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem, 0.1);
        oItem=GetNextItemInInventory(oClone);
    }

    oItem=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oClone);
    SetLocalObject(oClone, "Weapon1", oItem);
    oItem=GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oClone);
    SetLocalObject(oClone, "Weapon2", oItem);

    DelayCommand(3.0, ExecuteScript("ps_psychcln_hb", oClone));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneDominated(), oClone, TurnsToSeconds(nDuration)));

}
