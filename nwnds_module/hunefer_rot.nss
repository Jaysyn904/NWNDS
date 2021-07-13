#include "NW_I0_SPELLS"


void DoConDamage(object oTarget)
{
    if ( !GetIsObjectValid(oTarget) )
        return;

    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    int nDam = d6();
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);

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

}

void DoRot(object oTarget )
{
    if ( !GetIsObjectValid(oTarget) )
        return;
    if ( !GetLocalInt(oTarget,"hunefer_rot") )
        return;
    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_DISEASE) )
    {
        SendMessageToPC(oTarget,"Immune to Disease.");
        SetLocalInt(oTarget,"hunefer_rot",0);
        return;
    }


    int nResult = MySavingThrow(SAVING_THROW_FORT,oTarget,35,SAVING_THROW_TYPE_DISEASE);
    if ( nResult == 0 )
    {
        DelayCommand(0.1,DoConDamage(oTarget));
    }

    // Normally Hunefer rot can only be removed by remove disease, not by
    // making saving throws
    if ( nResult == 1 && GetGameDifficulty() != GAME_DIFFICULTY_DIFFICULT
            && GetGameDifficulty() != GAME_DIFFICULTY_CORE_RULES &&
            GetIsPC(oTarget) )
    {
        SetLocalInt(oTarget,"hunefer_rot",0);
        SendMessageToPC(oTarget,"Recovered from Disease.");
    }
    if ( nResult != 2 )
    {
        DelayCommand(6.0,DoRot(oTarget));
    }
    else
    {
        SetLocalInt(oTarget,"hunefer_rot",0);
        SendMessageToPC(oTarget,"Immune to Disease.");
    }
/*    else
    {
        SetLocalInt(oTarget,"hunefer_rot",0);
    }
    if ( nResult == 2 )
    {

    } */
}

void main()
{
    object oTarget = GetSpellTargetObject();
    object oCaster = OBJECT_SELF;

    if ( GetLocalInt(oTarget,"hunefer_rot") )
    {
        return;
    }
    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_DISEASE) )
    {
        SendMessageToPC(oTarget,"Immune to Disease.");
        return;
    }
    if ( MySavingThrow(SAVING_THROW_FORT,oTarget,35,SAVING_THROW_TYPE_DISEASE) )
        return;

    SendMessageToPC(oTarget,"You have contracted Hunefer Rot");
    SetLocalInt(oTarget,"hunefer_rot",1);
    DelayCommand(6.0,DoRot(oTarget));
}
