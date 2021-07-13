#include "NW_I0_SPELLS"


void DoConDamage(object oTarget, object oCaster)
{
    if ( GetIsDead(oTarget) ||
        !GetIsObjectValid(oTarget) )
        return;

    effect eVis = EffectVisualEffect(VFX_IMP_FROST_L);
    int nDam = 4;
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);
    eCon = SupernaturalEffect(eCon);

    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    int nCon = GetAbilityScore(oTarget,ABILITY_CONSTITUTION);
    if ( ( nCon - nDam ) < 3 && bKillEm )
    {
        effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH);
        effect eHP = EffectDamage( 9999 , DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
        effect eDeath = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis2,oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP,oTarget);
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);

    effect eHeal = EffectTemporaryHitpoints(10);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_S);

    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHeal, oCaster, HoursToSeconds(1));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealVis, oCaster);
    }
}

int DoBlight(object oTarget, object oCaster, float fDelay = 0.0 )
{
    if ( !GetIsObjectValid(oTarget) )
        return FALSE;
    if ( !MySavingThrow(SAVING_THROW_FORT,oTarget,35,SAVING_THROW_TYPE_NONE,oCaster,fDelay) )
    {
        DelayCommand(fDelay,DoConDamage(oTarget,oCaster));
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */
    if ( GetLocalInt(oTarget,"BlightFire") )
    {
        return;
    }
    int bResult = DoBlight(oTarget,oCaster);
    float fDelay = 6.0;
    SetLocalInt(oTarget,"BlightFire",1);
    while ( bResult && fDelay <= 30.0 )
    {
        bResult = DoBlight(oTarget,oCaster,fDelay);
        fDelay += 6.0;
    }

    DelayCommand(fDelay,SetLocalInt(oTarget,"BlightFire",0));
}
