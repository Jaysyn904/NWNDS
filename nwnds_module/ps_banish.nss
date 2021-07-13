/************************************
*   Banishment                      *
*                                   *
*   Cost: 25                        *
*   Power Score: Int -1             *
*                                   *
************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=25;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_INTELLIGENCE)-1;
    effect eVis=EffectVisualEffect(VFX_IMP_EVIL_HELP);
    eVis=EffectLinkEffects(eVis, EffectVisualEffect(VFX_IMP_DISPEL));
    effect eVis2=EffectVisualEffect(VFX_IMP_GOOD_HELP);
    eVis2=EffectLinkEffects(eVis2,EffectVisualEffect(VFX_IMP_DISPEL));
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_BANISHMENT);
    int nDuration=1+nLevel/2;
    object oTarget=GetSpellTargetObject();
    object oBanArea=GetObjectByTag("AR_Banishment");
    int nBanIndex=GetLocalInt(oBanArea, "BanIndex")+1;
    if (nBanIndex>=37) nBanIndex=1;
    location lDest=GetLocation(GetWaypointByTag("Banish_WP_"+IntToString(nBanIndex)));
    location lHere=GetLocation(oTarget);
    int nDC=12+(nLevel>30?15:nLevel/2)+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);

    if(oTarget==oPC)
    {
        FloatingTextStringOnCreature("You cannot banish yourself.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        return;
    }

    if(GetIsDM(oTarget))
    {
        FloatingTextStringOnCreature("You cannot banish the Dungeon Master.", oPC, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(292), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 8.0);
        return;
    }

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_BANISHMENT)) return;

    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_PSIONIC_BANISHMENT, FALSE));

    if (GetIsReactionTypeHostile(oPC, oTarget)
        && ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_NONE, oPC))
        return;

     ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lHere);
     AssignCommand(oTarget, ClearAllActions());
     AssignCommand(oTarget, JumpToLocation(lDest));
     SetLocalInt(oBanArea, "BanIndex", nBanIndex);

     nDuration=GetEnhancedDuration(nDuration);

     DelayCommand(RoundsToSeconds(nDuration), AssignCommand(oTarget, ClearAllActions()));
     DelayCommand(RoundsToSeconds(nDuration)+0.3, AssignCommand(oTarget, JumpToLocation(lHere)));
     DelayCommand(RoundsToSeconds(nDuration), ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis2, lHere));

}
