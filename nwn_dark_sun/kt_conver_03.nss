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
    if(GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 1)
    {
        int nDeliveryFlag = GetLocalInt(oPC, "DELIVERY_TASK_FLAG");
        string sTagItem = GetLocalString(oPC, "DELIVERY_TASK_ITEM");
        object oItemToTake = GetItemPossessedBy(oPC, sTagItem);
        string sTagSelf = GetTag(OBJECT_SELF);
        string sTagTarget = GetLocalString(oPC, "DELIVERY_TASK_TARGET");

        // check for correct kill task target and complete
        if(sTagSelf == sTagTarget && nDeliveryFlag == 1 && GetIsObjectValid(oItemToTake) != 0)
        {
            SetLocalInt(oPC, "DELIVERY_TASK_FLAG", 2);
            DestroyObject(oItemToTake);
            AddJournalQuestEntry("kt_journal_02", 99, oPC);
            AddJournalQuestEntry("kt_journal_03", 99, oPC);
            ActionSpeakString("Thank you.");
        }
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
