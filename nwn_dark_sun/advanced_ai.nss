
#include "nw_i0_generic"
#include "x2_inc_switches"
#include "inc_AI"

void DoPhysical( object oTarget )
{
    if ( !GetIsObjectValid(oTarget) || !GetIsEnemy(oTarget) )
    {
        oTarget = GetNearestEnemy();
        if ( !GetIsObjectValid(oTarget) )
            return;
    }
    object oEquip = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    if ( GetDistanceToObject(oTarget) > FeetToMeters(20.0) )
    {
        if ( !GetIsObjectValid( oEquip ) || !GetWeaponRanged( oEquip ) )
            ActionEquipMostDamagingRanged();
        ActionAttack(oTarget);
    }
    else
    {
        if ( !GetIsObjectValid( oEquip ) || GetWeaponRanged( oEquip ) )
            ActionEquipMostDamagingMelee();
        TalentMeleeAttack(oTarget);
    }
    SetCreatureOverrideAIScriptFinished();

}

void main()
{
    // The following two lines should not be touched
    object oIntruder = GetCreatureOverrideAIScriptTarget();
    ClearCreatureOverrideAIScriptTarget();
    if ( !GetCanAct(OBJECT_SELF) )
    {
        SetCreatureOverrideAIScriptFinished();
        return;
    }

    int bAura = GetLocalInt(OBJECT_SELF,"aura");
    if ( !bAura )
    {
//        ActionCastFakeSpellAtLocation(SPELL_SUMMON_SHADOW,GetLocation(OBJECT_SELF));


        string sScript = GetLocalString(OBJECT_SELF,"Aura_Script");
//        SpeakString("Running script " + sScript,TALKVOLUME_SHOUT);

//        ClearAllActions();
        if ( sScript != "" )
            ExecuteScript(sScript,OBJECT_SELF);

//        SetCreatureOverrideAIScriptFinished();
        SetLocalInt(OBJECT_SELF,"aura",1);
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
        SetCreatureOverrideAIScriptFinished();
        return;
    }

    if ( GetLocalInt(OBJECT_SELF,"physical") )
    {
        ClearAllActions();
        DoPhysical(oIntruder);
        return;
    }
    // Haste = Super awesome;
    if ( !GetHasEffect(EFFECT_TYPE_HASTE ) && ( GetHasSpell(SPELL_HASTE) ||
        GetHasSpell(SPELL_MASS_HASTE) ) )
    {
//        SpeakString("Time for haste!!!");

        if ( GetHasSpell(SPELL_MASS_HASTE) )
        {
            ClearActions(1001);
//            SetLocalInt(OBJECT_SELF,"busy",TRUE);
            ActionCastSpellAtObject(SPELL_MASS_HASTE,OBJECT_SELF);
//            ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
            SetCreatureOverrideAIScriptFinished();
            return;
        }
        if ( GetHasSpell(SPELL_HASTE) )
        {
            ClearActions(1001);
//            SetLocalInt(OBJECT_SELF,"busy",TRUE);
            ActionCastSpellAtObject(SPELL_HASTE,OBJECT_SELF);
//            ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
            SetCreatureOverrideAIScriptFinished();
            return;
        }
        SpeakString("WTF HASTE ERROR!!!");
    }

    // Get those summons in there!
    if ( GetHasSpell(SPELL_ELEMENTAL_SWARM) )
    {
            ClearAllActions();
//            SetLocalInt(OBJECT_SELF,"busy",TRUE);
            PlayVoiceChat(VOICE_CHAT_HELP);
            ActionCastSpellAtObject(SPELL_ELEMENTAL_SWARM,OBJECT_SELF);
//            ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
            SetCreatureOverrideAIScriptFinished();
            return;
    }
    if ( TalentSummonAllies() )
    {
//        SpeakString("Come to my side! Battle awaits!");
        PlayVoiceChat(VOICE_CHAT_HELP);
//        SetLocalInt(OBJECT_SELF,"busy",TRUE);
//        ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
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

    // Dispel Casters
    if ( !GetLocalInt(OBJECT_SELF,"Dispel_once") &&
       ( GetLevelByClass(CLASS_TYPE_SORCERER, oIntruder) >= 10 ||
         GetLevelByClass(CLASS_TYPE_WIZARD, oIntruder) >= 10 ||
         GetLevelByClass(CLASS_TYPE_CLERIC, oIntruder) >= 10 ||
         GetLevelByClass(CLASS_TYPE_SORCERER, oIntruder) >= 10 ||
         GetLevelByClass(CLASS_TYPE_DRUID, oIntruder) >= 10 ) )
    {
        if ( GetHasSpell(SPELL_MORDENKAINENS_DISJUNCTION) ||
             GetHasSpell(SPELL_GREATER_DISPELLING) ||
             GetHasSpell(SPELL_DISPEL_MAGIC) ||
             GetHasSpell(SPELL_GREATER_SPELL_BREACH) ||
             GetHasSpell(SPELL_LESSER_SPELL_BREACH) )
         {
            SetLocalInt(OBJECT_SELF,"Dispel_once",1);
//            SpeakString("I will dispel you!!");
            if ( GetHasSpell(SPELL_GREATER_SPELL_BREACH) )
            {
                ClearActions(1001);
//                SetLocalInt(OBJECT_SELF,"busy",TRUE);
                ActionCastSpellAtObject(SPELL_GREATER_SPELL_BREACH,oIntruder);
//                ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
                SetCreatureOverrideAIScriptFinished();
                return;
            }
            if ( GetHasSpell(SPELL_LESSER_SPELL_BREACH) )
            {
                ClearActions(1001);
//                SetLocalInt(OBJECT_SELF,"busy",TRUE);
                ActionCastSpellAtObject(SPELL_LESSER_SPELL_BREACH,oIntruder);
//                ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
                SetCreatureOverrideAIScriptFinished();
                return;
            }
            if ( GetHasSpell(SPELL_MORDENKAINENS_DISJUNCTION) )
            {
                ClearActions(1001);
//                SetLocalInt(OBJECT_SELF,"busy",TRUE);
                ActionCastSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION,oIntruder);
//                ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
                SetCreatureOverrideAIScriptFinished();
                return;
            }
            if ( GetHasSpell(SPELL_GREATER_DISPELLING) )
            {
                ClearActions(1001);
//                SetLocalInt(OBJECT_SELF,"busy",TRUE);
                ActionCastSpellAtObject(SPELL_GREATER_DISPELLING,oIntruder);
//                ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
                SetCreatureOverrideAIScriptFinished();
                return;
            }
            if ( GetHasSpell(SPELL_DISPEL_MAGIC) )
            {
                ClearActions(1001);
//                SetLocalInt(OBJECT_SELF,"busy",TRUE);
                ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oIntruder);
//                ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
                SetCreatureOverrideAIScriptFinished();
                return;
            }
            SpeakString("WTF! Dispel Error!");
         }
    }

    // Melee up sometimes!


    if ( d10() == 10 )
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

        SetLocalInt(OBJECT_SELF,"physical",1);
        DelayCommand(24.0,SetLocalInt(OBJECT_SELF,"physical",0));
        ClearAllActions();
        DoPhysical(oIntruder);
        return;
    }
}



