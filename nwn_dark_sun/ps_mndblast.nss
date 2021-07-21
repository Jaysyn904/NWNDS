/************************************
*   Mind Blast                      *
*                                   *
*   Cost: 21                        *
*   Power Score: Wis -5             *
*                                   *
************************************/

#include "lib_psionic"


void main()
{
    object oPC=OBJECT_SELF;
    int nCost=21;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_WISDOM)-5;
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_MIND_BLAST);
    effect eVis=EffectVisualEffect(VFX_IMP_DAZED_S);
    effect eLink=EffectDazed();
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink=EffectLinkEffects(eLink, eVis);
    eLink=ExtraordinaryEffect(eLink);
    object oTarget=GetSpellTargetObject();
    location lTargLoc=GetLocation(oTarget);
    if (!GetIsObjectValid(oTarget))
        lTargLoc=GetSpellTargetLocation();
    oTarget=GetFirstObjectInShape(SHAPE_SPELLCONE, 15.0, lTargLoc, TRUE);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_WISDOM);
    int nTargRace=GetRacialType(oTarget);
    float fDelay;

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_MIND_BLAST)) return;

    int nDuration=GetEnhancedDuration(d4(2));

    while (GetIsObjectValid(oTarget))
    {
        nTargRace=GetRacialType(oTarget);

        if ((oTarget!=oPC) && !(nTargRace==RACIAL_TYPE_CONSTRUCT || nTargRace==RACIAL_TYPE_UNDEAD )
            && (!WillSave(oTarget, nDC, SAVING_THROW_TYPE_MIND_SPELLS, oPC)))
        {
            fDelay=GetDistanceBetween(oPC, oTarget)/20;
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration)));
            DelayCommand(fDelay, SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_MIND_BLAST)));
        }

        oTarget=GetNextObjectInShape(SHAPE_SPELLCONE, 15.0, lTargLoc, TRUE);
    }


}
