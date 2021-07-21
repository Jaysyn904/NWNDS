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

        ExecuteScript("rotaura",OBJECT_SELF);

//        SetCreatureOverrideAIScriptFinished();
        SetLocalInt(OBJECT_SELF,"aura",1);
        return;
    }

}
