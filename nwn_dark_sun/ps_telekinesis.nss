/************************************
*   Telekinesis                     *
*                                   *
*   Cost: 8                         *
*   Power Score: Wis -3             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=8;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-3;
    effect eVis=EffectVisualEffect(VFX_DUR_PARALYZE_HOLD);
    effect eLink=EffectCutsceneImmobilize();
    eLink=EffectLinkEffects(eVis, eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_TELEKINESIS);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM);
    object oTarget=GetSpellTargetObject();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_TELEKINESIS)) return;

    int nDuration=GetEnhancedDuration(4+nLevel/2);

    if (GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_TELEKINESIS));

        if (!ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC) && !GetIsDM(oTarget))
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

    }

    else if (GetObjectType(oTarget)==OBJECT_TYPE_DOOR)
    {
        eVis=EffectVisualEffect(VFX_IMP_MAGBLUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        if(GetIsOpen(oTarget))
            AssignCommand(oTarget, ActionCloseDoor(oTarget));

        else if (!GetLocked(oTarget))
            AssignCommand(oTarget, ActionOpenDoor(oTarget));

        else
            FloatingTextStringOnCreature("*locked*", oPC, FALSE);

    }

    else if (GetObjectType(oTarget)==OBJECT_TYPE_PLACEABLE)
    {
        eVis=EffectVisualEffect(VFX_IMP_MAGBLUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        if(GetIsOpen(oTarget))
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

        else if (GetLocked(oTarget))
            FloatingTextStringOnCreature("*locked*", oPC, FALSE);

        else if (GetHasInventory(oTarget))
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

        else
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    }

    else if (GetObjectType(oTarget)==OBJECT_TYPE_ITEM)
    {
        eVis=EffectVisualEffect(VFX_IMP_MAGBLUE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));

        if(!GetIsObjectValid(GetItemPossessor(oTarget)))
        {
            CopyItem(oTarget, oPC, TRUE);
            DestroyObject(oTarget, 0.2);
        }

    }


}
