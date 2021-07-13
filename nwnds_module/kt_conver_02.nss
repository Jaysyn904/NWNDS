//::///////////////////////////////////////////////
//:: FileName kt_conver_01
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Paul Rowland
//:: Created On: 25/07/2002 18:51:59
//::
// ** If your Journal entry is called 'kt_journal_01', then the only change to
// ** this script should be the creature TAG's in the CASE statement to match the
// ** creatures in your module.
// ** The random number should reflect the number of TAG's in the list
// ** also.
//Journal entry notes:
//Under the 'Other Actions' tab, enter a Journal entry to the
//converstaion entitled 'Kill Tasks' and a tag of 'kt_journal_01'.
//The Journal tag must be the same name as the script on the creatures
//'OnDeath' script and the NPC's (this) 'OnConversation' script.
//For each creature Tag entry in the CASE statment below, a journal entry
//under the 'Kill tasks' category must exist, ie
//+ Kill Tasks
// [0001]- You have been asked to search the South and kill an Orc.
// [0002]- You have been asked to go into the Caves and kill a Goblin.
// [----]- etc.
// [0099]- You have completed the task, return for your reward
//
//The journal entry ID's must be the same as the number in the CASE statment.
//There dosn't seem to be a way of entering custom tokens or variables
//to a Journal via any of the Journal Functions supplied by Bioware.
//
//I have tried to keep this example as simple as possible, below are a list
//of improvements you can easily implement once you've got it up and running
//in your own module.
//Enhancement Notes:
// 1) Time expiriy on tasks
// Set up a counter in the OnHeartbeat{} of NPC (this), and check
// in the OnConversation() of NPC (this) when PC returns.
// 2) Fail task if PC dies
// Set 'KILL_TASK_FLAG' to zero in the OnDeath() of the PC.
// 3) Re-spawn the slain creature on completion of task.
// Grab a copy of the creatures 'sTemplate' and 'lLocation' below.
// Then use the CreateObject() function when the PC completes the
// task in the 'OnConversation()' of the NPC (this).
// The module where this example has been derived uses a MMORPG style
// 'creature management' script, and therefore is out of scope here.
// 4) Handle players of all levels, 1-20
// add additional SWITCH blocks inside the CASE's of the existing SWITCH block
// allowing a choice of 4, one for each level group, 1-5, 6-10, 11-15 & 16 -20
// Use the GetCharacterLevel().
//:://////////////////////////////////////////////
void main()
{
    // set up local work variables
    object oPC = GetPCSpeaker();
    int nHD = GetHitDice(oPC);
    string sDeliveryTarget;
    int nRandom;
    int found = FALSE; // whats wrong with this language, no boolean!!
    int loop = 0;
    if(GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 1)
    {
        ActionSpeakString("You already have a task.");
    }
    else
    {
        // keep re-rolling if creature TAG not found and try another , stop
        // after 10 or so trys just incase no creatures at all exist on
        // list, at least we tried
        while(!found)
        {
            nRandom = d6();
            SetLocalString(oPC, "DELIVERY_TASK_NPC", GetName(OBJECT_SELF));

            // asign random kill target creature TAGs
            if(nHD < 10)
            {
                switch(nRandom)
                {
                    case 1:
                            sDeliveryTarget = "NPC_MORIAN"; // Morian the Veteran
                            break;                          // Sitting Lounge
                    case 2:
                            sDeliveryTarget = "NPC_MORIC";  // Moric the Caravan Guard
                            break;                          // Caravan Pub
                    case 3:
                            sDeliveryTarget = "NPC_DOND";   // Dond the Noble
                            break;                          // The Adventurer's Hall
                    case 4:
                            sDeliveryTarget = "NPC_BRAN";   // Bran the Courier
                            break;                          // Destiny's Shadow
                    case 5:
                            sDeliveryTarget = "NPC_KELL";   // Kell the Veteran
                            break;                          // Arena Foyer
                    case 6:
                            sDeliveryTarget = "NPC_ROLIN";  // Rolin  
                            break;                          // Rolin's House
                }
            } // if
            SetLocalString(oPC, "DELIVERY_TASK_TARGET", sDeliveryTarget);

            // check to see if we have a valid target, if not then creature
            // dosn't exist in module, may have all been killed before
            if(GetStringLength(GetName(GetObjectByTag(sDeliveryTarget))) > 0)
            {
                found = TRUE;
            }
            // not found really, but must end looping, tried 10 different creatures,
            // maybe the module designer forgot to put any in?
            if (loop > 10)
            {
                ActionSpeakString("I have no more tasks for you.  Leave me alone.");
                return;
            }
            loop++;
        }
        // journal entry
        if(GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 1)
        {
            //ActionSpeakString("You already have a task.");
        }
        else
        {
            AddJournalQuestEntry("kt_journal_02", nRandom, oPC);
        }


        string sDeliveryItem;
        //int nRandom;
        found = FALSE; // whats wrong with this language, no boolean!!
        loop = 0;

        // keep re-rolling if creature TAG not found and try another , stop
        // after 10 or so trys just incase no creatures at all exist on
        // list, at least we tried
        while (!found)
        {
            nRandom = d10();
            SetLocalString(oPC, "DELIVERY_TASK_NPC", GetName(OBJECT_SELF));

            // asign random kill target creature TAGs
            if(nHD < 10)
            {
                switch(nRandom)
                {
                    case 1:
                            sDeliveryItem = "NW_IT_GEM001";     // Greenstone
                            break;
                    case 2:
                            sDeliveryItem = "NW_IT_GEM004";     // Phenalope
                            break;
                    case 3:
                            sDeliveryItem = "NW_CLOTH027";      // Adept's Tunic
                            break;
                    case 4:
                            sDeliveryItem = "NW_CLOTH006";      // Veteran's Outfit
                            break;
                    case 5:
                            sDeliveryItem = "NW_CLOTH012";      // Conjurer's Robe
                            break;
                    case 6:
                            sDeliveryItem = "NW_CLOTH011";      // Gladiator's Outfit
                            break;
                    case 7:
                            sDeliveryItem = "NW_IT_MSMLMISC11"; // Quartz Crystal 
                            break;
                    case 8:
                            sDeliveryItem = "NW_IT_MMIDMISC05"; // Meat
                            break;
                    case 9:
                            sDeliveryItem = "NW_IT_MSMLMISC22"; // Top 
                            break;
                    case 10:
                            sDeliveryItem = "NW_IT_TORCH001";   // Torch
                            break;
                }
            } // if
            SetLocalString(oPC, "DELIVERY_TASK_ITEM", sDeliveryItem);

            // check to see if we have a valid target, if not then creature
            // dosn't exist in module, may have all been killed before
            //if(GetStringLength(GetName(GetObjectByTag(sDeliveryItem))) > 0){
            found = TRUE;
            //}
            // not found really, but must end looping, tried 10 different creatures,
            // maybe the module designer forgot to put any in?
            if ((loop > 10) || (nHD > 9))
            {
                ActionSpeakString("I have no more tasks for you.  Leave me alone.");
                return;
            }
            loop++;
        }

        // acknowledge setting of task
        if (GetLocalInt(oPC, "DELIVERY_TASK_FLAG") == 1)
        {
            ActionSpeakString("You already have a task.");
        }
        else
        {
            ActionSpeakString("Your task is to take a " + GetName(GetObjectByTag(sDeliveryItem)) + " to " + GetName(GetObjectByTag(sDeliveryTarget)) + " good luck and don't forget to return to me for your reward!");
            // set the kill task varable
            SetLocalInt(oPC, "DELIVERY_TASK_FLAG", 1);

            // journal entry
            AddJournalQuestEntry("kt_journal_03", nRandom, oPC);
        }
    }
}
