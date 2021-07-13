/************************************
*   Megakinesis                     *
*                                   *
*   Cost: 30                        *
*   Power Score: Wis -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=30;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-4;
    effect eVis1=EffectVisualEffect(VFX_FNF_BLINDDEAF);
    effect eVis2=EffectVisualEffect(VFX_IMP_MAGBLUE);
    effect eLink=EffectCutsceneImmobilize();
    eLink=EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZE_HOLD), eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MEGAKINESIS);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM);
    object oTarget=GetSpellTargetObject();
    location lLoc=(GetIsObjectValid(oTarget))?
                GetLocation(oTarget) : GetSpellTargetLocation();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MEGAKINESIS)) return;

    int nDuration=GetEnhancedDuration(4+nLevel/2);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, lLoc);

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE,
        OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE
        | OBJECT_TYPE_ITEM);

    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)
        {
            if(GetIsEnemy(oPC, oTarget))
            {
                SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_MEGAKINESIS));

                if (!ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC) && !GetIsDM(oTarget))
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
            }
        }

        else if (GetObjectType(oTarget)==OBJECT_TYPE_DOOR)
        {
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));

            if(GetIsOpen(oTarget))
                AssignCommand(oTarget, ActionCloseDoor(oTarget));

            else if (!GetLocked(oTarget))
                AssignCommand(oTarget, ActionOpenDoor(oTarget));

            else if (!GetPlotFlag(oTarget) && GetLockUnlockDC(oTarget)<=nDC+15)
            {
                AssignCommand(oTarget, ActionOpenDoor(oTarget));
                AssignCommand(oTarget, ActionUnlockObject(oTarget));
                TriggerTrap(oTarget);
            }
        }

        else if (GetObjectType(oTarget)==OBJECT_TYPE_PLACEABLE)
        {

            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));

            if(GetIsOpen(oTarget))
                AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

            else if (GetLocked(oTarget) && !GetPlotFlag(oTarget)
                    && GetLockUnlockDC(oTarget)<=nDC+15)
            {
                AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_OPEN));
                AssignCommand(oTarget, ActionUnlockObject(oTarget));
                TriggerTrap(oTarget);
            }

            else if (!GetLocked(oTarget) && GetHasInventory(oTarget))
                AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

            else
                AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        }

        else if (GetObjectType(oTarget)==OBJECT_TYPE_ITEM)
        {
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget));

            if(!GetIsObjectValid(GetItemPossessor(oTarget)))
            {
                CopyItem(oTarget, oPC, TRUE);
                DestroyObject(oTarget, 0.2);
            }
        }

        oTarget=GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE,
            OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE
            | OBJECT_TYPE_ITEM);

    }

}
