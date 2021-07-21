/************************************
* Intellect Fortress onEnter script *
*                                   *
* Provides +1/2-lvls save vs mind   *
* spells to all friendly creatures. *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=GetAreaOfEffectCreator();
    object oTarget=GetEnteringObject();
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_INTELLECT_FORTRESS);
    int nDuration=GetEnhancedDuration(nLevel);
    effect eVis=EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
    effect eLink=EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    eLink=EffectLinkEffects(eLink, EffectSavingThrowIncrease(SAVING_THROW_ALL, GetEnhancedEffect(nLevel/2, FEAT_PSIONIC_INTELLECT_FORTRESS), SAVING_THROW_TYPE_MIND_SPELLS));
    eLink=ExtraordinaryEffect(eLink);

    if (!GetIsFriend(oTarget, oPC)) return;


    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));


}
