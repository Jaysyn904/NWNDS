//::
//:: A pnp version of the Dread Wraith's CON draining touch.
//::
//:: Modified by: DM Heatstroke 01-04-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoConDamage(object oTarget, object oCaster)
{   // Get Ability Damage
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    int nDam = d8();
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION, nDam);
    eCon = ExtraordinaryEffect(eCon);

    // Setup oCaster's healing
    effect eDrain = EffectTemporaryHitpoints(5);
    eDrain = ExtraordinaryEffect(eDrain);
    effect eDrainVis = EffectVisualEffect(VFX_IMP_HEALING_L);

    // Determine if they can die from ability loss
    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    // Get oCaster's Touch DC
    int nCreCHAMod = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
    int nCreHD = GetHitDice (oCaster);
    int nTouchDC = (10 + (nCreHD/2) + nCreCHAMod);

    // Roll a saving throw
    if ( !MySavingThrow(SAVING_THROW_FORT, oTarget, nTouchDC, SAVING_THROW_TYPE_NONE, oCaster) )
    {   // If they fail a save & have less than a 3 Constitution, kill them
        int nCon = GetAbilityScore(oTarget,ABILITY_CONSTITUTION);
        if ( ( nCon - nDam ) < 3 && bKillEm )
        {

            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);

        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);           // Apply Viz
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCon, oTarget, 8640.0); // 24 "Athas Reborn" hours -DMH
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDrain, oCaster);          // Heal up
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrainVis, oCaster);       // Apply Viz
    }
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

    DelayCommand(0.1,DoConDamage(oTarget,oCaster));

}
