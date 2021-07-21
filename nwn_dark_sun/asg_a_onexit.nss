//::///////////////////////////////////////////////
//:: Name       ASG Spawn Kit - OnAreaExit
//:: FileName   asg_a_onexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    part of the ASG Spawn Kit. Handles Mob Cleanup

*/
//:://////////////////////////////////////////////
//:: Created By:    Donny Wilbanks
//:: Created On:    05/13/03
//:://////////////////////////////////////////////


#include "asg_i_spawnkit"

int OAX_DEBUG = FALSE;
void main()
{
   object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        object oArea = GetArea(OBJECT_SELF);
        object o1stO = GetFirstObjectInArea(oArea);
        string sATag = GetTag(oArea);
        string sPTag;

        // Check to see if ANY PC's other than DM's are in area.
        // object oPlayers =  GetFirstPC(); - Testing Fix
        object oPCArea;
        int iCount = 0;
        // OverRide
        // Found that when I was flying out with my new wings It's considered leaving
        // the area. Here's a overide
        int iPCFlying = GetLocalInt(oPC,"ASG_SPAWNKIT_PCFLYING");
        object oPlayers = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC,o1stO);
        if (GetIsPC(oPlayers)==TRUE || GetIsDM(oPlayers)==TRUE)
        {
            iCount=1000;
        }
        /*
        while(GetIsObjectValid(oPlayers))
        {
            oPCArea = GetArea(oPC);
            sPTag = GetTag(oPC);
            if (sPTag == sATag) iCount++;
            oPlayers = GetNextPC();
        }
        */
        if (iCount==0 && GetIsObjectValid(o1stO)==TRUE && GetIsObjectValid(oPlayers)!=TRUE && iPCFlying==FALSE)
        {
            // > * DEBUG
            if (OAX_DEBUG==TRUE)
            {
                PrintString("(~) No Other Players Found in Area "+GetName(oArea)+", Starting Clean Up.");
                PrintString("(>) ... Center Object: "+GetName(o1stO));
                PrintString("(>) ... oPlayer: "+GetName(oPlayers));
            }
            // Check to see if ANY PC's other than DM's are in are
            asg_CleanArea(oArea);

        }
        else
        {
            // > * DEBUG
            if (OAX_DEBUG==TRUE)
            {
                PrintString("(!) Players Found in Area "+GetName(oArea)+", Not Cleaning Area Up.");
            }
            // Check to see if ANY PC's other than DM's are in are
        }
    }
    //
    // Execute Local Custom Scripts Here
    //
    if (GetIsPC(oPC) || GetIsDM(oPC))
    {
        object oASG_SPKit = GetNearestObjectByTag("ASG_SPAWNKIT_XAREAINFO",oPC);
        string sScript_OnEnter = GetLocalString(oASG_SPKit,"SPK_Script_OnExit");
        if (sScript_OnEnter != "SCRIPT_INVALID")
        {
            ExecuteScript(sScript_OnEnter,OBJECT_SELF);
        }
        // Check for Global
        sScript_OnEnter = GetLocalString(GetModule(),"ASG_SPKIT_ONEXIT");
        if (sScript_OnEnter != "SCRIPT_INVALID")
        {
            ExecuteScript(sScript_OnEnter,OBJECT_SELF);
        }
    }





}
