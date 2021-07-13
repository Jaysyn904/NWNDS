//::///////////////////////////////////////////////
//:: Default: Commoner Cast At
//:: ds_comoncastat
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    ExecuteScript("prc_npc_spellat", OBJECT_SELF);
    object oPC = GetLastSpellCaster();
    if(GetIsDM(oPC) || GetIsDMPossessed(oPC) || !GetIsPC(oPC))
        {
        string sMsg ="Thank you, master.  May I have another?" ;
        SpeakString(sMsg, TALKVOLUME_WHISPER);
        return;
        }
SpeakString("Magic! Guards!", TALKVOLUME_TALK);
if (d4() > 2) {
DelayCommand(2.0,AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Jail")))));
DelayCommand(6.0,FloatingTextStringOnCreature(GetName(oPC)+" has been arrested for magic use.",oPC,FALSE));
DelayCommand(7.0,SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC));
}
    object oCaster = GetLastSpellCaster();
    if(GetLastSpellHarmful())
    {
        if(
         !GetIsObjectValid(GetAttackTarget()) &&
         !GetIsObjectValid(GetAttemptedSpellTarget()) &&
         !GetIsObjectValid(GetAttemptedAttackTarget()) &&
         GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN))
        )
        {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
            {
                DetermineSpecialBehavior(oCaster);
            }
            else
            {
                DetermineCombatRound(oCaster);
            }
            //Shout Attack my target, only works with the On Spawn In setup
            SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
            //Shout that I was attacked
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        }
    }
    if(GetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1011));
    }

}
