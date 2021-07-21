/************************************
*   Control Wind                    *
*                                   *
*   Cost: 26                        *
*   Power Score: Con -4             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=26;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-4;
    effect eVis=EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
    effect eLink=EffectKnockdown();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_IMP_PULSE_WIND));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CONTROL_WIND);
    object oTarget=GetSpellTargetObject();
    location lLoc;
    if(GetIsObjectValid(oTarget)) lLoc=GetLocation(oTarget);
    else lLoc=GetSpellTargetLocation();
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    float fDelay;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CONTROL_WIND)) return;

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);


    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_AREA_OF_EFFECT);

    while (GetIsObjectValid(oTarget))
    {
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_CONTROL_WIND, TRUE));
        fDelay = GetDistanceBetweenLocations(lLoc, GetLocation(oTarget))/20;

        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

        else if (GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)
        {

            if (!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(3)));
                if (!GetIsImmune(oTarget, IMMUNITY_TYPE_KNOCKDOWN))
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oTarget, RoundsToSeconds(3)));
            }

        }

        else if ((GetObjectType(oTarget)==OBJECT_TYPE_DOOR) || (GetObjectType(oTarget)==OBJECT_TYPE_PLACEABLE))
        {
            if (GetLocked(oTarget) == FALSE)
            {
                if (GetIsOpen(oTarget) == FALSE) AssignCommand(oTarget, ActionOpenDoor(oTarget));
                else AssignCommand(oTarget, ActionCloseDoor(oTarget));
            }

        }
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE |OBJECT_TYPE_AREA_OF_EFFECT);
    }

}
