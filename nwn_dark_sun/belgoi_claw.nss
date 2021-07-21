//::
//:: A pnp version of the Belgoi's STR damaging slam.
//::
//:: Modified by: DM Heatstroke 05-10-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoStrDamage(object oTarget, object oCaster)
{
    // Get Ability Damage
    int nDam = Random(5)+1;
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH, nDam);
    eStr = ExtraordinaryEffect(eStr);

    // Belgoi's slam has no save, but also won't kill it's victim.
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);           // Apply Viz
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStr, oTarget, 8640.0); // 24 "Athas Reborn" hours -DMH

}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        SendMessageToPC(oTarget,"Immune to ability drain.");
        return;
    }

    DelayCommand(0.1,DoStrDamage(oTarget,oCaster));

}
