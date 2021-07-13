/************************************
*   Project Force                   *
*                                   *
*   Cost: 10                        *
*   Power Score: Con -2             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=10;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-2;
    effect eVis=EffectVisualEffect(VFX_FNF_LOS_NORMAL_10);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_FNF_SCREEN_BUMP));
    effect eLink=EffectKnockdown();
    eLink=EffectLinkEffects(eVis, eLink);
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_PROJECT_FORCE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_CONSTITUTION);
    object oTarget=GetSpellTargetObject();

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_PROJECT_FORCE)) return;

    if (GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_PROJECT_FORCE));

        if (!ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetEnhancedEffect(d6()+1, FEAT_PSIONIC_PROJECT_FORCE), DAMAGE_TYPE_BLUDGEONING), oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(GetEnhancedEffect(3, FEAT_PSIONIC_PROJECT_FORCE)));
            if (!GetIsImmune(oTarget, IMMUNITY_TYPE_KNOCKDOWN))
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oTarget, RoundsToSeconds(GetEnhancedEffect(3, FEAT_PSIONIC_PROJECT_FORCE)));
        }

    }

    else if (GetObjectType(oTarget)==OBJECT_TYPE_DOOR)
    {
        nDC=20+nLevel/2+GetAbilityModifier(ABILITY_CONSTITUTION);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        if(GetIsOpen(oTarget))
            AssignCommand(oTarget, ActionCloseDoor(oTarget));

        else if (!GetLocked(oTarget))
            AssignCommand(oTarget, ActionOpenDoor(oTarget));

        else if (!GetPlotFlag(oTarget) && GetLockUnlockDC(oTarget)<=nDC+5)
        {
            AssignCommand(oTarget, ActionOpenDoor(oTarget));
            AssignCommand(oTarget, ActionUnlockObject(oTarget));
            TriggerTrap(oTarget);
        }

        else
            FloatingTextStringOnCreature("*locked*", oPC, FALSE);

    }

    else if (GetObjectType(oTarget)==OBJECT_TYPE_PLACEABLE)
    {
        nDC=20+nLevel/2+GetAbilityModifier(ABILITY_CONSTITUTION);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

        if(GetIsOpen(oTarget))
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));

        else if (!GetPlotFlag(oTarget) && GetLocked(oTarget)
           && GetLockUnlockDC(oTarget)<=nDC)
        {
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_OPEN));
            AssignCommand(oTarget, ActionUnlockObject(oTarget));
            TriggerTrap(oTarget);
        }

        else if (GetLocked(oTarget))
            FloatingTextStringOnCreature("*locked*", oPC, FALSE);

        else if (GetHasInventory(oTarget))
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

        else
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    }

}
