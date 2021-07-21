
#include "nw_i0_generic"
#include "x2_inc_switches"
#include "inc_AI"
#include "nw_i0_spells"
#include "_inc_battlecry_"

const int FEAT_ZONE_OF_ANIMATION = 2895;

void DoTouchAttack(object oTarget, object oCaster )
{
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,2.0);

    int nDam = 5;
    int nHeal = 20;
    int nRoll = TouchAttackMelee(oTarget,TRUE);

    if ( nRoll == 0 )
        return;

    // improved critical gives 19-20
    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_CRITICAL_HIT) && ( nRoll == 2 || ( nRoll == 1 && d20() == 20 )) )
    {
        effect eNegative = EffectDamage(d6(),DAMAGE_TYPE_NEGATIVE);

        // crit hit, overwhelming critical
        nDam *= 2;
        nHeal *= 2;
        int nDC = 10 + GetHitDice(oCaster) / 2 + GetAbilityModifier(ABILITY_STRENGTH,oCaster);
        FloatingTextStringOnCreature("Devastating Critical!",oTarget);
        if ( !MySavingThrow(SAVING_THROW_FORT,oTarget,nDC,SAVING_THROW_TYPE_NONE,oCaster) )
        {
            effect eHP = EffectDamage(GetMaxHitPoints(oTarget));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eHP,oTarget);
        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eNegative,oTarget);
    }

    if ( GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE) )
        return;

    effect eHeal = EffectHeal(nHeal);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_L);

    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION,nDam);
    eCon = SupernaturalEffect(eCon);
    eCon = ExtraordinaryEffect(eCon);

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
            effect eHP = EffectDamage( 9999 , DAMAGE_TYPE_MAGICAL , DAMAGE_POWER_PLUS_TWENTY);
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

 void DoEnergyDrainRay(object oTarget, object oCaster )
{
    int nRoll = TouchAttackRanged(oTarget,TRUE);

    effect eBeam;
    if ( nRoll == 0 )
    { // miss
        eBeam = EffectBeam(VFX_BEAM_EVIL,oCaster,BODY_NODE_CHEST,TRUE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,1.5);
        return;
    }

    int nDrain = 4;
    int nHeal = 40;

    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_CRITICAL_HIT) && ( nRoll == 2 || ( nRoll == 1 && d20() == 20 )) )
    {
        nDrain *= 2;
        nHeal *= 2;
    }

    eBeam = EffectBeam(VFX_BEAM_EVIL,oCaster,BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,1.5);

    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eDrain = EffectNegativeLevel(nDrain);
    eDrain = SupernaturalEffect(eDrain);
    eDrain = ExtraordinaryEffect(eDrain);


    effect eHeal = EffectHeal(nHeal);
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_L);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDrain,oTarget);
    if ( !GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL) )
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oCaster);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eHealVis,oCaster);
    }

}

/*void DoEnergyDrainRay( object oTarget, object oCaster )
{
    ActionCastSpellAtObject(SPELLABILITY_BOLT_LEVEL_DRAIN,oTarget,METAMAGIC_ANY,TRUE);
} */
void DoPhysical( object oTarget, object oCaster )
{
    if ( !GetIsObjectValid(oTarget) || !GetIsEnemy(oTarget) )
    {
        oTarget = GetNearestEnemy();
        if ( !GetIsObjectValid(oTarget) )
            return;
    }
    if ( GetDistanceToObject(oTarget) > FeetToMeters(20.0) )
    {
//        SetLocalInt(OBJECT_SELF,"Acting",1);
        DoEnergyDrainRay(oTarget,oCaster);
//        DelayCommand(6.0,SetLocalInt(OBJECT_SELF,"Acting",0));
//        DelayCommand(6.1,DetermineCombatRound());
    }
    else
    {
        ActionMoveToObject(oTarget,TRUE);
        SetLocalInt(OBJECT_SELF,"Acting",1);
        DelayCommand(0.1,DoTouchAttack(oTarget,oCaster));
        DelayCommand(3.0,DoTouchAttack(oTarget,oCaster));
        DelayCommand(6.0,SetLocalInt(OBJECT_SELF,"Acting",0));
        DelayCommand(6.1,DetermineCombatRound());
    }
    SetCreatureOverrideAIScriptFinished();

}

void main()
{
    // The following two lines should not be touched
    object oIntruder = GetCreatureOverrideAIScriptTarget();
    ClearCreatureOverrideAIScriptTarget();
    int bAura = GetLocalInt(OBJECT_SELF,"aura");
    if (!bAura==1)
    {
        string sScript = GetLocalString(OBJECT_SELF,"Aura_Script");
        ExecuteScript(sScript,OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"aura",1);
    }

    if ( !GetCanAct(OBJECT_SELF) )
    {
        SetCreatureOverrideAIScriptFinished();
        return;
    }
    if ( GetLocalInt(OBJECT_SELF,"Acting") == 1 )
    {
//        SpeakString("I am acting! rawr!");
        SetCreatureOverrideAIScriptFinished();
        return;
    }
/*    if ( d6() == 1 ) // in case they get busy-stuck, also to add randomness
    {
        SetLocalInt(OBJECT_SELF,"busy",FALSE);
        return;
    } */
    // Don't inturupt actions in progress


    if ( GetCurrentAction() == ACTION_CASTSPELL )
    {
//        SpeakString("I am casting! Rawr!");
        SetCreatureOverrideAIScriptFinished();
        return;
    }

    if ( GetLocalInt(OBJECT_SELF,"physical") )
    {
//        SpeakString("Time to die!");
        ClearAllActions();
        DoPhysical(oIntruder,OBJECT_SELF);
        return;
    }
    // Haste = Super awesome;
    // Get those summons in there!
    int nSummonCount = GetLocalInt(OBJECT_SELF,"SummonCount");
    if ( !GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_SUMMONED)) &&  nSummonCount < 5 )
    {
        nSummonCount++;
        SetLocalInt(OBJECT_SELF,"SummonCount",nSummonCount);
        SpeakString(COLOR_RED+"Rise my children!!");
        ClearAllActions();
        ActionUseFeat(FEAT_ZONE_OF_ANIMATION, OBJECT_SELF); //PRC Addition -DMH
        ActionCastFakeSpellAtLocation(SPELL_SUMMON_CREATURE_IX,GetLocation(OBJECT_SELF));
        effect eSummon = EffectSummonCreature("nightwalker001",VFX_FNF_SUMMON_MONSTER_3,1.0);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eSummon,GetLocation(OBJECT_SELF),HoursToSeconds(24));
        SetCreatureOverrideAIScriptFinished();
        return;
    }


    // Hostile targeting actions
    if ( !GetIsObjectValid(oIntruder) || !GetIsReactionTypeHostile(oIntruder) )
    {
        oIntruder = GetNearestPerceivedEnemy();
        if ( !GetIsObjectValid(oIntruder) )
            return;
    }


    // Melee up sometimes!

    if ( d6() == 6 )
    {
        switch ( d4() )
        {
            case 1:
                PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
                break;
            case 2:
                PlayVoiceChat(VOICE_CHAT_ATTACK);
                break;
            case 3:
                PlayVoiceChat(VOICE_CHAT_BATTLECRY2);
                break;
            case 4:
                PlayVoiceChat(VOICE_CHAT_BATTLECRY3);
                break;
        }

//        SpeakString("DIEDIEIDE");
        SetLocalInt(OBJECT_SELF,"physical",1);
        DelayCommand(24.0,SetLocalInt(OBJECT_SELF,"physical",0));
        ClearAllActions();
        DoPhysical(oIntruder,OBJECT_SELF);
        return;
    }
}



