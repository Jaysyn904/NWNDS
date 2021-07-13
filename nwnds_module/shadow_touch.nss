//::
//:: A pnp version of the Shadows's STR damaging touch.
//::
//:: Modified by: DM Heatstroke 01-04-11
//::

#include "NW_I0_SPELLS"
#include "nw_i0_plot"

void DoStrDamage(object oTarget, object oCaster)
{   //::
    //:: Intialize damage value & figure out which shadow we are dealing with
    //::
    int nHitDice = GetHitDice(oCaster);
    int nDam;
    if (1 == nHitDice)
        {
            nDam = 1;   //Lesser Shadow
        }

    else if (nHitDice >= 9)
        {
            nDam = d8();    //Greater Shadow
        }

    else
        {
            nDam = d6();    //Normal Shadow
        }

    // Get Ability Damage
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eStr = EffectAbilityDecrease(ABILITY_STRENGTH, nDam);
    eStr = SupernaturalEffect(eStr);

    // Determine if they can die from ability loss
    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    // Shadow's touch has no save!
    int nStr = GetAbilityScore(oTarget, ABILITY_STRENGTH);
    if ( ( nStr - nDam ) < 3 && bKillEm )
        {
            effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP2 = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath2 = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis3,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP2,oTarget);

        }

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
