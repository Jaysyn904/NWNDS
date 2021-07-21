/************************************
*   Mass Contact                    *
*                                   *
*   Cost: 12                        *
*   Power Score: Wis -1             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-1;
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MASS_CONTACT);
    object oTarget=GetSpellTargetObject();
    location lLoc=(GetIsObjectValid(oTarget))?
                GetLocation(oTarget) : GetSpellTargetLocation();
    int nDC=16+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MASS_CONTACT)) return;

    effect eLink=EffectSavingThrowDecrease(SAVING_THROW_WILL, GetEnhancedEffect(nLevel/2, FEAT_PSIONIC_MASS_CONTACT), SAVING_THROW_TYPE_MIND_SPELLS);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(4+nLevel*2);


    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE,
        OBJECT_TYPE_CREATURE);

    while (GetIsObjectValid(oTarget))
    {
        nTargRace=GetRacialType(oTarget);

        if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD
            || GetIsImmune(oTarget, IMMUNITY_TYPE_MIND_SPELLS)
            || (GetEffectivePsionicLevel(oTarget)>=1
                && WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC)))

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);

        else if(!GetFactionEqual(oPC, oTarget))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
        }


        oTarget=GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lLoc, TRUE,
            OBJECT_TYPE_CREATURE);
    }


}
