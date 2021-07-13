#include "nw_i0_generic"
#include "x2_inc_switches"
#include "inc_AI"

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
        ExecuteScript(sScript,OBJECT_SELF);

//        SetCreatureOverrideAIScriptFinished();
        SetLocalInt(OBJECT_SELF,"aura",1);
        return;
    }
    if ( TalentSummonAllies() )
    {
//        SpeakString("Calling TalentSummonAllies!");
//        SpeakString("Summoned Monster = " + GetName(GetAssociate(ASSOCIATE_TYPE_SUMMONED)) );

//        SpeakString("Come to my side! Battle awaits!");
        PlayVoiceChat(VOICE_CHAT_HELP);
//        SetLocalInt(OBJECT_SELF,"busy",TRUE);
//        ActionDoCommand(SetLocalInt(OBJECT_SELF,"busy",FALSE));
        SetCreatureOverrideAIScriptFinished();
        return;
    }

}

