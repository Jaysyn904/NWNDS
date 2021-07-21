/************************************
*   Displacement                    *
*                                   *
*   Cost: 12                        *
*   Power Score: Con -3             *
*                                   *
*************************************/

#include "lib_psionic"

void main()
{
    object oPC=OBJECT_SELF;
    int nCost=12;
    int nPowerScore=GetAbilityScore(oPC, ABILITY_CONSTITUTION)-3;
    effect eVis=EffectVisualEffect(448); //VFX_DUR_PROT_ACIDSHIELD
    effect eLink=EffectConcealment(50);
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink=EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE));
    eLink=ExtraordinaryEffect(eLink);
    int nLevel=GetEffectivePsionicLevel(oPC, FEAT_PSIONIC_DISPLACEMENT);

    if (!PowerCheck(oPC, nCost, nPowerScore, FEAT_PSIONIC_DISPLACEMENT)) return;

    int nDuration=GetEnhancedDuration(nLevel);

    SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_PSIONIC_DISPLACEMENT, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, TurnsToSeconds(nDuration));
}

