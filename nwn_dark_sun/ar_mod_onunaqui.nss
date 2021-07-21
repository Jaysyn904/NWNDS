//::///////////////////////////////////////////////
//:: Example XP2 OnItemUnAcquireScript
//:: x2_mod_def_unaqu
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemUnAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

#include "x2_inc_switches"

void main()
{
     object oItem = GetModuleItemLost();
     object oPC = GetModuleItemLostBy();
     if(!GetIsPC(oPC)) return;

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
        {
            SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNACQUIRE);
            int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
            if (nRet == X2_EXECUTE_SCRIPT_END)
                {
                    return;
                }

        }
    //Start BESIE Spawn System
    int iMph;
    if(!GetLocalInt(GetModule(), "re_iMph"))
        {
        iMph = 2;
        }
    else
        {
        iMph = GetLocalInt(GetModule(), "re_iMph");
        }
    int iMin = 60;
    int iHr = iMin * iMph;
    int iDay = iHr * 24;
    int iMth = iDay * 28;
    int iYr = iMth * 12;
    object oAmIDroppedLoot = GetModuleItemLost();
    if(GetIsObjectValid(oAmIDroppedLoot))
        {
        SetLocalInt(oAmIDroppedLoot, "re_bDroppedItem", TRUE);
        SetLocalInt(oAmIDroppedLoot, "re_iDropTime", (GetCalendarYear() * iYr) + (GetCalendarMonth() * iMth) + (GetCalendarDay()* iDay) + (GetTimeHour()* iHr) + (GetTimeMinute() * iMin) + GetTimeSecond());
        }
    //End BESIE Spawn System
}