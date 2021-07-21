//:://////////////////////////////////////////////////
//:: ds_killinnocent
/*
  OnDeath event handler for commoner NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////
//:: Modified By: Deva Winblood
//:: Modified On: April 1st, 2008
//:: Added Support for Dying Wile Mounted
//:://///////////////////////////////////////////////

#include "x2_inc_compon"
#include "x0_i0_spawncond"
//#include "x3_inc_horse"

void ClearSlot(int iSlotID);

void main()
{

    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();

    ExecuteScript("prc_npc_death", OBJECT_SELF);
    ExecuteScript("prc_pwondeath", OBJECT_SELF);

    if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB")&&GetIsObjectValid(GetMaster(OBJECT_SELF)))
        SetLocalInt(GetMaster(OBJECT_SELF),"bX3_STORE_MOUNT_INFO",TRUE);

        // Default Commoner alignment changing. (If the commoner is not evil!)
    if (nClass > 1 &&
        GetAlignmentGoodEvil(OBJECT_SELF) != ALIGNMENT_EVIL)
    {
        if(GetIsPC(oKiller))
        {
            AdjustAlignment(oKiller, ALIGNMENT_EVIL, 10);
        }
        else
        {
            // If it is a summon, henchmen or familar of a PC, we adust the PC itself
            // Clever, eh?
            object oMaster = GetMaster(oKiller);
            if(GetIsObjectValid(oMaster) && GetIsPC(oMaster))
            {
                AdjustAlignment(oMaster, ALIGNMENT_EVIL, 5);
            }
        }
    }

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    craft_drop_items(OBJECT_SELF);

    ClearSlot(INVENTORY_SLOT_CHEST);

    // initialise local variables
    int nKillFlag = GetLocalInt(GetLastKiller(), "KILL_TASK_FLAG");
    object oPC = GetLastKiller();
    string sTagSelf = GetTag(OBJECT_SELF);
    string sTagTarget = GetLocalString(oPC, "KILL_TASK_TARGET");
    AdjustAlignment (oPC, ALIGNMENT_EVIL, 7);
    // check for correct kill task target and complete
    if(sTagSelf == sTagTarget && nKillFlag == 1)
    {
    SetLocalInt(oPC, "KILL_TASK_FLAG", 2);
    AddJournalQuestEntry("kt_journal_01", 99, oPC);
    }
}

void ClearSlot(int iSlotID)
{
    object oItem = GetItemInSlot(iSlotID);
    if(GetIsObjectValid(oItem))
    {
        if(!GetDroppableFlag(oItem))
            DestroyObject(oItem);
    }
}
