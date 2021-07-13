/************************************
*   Contact                         *
*                                   *
*   Cost: 3                         *
*   Power Score: Wis                *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=3;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM);
    effect eVis=EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_CONTACT);
    object oTarget=GetSpellTargetObject();
    int nDC=16+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM, oPC);
    int nTargRace=GetRacialType(oTarget);

    if (nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
    {
        FloatingTextStringOnCreature("This power only affects creatures with minds", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_CONTACT)) return;

    effect eLink=EffectSavingThrowDecrease(SAVING_THROW_WILL, GetEnhancedEffect(nLevel/2, FEAT_PSIONIC_CONTACT), SAVING_THROW_TYPE_MIND_SPELLS);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=ExtraordinaryEffect(eLink);
    int nDuration=GetEnhancedDuration(4+nLevel*2);

    if( GetIsImmune(oTarget, IMMUNITY_TYPE_MIND_SPELLS) ||
        (GetLevelByClass(60, oTarget)>=1 && WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC)))
    {
        return;
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));

}
