// Silt Weird Slam CON Drain - Item Unique OnHit Script
//

#include "nw_i0_spells"

void main()
{
    object oCaster = OBJECT_SELF ;              // Originator
    object oTarget = GetSpellTargetObject();    // Target

    int nCon = GetAbilityScore(oTarget, ABILITY_CONSTITUTION);
    int nHD = GetHitDice(oCaster);

//  11 instead of 10 due to Silt Weird's Ability Focus (constitution drain)
    int nDC = 11 + (nHD / 2) + GetAbilityModifier(ABILITY_CHARISMA, oCaster);


//  CON drain kills when playing under Core Rules or better.
    int bKillEm = FALSE;
    if (
            !GetIsPC(oTarget) ||
            GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
            GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT
       )

            bKillEm = TRUE;

//  Set up CON drain.
    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    int nDam = 1;
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);
    eCon = SupernaturalEffect(eCon);

//  Return if target is dead or invalid.
    if ( GetIsDead(oTarget) || !GetIsObjectValid(oTarget) )
        return;

//  Return if target is immune to energy drain.
    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
        return;

//  Fortitude Save vs. CHA-based DC
    if(!MySavingThrow(SAVING_THROW_FORT, oTarget, nDC, SAVING_THROW_TYPE_NONE, oCaster, 0.0f ))
        {
        //  Die if CON dips below 3.
        if ( ( nCon - nDam ) < 3 && bKillEm )
            {
                effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH);
                effect eHP = EffectDamage( 9999 , DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
                effect eDeath = EffectDeath();
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eHP, oTarget);
            }

        //  Drain 1 CON & fire VFX
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
        }
}
