//::///////////////////////////////////////////////
//:: Example XP2 OnItemAcquireScript
//:: x2_mod_def_aqu
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "yr_inc_effects"
#include "nw_i0_plotwizard"
#include "x2_inc_switches"
//#include "ar_db_main"

float fDelay = 300.0; // Stay either in full minutes or less than a minute
void wow_PickPocket();
void wow_CheckPP(object oPP, string sName, int nPPTimes, int nRan = 0, int nTimesToRun = 0);
void PickPocketing();

void main()
{
     object oItem = GetModuleItemAcquired();
     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACQUIRE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

}

void wow_CheckPP(object oPP, string sName, int nPPTimes, int nRan = 0, int nTimesToRun = 0)
{
    if(nRan == 0)
    {
        if(fDelay > 60.0)
        {
            nTimesToRun = FloatToInt(fDelay / 60.0) + 1;
            nRan++;
            DelayCommand(60.0, wow_CheckPP(oPP, sName, nPPTimes, nRan, nTimesToRun));
        }
        else
        {
            nTimesToRun = 1;
            nRan++;
            DelayCommand(fDelay, wow_CheckPP(oPP, sName, nPPTimes, nRan, nTimesToRun));
        }
    }
    else
    {
        nRan++;
        if(GetLocalInt(oPP, sName+"_PICKPOCKETED") == nPPTimes)
        {
            if(nRan <= nTimesToRun) DelayCommand(60.0, wow_CheckPP(oPP, sName, nPPTimes, nRan, nTimesToRun));
            else
            {
                DeleteLocalInt(oPP, sName+"_PICKPOCKETED");
                if(GetLocalInt(oPP, sName+"_AFFECTED"))
                {
                    RemoveLocalEffect(oPP, sName+"_PP_EFFECT_"+IntToString(nPPTimes));
                    DeleteLocalInt(oPP, sName+"_AFFECTED");
                }
            }
        }
    }
}

void wow_PickPocket()
{
    object oItem = GetModuleItemAcquired();
    object oLoser = GetModuleItemAcquiredFrom();

    if(GetIsPC(oLoser) && GetStolenFlag(oItem))
    {
        object oTaker = GetModuleItemAcquiredBy();

        if(GetHasSkill(SKILL_PICK_POCKET, oTaker))
        {
            string sLoser = GetName(oLoser);
            int nPP = GetLocalInt(oTaker, sLoser+"_PICKPOCKETED");

            if(nPP > 1 && CheckLocalEffect(oTaker, sLoser+"_PP_EFFECT_"+IntToString(nPP))) RemoveLocalEffect(oTaker, sLoser+"PP_EFFECT_"+IntToString(nPP));

            nPP++;
            SetLocalInt(oTaker, sLoser+"_PICKPOCKETED", nPP);

            if(nPP > 1)
            {
                effect eSkill = EffectSkillDecrease(SKILL_PICK_POCKET, (nPP - 1) * 5);
                eSkill = ExtraordinaryEffect(eSkill);
                SetLocalEffect(oTaker, eSkill, sLoser+"_PP_EFFECT_"+IntToString(nPP));
                SetLocalInt(oTaker, sLoser+"_AFFECTED", TRUE);
            }
            wow_CheckPP(oTaker, sLoser, nPP);
        }
    }
}


void PickPocketing()
{
    //Get the object that lost the item
    object oTarget = GetModuleItemAcquiredFrom();
    //Get the object that was acquired
    object oItem = GetModuleItemAcquired();
    //Get the thief
    object oThief = GetItemPossessor(oItem);

    if(GetIsPC(oThief) && GetIsPC(oTarget))
    {
        //If it's stolen, do this
        if(GetStolenFlag(oItem))
        {
            //If it's not plot they can take it
            if(!GetPlotFlag(oItem))
            {
                //If the item is too heavy then limit what the thief can do
                SetIdentified(oItem, FALSE);
                if(!(GetWeight(oItem) <= 30))
                {
                    //The thief gets 10% of the targets gold
                    int nStolenGold = FloatToInt(GetGold(oTarget) * 0.1);

                    //Give the thief his gold
                    AssignCommand(oThief, GiveGoldToCreature(oThief, nStolenGold));
                    //Take the stolen gold amount from the target
                    TakeGold(nStolenGold, oTarget);

                    //Tell the target what happened
                    SendMessageToPC(oTarget, "You notice a thief attempting to steal from you!");
                    //Tell the thief what happened
                    SendMessageToPC(oThief, "You attempted to take an item that was too heavy.  You were able to grab some gold, but you were noticed.");
                    //Give it back to the target
                    CreateItemOnObject(GetTag(oItem), oTarget, GetNumStackedItems(oItem));
                    //Destroy the stolen item
                    DestroyObject(oItem);
                }
                SetIdentified(oItem, TRUE);
            }
            //Plot items are protected
            else
            {
                //Tell the target what happened
                SendMessageToPC(oTarget, "You notice a thief attempting to steal from you!");
                //Tell the thief what happened
                SendMessageToPC(oThief, "You attempted to take an item that was plot protected. You were noticed.");
                //Give it back to the target
                CreateItemOnObject(GetTag(oItem), oTarget, GetNumStackedItems(oItem));
                //Destroy the stolen item
                DestroyObject(oItem);
            }
        }
    }
}
