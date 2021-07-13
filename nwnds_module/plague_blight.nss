#include "NW_I0_SPELLS"

void DoConDamage(object oTarget)
{
    int nDam = d4();
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
    effect eVis = EffectVisualEffect(VFX_IMP_DISEASE_S);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCon,oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);



}
int DoPlague(object oTarget, float fDelay)
{

    int nRoll = MySavingThrow(SAVING_THROW_FORT,oTarget,15,SAVING_THROW_TYPE_DISEASE);

    if ( nRoll == 0 )
    {
        SetLocalInt(oTarget,"LastRoundSuccess",0);
        DelayCommand(fDelay,DoConDamage(oTarget));
        return TRUE;
    }
    if ( nRoll == 1 )
    {
        if ( GetLocalInt(oTarget,"LastRoundSuccess") )
        {
            DelayCommand(fDelay,SendMessageToPC(oTarget,"Recovered from Gangrenous Touch"));
            DelayCommand(fDelay,SetLocalInt(oTarget,"PB_Plague",0));
            return FALSE;
        }
        SetLocalInt(oTarget,"LastRoundSuccess",1);
        return TRUE;
    }
    DelayCommand(fDelay,SetLocalInt(oTarget,"PB_Plague",0));
    return FALSE;
}


void main()
{
    object oOrigin = OBJECT_SELF ;               // Where the spell came from
    object oTarget = GetSpellTargetObject();  // What the spell is aimed at


    if ( GetLocalInt(oTarget,"PB_Plague") )
    {
        SendMessageToPC(oOrigin,"Creature already has this effect.");
        return;
    }
    int nDelay = 0;

    if ( MySavingThrow(SAVING_THROW_FORT,oTarget,15,SAVING_THROW_TYPE_DISEASE) )
        return;

    SetLocalInt(oTarget,"PB_Plague",1);
//    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
//    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_DISEASE) )
    {
        SendMessageToPC(oOrigin,"Target is immune to disease");
        SendMessageToPC(oTarget,"Immune to disease");
        return;
    }

    SetLocalInt(oTarget,"LastRoundSuccess",0);
    SendMessageToPC(oTarget,"You've contracted Gangrenous Touch.");
    while ( DoPlague(oTarget,RoundsToSeconds(nDelay)) && nDelay < 10 )
    {
        nDelay++;
    }
}



