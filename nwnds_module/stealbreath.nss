#include "NW_I0_SPELLS"
#include "inc_suffocate"

void DoConDamage(object oTarget)
{
    int nDam = d2();
    int nKillEm = FALSE;
    if ( (!GetIsPC( oTarget ) ) || ( GetGameDifficulty() >= GAME_DIFFICULTY_CORE_RULES ) )
    {
        nKillEm = 1;
    }
    int nTargetAbility = GetAbilityScore(oTarget, ABILITY_CONSTITUTION);
    if ( ( (nTargetAbility - nDam) < 3) && nKillEm )
    {
         int nHitPoints = GetCurrentHitPoints(oTarget);
         effect eVis = EffectVisualEffect(VFX_IMP_DEATH);
         effect eHitDamage = EffectDamage(nHitPoints, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
         ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHitDamage, oTarget);
    }
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
}


void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at

    if ( MySavingThrow(SAVING_THROW_FORT,oTarget,15) )
    {
        return;
    }
    DelayCommand(0.1,DoConDamage(oTarget));
    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        effect eVis = EffectVisualEffect(VFX_IMP_HEALING_S);
        effect eHeal = EffectHeal(5);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oOrigin);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oOrigin);
    }
    int nRace = GetRacialType(oTarget);
    if ((  nRace == RACIAL_TYPE_CONSTRUCT ) || ( nRace == RACIAL_TYPE_ELEMENTAL )
        || ( nRace == RACIAL_TYPE_UNDEAD ) || ( nRace == RACIAL_TYPE_OOZE ) )
        return;

    SuffocateCheck(oTarget);
}
