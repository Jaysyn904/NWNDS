//::///////////////////////////////////////////////
//:: SetListeningPatterns + kill tasks
//:: kt_c2_default4 (nw_c2_default4)
//:: Copyright (c) 2001.
//:://////////////////////////////////////////////
/*
Determines the course of action to be taken
by the generic script after dialogue or a
shout is initiated.

Also checks for completion of a Kill task.
*/
//:://////////////////////////////////////////////
//:: Created By: Paul Rowland
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    object oIntruder;

    ////////// kill task code insert here////////////////////////

    // On detecting a player that has entered dialog with the NPC (this), and
    // has the 'Kill_task' variable atatched to itself equal '2', complete. Then
    // reset variables, delete journal entry and award experience.
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetLocalInt(oPC, "KILL_TASK_FLAG") == 2)
    {
        SetLocalInt(oPC, "KILL_TASK_FLAG", 0);
        RemoveJournalQuestEntry("kt_journal_01", oPC);
        GiveXPToCreature(oPC, 250);
        GiveGoldToCreature(oPC, 75);
        ActionSpeakString("Here is your reward.");
        // If we grabed a copy of the creatures 'sTemplate' and 'lLocaction' when
        // asigning the task, we could re-spawn the creature back by using the
        // CreateObject() function. Creature managment is a bit out of scope for
        // this example.
        SetLocalString(oPC, "KILL_TASK_TARGET", "");
    }

    // On detecting a player that has entered dialog with the NPC (this), and
    // has the 'Kill_task' variable atatched to itself equal '2', complete. Then
    // reset variables, delete journal entry and award experience.
    //object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 2)
    {
        SetLocalInt(oPC, "DELIVERY_TASK_FLAG", 0);
        RemoveJournalQuestEntry("kt_journal_02", oPC);
        RemoveJournalQuestEntry("kt_journal_03", oPC);
        GiveXPToCreature(oPC, 100);
        GiveGoldToCreature(oPC, 50);
        ActionSpeakString("Here is your reward.");
        // If we grabed a copy of the creatures 'sTemplate' and 'lLocaction' when
        // asigning the task, we could re-spawn the creature back by using the
        // CreateObject() function. Creature managment is a bit out of scope for
        // this example.
        SetLocalString(oPC, "DELIVERY_TASK_TARGET", "");
        SetLocalString(oPC, "DELIVERY_TASK_ITEM", "");
    }


    ////////// kill task code end here////////////////////////

    if (nMatch == -1 && GetCommandable(OBJECT_SELF))
    {
        ClearAllActions();
        BeginConversation();
    }
    else if(nMatch != -1 && GetIsObjectValid(oShouter) && !GetIsPC(oShouter) && GetIsFriend(oShouter))
    {
        if(nMatch == 4)
        {
            oIntruder = GetLocalObject(oShouter, "NW_BLOCKER_INTRUDER");
        }
        else if (nMatch == 5)
        {
            oIntruder = GetLastHostileActor(oShouter);
            if(!GetIsObjectValid(oIntruder))
            {
                oIntruder = GetAttemptedAttackTarget();
                if(!GetIsObjectValid(oIntruder))
                {
                    oIntruder = GetAttemptedSpellTarget();
                    if(!GetIsObjectValid(oIntruder))
                    {
                        oIntruder = OBJECT_INVALID;
                    }
                }
            }
        }
        RespondToShout(oShouter, nMatch, oIntruder);
    }


    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1004));
    }
}
