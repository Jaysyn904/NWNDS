//::///////////////////////////////////////////////
//:: Name       ASG SpawnKit On Enter
//:: FileName   asg_a_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Place this script on you area's on enter event
*/
//:://////////////////////////////////////////////
//:: Created By:    Donny Wilbanks
//:: Created On:    9/8/03
//:://////////////////////////////////////////////

#include "asg_i_spawnkit"
// #include "asg_i_dbplayer" // For the GetLocalKey

void main()
{
    object oPC = GetEnteringObject();
    object oSpawnPoint;

    int iPCFlying = GetLocalInt(oPC,"ASG_SPAWNKIT_PCFLYING");
    int iVersion;
    int iASGQInit = GetLocalInt(GetModule(),"ASG_QUESTENGINE_INT");

    string sAreaN = GetName(OBJECT_SELF);
    string sAreaT = GetTag(OBJECT_SELF);
    string sBase = "oSpawnPoint_";
    string sComp;

    if (GetIsPC(oPC) || GetIsDM(oPC) && iPCFlying == FALSE)
    {
        // **************************
        // * Check to see if Config Has been ran
        // **************************
        int iASG_SKIT = GetLocalInt(GetModule(),"ASG_SKIT");
        if (iASG_SKIT == FALSE)
        {
            SetLocalInt(GetModule(),"ASG_SKIT",TRUE);
            ExecuteScript("asg_cfg_spawnkit",GetModule());
        }
        object oArea = GetArea(oPC);
        // *************
        // **
        // ** Send Area Message To PC or DM (vr 1.3)
        // **
        int iASG_SKIT_ADISCR = GetLocalInt(GetModule(),"ASG_SKIT_ADISCR");
        if (iASG_SKIT_ADISCR==TRUE)
        {
            EntryMessage(GetTag(oArea),oPC);
        }
        // *************
        // **
        // ** Check Automap Feature (vr 1.3)
        // **
        int iMap = GetLocalInt(GetModule(),"ASG_SPAWKIT_AUTOMAPPER");
        if (iMap == TRUE)
        {
            // Check to see if a No Auto Map Placeable Present
            if (GetIsObjectValid(GetNearestObjectByTag("ASG_NOAUTOMAP",oPC))!=TRUE)
            {
                ExploreAreaForPlayer(oArea, oPC);
            }
        }
        // ************************************
        // **
        // ** Quest Engine Addon 1.4
        // **
        if (iASGQInit==TRUE)
        {
            int iASG_QE = GetLocalInt(oPC,"ASG_QUESTENGINE");
            if (iASG_QE  == TRUE)
            {
                ExecuteScript("asg_scr_questeng",oPC);
            }
        }
        // *************
        // **
        // ** Check Area Setup - Recored SpawnPoints
        // **
        int iDoneOnce = GetLocalInt(oArea,"ASG_AREA_DONEONCE");
        if (iDoneOnce == FALSE)
        {
            SetLocalInt(oArea,"ASG_AREA_DONEONCE",TRUE);
            asg_SetUpArray(oArea);
        }
        // *************
        // **
        // ** Look For Monsters & Spawn Monsters
        // **
        int iWorking = GetLocalInt(oArea,"ASG_A_SPAWNWORKING");
        // ** Single Spawn in Addon Routine 1.5.03
        int iSingleSpawnIn = 0;
        int iIndex = GetLocalInt(oArea,"ASG_AREA_SPAWNPOINT_INDEX");
        int iK;
        for (iK=1;iK<=iIndex;iK++)
        {
            //sComp = sBase + IntToString(iK);
            //
            // * Check for Legacy
            //
            //oSpawnPoint = GetLocalObject(oArea,sComp);
            //if (GetIsObjectValid(oSpawnPoint))
            //{
            //    iVersion = GetLocalInt(oSpawnPoint,"ASG_Version");
            //    if (iVersion == 14) asg_SpawnCreature14(oArea);
            asg_SpawnCreature(oArea);
            //}
        }
        SendMessageToPC(oPC,"* Standard Spawnin Script Execuited.");
        SendMessageToPC(oPC,"(@) You have entered "+sAreaN);
    }
    // Exicute Custom Scripts Here
    //
    if (GetIsPC(oPC) || GetIsDM(oPC))
    {
        // Local Kit - Found on Config Placeable
        object oASG_SPKit = GetNearestObjectByTag("ASG_SPAWNKIT_XAREAINFO",oPC);
        string sScript_OnEnter = GetLocalString(oASG_SPKit,"SPK_Script_OnEnter");
        if (sScript_OnEnter != "SCRIPT_INVALID")
        {
            ExecuteScript(sScript_OnEnter,OBJECT_SELF);
        }
        // Check for Global
        sScript_OnEnter = GetLocalString(GetModule(),"ASG_SPKIT_ONENTER");
        if (sScript_OnEnter != "SCRIPT_INVALID")
        {
            ExecuteScript(sScript_OnEnter,OBJECT_SELF);
        }

    }




}
