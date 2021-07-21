//::
//:: A pnp version of the Tliz's Level draining slam.
//::
//:: Modified by: DM Heatstroke 05-10-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoLevelDrain(object oTarget, object oCaster)
{
    // Setup oCaster's healing
    effect eDrain = EffectTemporaryHitpoints(5);
    eDrain = ExtraordinaryEffect(eDrain);
    effect eVis1 = EffectVisualEffect(VFX_IMP_HEALING_L);

    // Setup Level Drain
    effect eVis2 = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eNeg = EffectNegativeLevel(2);
    eNeg = SupernaturalEffect(eNeg);

    // Drain levels from oTarget
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eNeg, oTarget, HoursToSeconds(24));
    // Apply Temp HP to oCaster
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis1, oCaster);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDrain, oCaster, HoursToSeconds(1));

}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL) )
    {
        SendMessageToPC(oTarget,"Immune to level drain.");
        return;
    }

    DelayCommand(0.1,DoLevelDrain(oTarget,oCaster));

}
