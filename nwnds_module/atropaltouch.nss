#include "NW_I0_SPELLS"


void DoConDamage(object oTarget, object oCaster)
{
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    int nDam = 5;
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);

    effect eHeal = EffectHeal(20);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_L);

    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    if ( !MySavingThrow(SAVING_THROW_FORT,oTarget,59,SAVING_THROW_TYPE_NONE,oCaster) )
    {
        int nCon = GetAbilityScore(oTarget,ABILITY_CONSTITUTION);
        if ( ( nCon - nDam ) < 3 && bKillEm )
        {
            effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH);
            effect eHP = EffectDamage( 9999, DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
            effect eDeath = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP,oTarget);
        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oCaster);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHealVis,oCaster);
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
