#include "NW_I0_SPELLS"


void DoPoison(object oTarget, object oCaster)
{
/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        SetLocalInt(oTarget,"IsPoisoned",0);
    else
        SetLocalInt(oTarget,"IsPoisoned",1); */

    effect eVis = EffectVisualEffect(VFX_IMP_POISON_S);
    int nDam = d12(2);
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);

    int bKillEm = FALSE;
    if ( !GetIsPC(oTarget) || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES
        || GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT )
        bKillEm = TRUE;

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_POISON) ||
         GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        SendMessageToPC(oTarget,"Immune to poison.");
        return;
    }

    if ( !MySavingThrow(SAVING_THROW_FORT,oTarget,94,SAVING_THROW_TYPE_POISON,oCaster) )
    {
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
    }
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

/*    int bIsPoisoned = GetLocalInt(oTarget,"IsPoisoned");
    if ( bIsPoisoned )
        return; */

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_POISON) ||
         GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
    {
        SendMessageToPC(oTarget,"Immune to poison.");
        return;
    }

    DelayCommand(0.1,DoPoison(oTarget,oCaster));
    DelayCommand(RoundsToSeconds(10),DoPoison(oTarget,oCaster));
}
