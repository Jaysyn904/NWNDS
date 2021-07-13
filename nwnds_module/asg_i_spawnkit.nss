///////////////////////////////////////////////
//:: Name       ASG Area Include
//:: FileName   asg_i_spawnkit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    version 1.3

    This is the Area Inlcude File for the ASG Spawn Kit

    updated features

    new varible list

    added spawn radious so Mobs don't spawn in ontop of PC's.

    // List of Addon Varibles

    ASG_SpawnLeader - Place a TAG of the creature that this spawn is access to.
    if this creature is not Valid, then the Mob will not spawn.

*/
//:://////////////////////////////////////////////
//:: Created By:    Donny Wilbanks
//:: Created On:    5/13/03
//:://////////////////////////////////////////////
void asg_SpawnCreature(object oArea);
void asg_CleanArea(object oArea);
void asg_SetUpArray(object oArea); // Used on the First Enter
int DEBUG_SPK = FALSE;

#include "NW_I0_GENERIC"
#include "asg_i_skcusttext"

// Module Based Flagsd
float fDestroyTime = GetLocalFloat(GetModule(),"ASG_SPAWNKIT_DESPAWNTIME");

void BiowareClean(object oArea)
{
    // Handle Regular Bioware On Spawn
    /* Added to the ASG Spawn Kit for extra Clean Up adds Standard Clean up
    so that The Spawn Kit can make use of the Bioware Standard Spawn also.
    This just takes the Legacy Section of Mr. Guile's scripts.
    Thanks.
    */
    object oObject = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oObject) == TRUE)
    // makes sure it actually has an object
    {
        if (GetIsEncounterCreature(oObject) == TRUE)
        // if the object is a creature from an encounter
        {
            DestroyObject(oObject);
            // it gets detroyed
        }
        oObject=GetNextObjectInArea(oArea);
        // gets the next object and sends it through the loop
    }
}
// ** Message Kit
void EntryMessage(string sAreaTag,object oPlayer)
{
    string sText = "No Area Details";
    // Get Custom Text
    sText = "** Area Discription: "+ASG_CallAreaText(sAreaTag);
    // Send Messages
    SendMessageToPC(oPlayer,sText);
    SendMessageToPC(oPlayer,"*************************");
}
int iRespawntime = GetLocalInt(GetModule(),"ASG_SPAWKIT_RESPAWNT");
// int iNow = (GetCalendarYear()*10000)+(GetCalendarMonth()*1000)+(GetCalendarDay()*100)+GetTimeHour();
// Hold on just a bit for this one
void asg_SpawnCreature(object oArea)
{
    // * > DEBUG_SPK
    if (DEBUG_SPK == TRUE)
    {
        PrintString("*******************************");
        PrintString("Starting Creature OnEnterArea Script for "+GetName(oArea));
        PrintString("*******************************");
    }
    // *********
    // ** Set as Busy
    SetLocalInt(oArea,"ASG_A_SPAWNWORKING",TRUE);
    int iIndex = GetLocalInt(oArea,"ASG_AREA_SPAWNPOINT_INDEX");

    int iK;
    int iN;
    int iZ; // New ones for the Single Spawn in Routine

    int iSubIndex;

    string sTag;
    string sRight;
    string sRight5;

    string sLeft;
    string sLeft5;
    string sNewTag;

    string sMasterIndex;
    string sSubIndex;
    string sCreature;
    string sCreatureTag;

    string sBase; // Base for String
    string sComp; // Assbembolded String
    int iLen;
    int iWander = FALSE;
    int iCopyObject = FALSE;
    int iPass = TRUE;

    object oCreature;
    object oNewCreature;
    object oSpawnPoint;
    location lLoc;
    string sSpawnTag;
    // Spawn Time Varibles
    int iDawnTime = 0;
    int iDayTime = 0;
    int iDuskTime = 0;
    int iNightTime = 0;
    int iDawnPass = FALSE;
    int iDawnSpawn = FALSE;
    int iDayPass = FALSE;
    int iDaySpawn = FALSE;
    int iDuskPass = FALSE;
    int iDuskSpawn = FALSE;
    int iNightPass = FALSE;
    int iNightSpawn = FALSE;
    int iRoll;
    int iChance;
    int iNeedToRoll = FALSE;
    int iDeleteTime = GetLocalInt(GetModule(),"ASG_SKIT_DELETETIME");


    iZ = 1;
    // Now Check and receive Individual Spawn information
    iZ =  GetLocalInt(oArea,"Monster_Cur")+1;
    if (iZ > iIndex) iZ = 1;
    SetLocalInt(oArea,"Monster_Cur",iZ);
    //
    //for (iK=iZ;iK<iSPZ+1;iK++)
    //{
        iK = iZ;
        iSubIndex = iK;
        //for (iN=iZ;iN<=iSubIndex;iN++)
        // {
            sBase = "oSpawnPoint_";
            sComp = sBase + IntToString(iK);
            // Orignal Spawn Point Locked to Area.
            oSpawnPoint = GetLocalObject(oArea,sComp);
            // DEBUG ***
            if (GetIsObjectValid(oSpawnPoint))
            {
                // Great it's Valid!
                int iRespawnable = GetLocalInt(oSpawnPoint,"SPK_Respawn");
                int nLevelMax = GetLocalInt(oSpawnPoint,"ASG_Spawn_Trait_LevelMax");
                int nLevelMin = GetLocalInt(oSpawnPoint,"ASG_Spawn_Trait_LevelMin");
                object oPC = GetEnteringObject();
                int nPCLevel = GetHitDice(oPC);

                if (iRespawnable == TRUE) return; // Default setting is False
                // used to create the Clear Room Effect, goes away on
                // area empty though.

                // ************************************************************
                // Now for a Custom idea for Level Spawning idea
                if (nPCLevel>=nLevelMax && nLevelMax!=0) return;
                // if PC > nLevelMax (0 will allow it to just spawn in then
                // exit and return
                if (nPCLevel<nLevelMin && nLevelMin!=0) return;
                // if PC < nLevelMin (0 will allow it to just spawn in then
                // exit and return
                // ************************************************************
                //
                // Spawn Times
                //
                iDawnTime = GetLocalInt(oSpawnPoint,"ASG_Spawn_Dawn");
                iDayTime = GetLocalInt(oSpawnPoint,"ASG_Spawn_Day");
                iDuskTime = GetLocalInt(oSpawnPoint,"ASG_Spawn_Dusk");
                iNightTime = GetLocalInt(oSpawnPoint,"ASG_Spawn_Night");
            }
            else
            {
                // Spawn Point not valid, exit out of script.
                return;
            }
            iN = iK; // Addon For Spawn Script
            // *** Creature Tag Information ***
            // First Runn this Creature will not be valid
            // use 1 index number for refrence
            // Lock Creature to Spawn Point;
            sCreature = "oSpawnPoint_Creature";
            // Now check to see if Creature is Alive
            oCreature = GetLocalObject(oSpawnPoint,sCreature);
            // ** DEBUG
            if (GetIsObjectValid(oCreature))
            {
                // Creature is Valid, Leave Script
                // Hmm intresting Idea, Check Time of Day, since I am using a
                // Heartbeat now. Better Spawn Control Can be issued
                // Place here for Double Checking the DayTime Hours.
                // Use the new 1.59+ varible system
                int iRemoveObject = FALSE;
                if (iDawnTime==0 && GetIsDawn() == TRUE)
                {
                    iRemoveObject = TRUE;
                }
                if (iDayTime==0 && GetIsDay() == TRUE)
                {
                    iRemoveObject = TRUE;
                }
                if (iDuskTime==0 && GetIsDusk() == TRUE)
                {
                    iRemoveObject = TRUE;
                }
                if (iNightTime==0 && GetIsNight() == TRUE)
                {
                    iRemoveObject = TRUE;
                }
                // Remove Creature from spawn area.
                if (iRemoveObject == TRUE)
                {
                    AssignCommand(oCreature,SetIsDestroyable(TRUE,FALSE,FALSE));
                    DestroyObject(oCreature,1.0);
                }
               //
                return;
            }
            // Reset Advanced Flags
            iWander = TRUE;
            iCopyObject = FALSE;
            iPass = TRUE;
            // > * DEBUG_SPK
            if (DEBUG_SPK==TRUE)
            {
                PrintString("(?) Validating Creature Target "+sCreature+".");
            }

            if (GetIsObjectValid(oCreature)==FALSE)
            {
                // > * DEBUG_SPK
                if (DEBUG_SPK==TRUE)
                {
                    PrintString("(!)  Creature does not Exsist.");
                }
                // Finding Spawn Point Set up Correct sBase
                // find Spawn Point

                lLoc = GetLocation(oSpawnPoint);
                // Tear Apart Tag Info to create creature
                // **********************************************************
                // * Legacy Code
                // **********************************************************
                sTag = GetTag(oSpawnPoint);
                iLen = GetStringLength(sTag);
                sRight = GetStringRight(sTag,iLen-6);
                // Center out the last 5 places from right edge
                sRight5 = GetStringRight(sTag,10);
                sLeft5 = GetStringLeft(sRight5,1);
                // **********************************************************
                sCreatureTag = sRight;
                // > Check for Advance Legacy Properties
                if (sLeft5=="_")
                {
                    sRight5 = GetStringRight(sTag,9);
                    // > * DEBUG_SPK
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(*)  Advanced Properties Found.");
                    }
                    sCreatureTag = GetStringLeft(sRight,GetStringLength(sRight)-10);
                    // Check for Advanced Properties
                    // ********************
                    // *
                    // * Spawn Time
                    // *
                    sSpawnTag = GetStringLeft(sRight5,4);
                    sLeft = sSpawnTag;
                    // > * DEBUG_SPK
                    if (sLeft!="XXXX")
                    {
                        iDawnTime = 0;
                        iDayTime = 0;
                        iDuskTime = 0;
                        iNightTime = 0;
                        // > * DEBUG_SPK
                        if (DEBUG_SPK==TRUE)
                        {
                            PrintString("(~)   AP: Restricted Spawn Time Found.");
                        }
                        sLeft5 = GetStringLeft(sSpawnTag,1);
                        // Dawn
                        if (sLeft5=="X")
                        {
                            iDawnTime = 100;
                        }
                        sLeft5 = GetStringRight(sSpawnTag,3);
                        sLeft = GetStringLeft(sLeft5,1);
                        if (sLeft=="X")
                        {
                            iDayTime = 100;
                        }
                        sLeft5 = GetStringRight(sSpawnTag,2);
                        sLeft =GetStringLeft(sLeft5,1);
                        if (sLeft=="X")
                        {
                            iDuskTime = 100;
                        }
                        sLeft5 = GetStringRight(sSpawnTag,1);
                        sLeft = sLeft5;
                        if (sLeft=="X")
                        {
                            iNightTime = 100;
                        }
                    }
                    else
                    {
                        iDawnTime = 100;
                        iDayTime = 100;
                        iDuskTime = 100;
                        iNightTime = 100;
                    }
                    // ********************
                    // *
                    // * Wandering or WayPoint
                    // *
                    // * "_XXXX_W_XX" If this Tag is Set to "W" then he will "WalkRandom"
                    // * otherwise he will attempt to "WalkWaypoints".
                    sLeft = GetStringRight(sRight5,4);
                    sLeft5= GetStringLeft(sLeft,1);
                    if (sLeft5=="W")
                    {
                        iWander=FALSE;
                        // > * DEBUG_SPK
                        if (DEBUG_SPK==TRUE)
                        {
                            PrintString("(~)    AP: WalkWaypoints applied.");
                        }
                    }
                    // ********************
                    // *
                    // * Copy or Change Tag
                    // *
                    // * "_XXXX_X_01" if left to "XX" will create use standard BluePrint
                    // * If a Number is found then it will create a new Tag with the number added on
                    // * At the end. Such as "NW_SKELETON" becomes "NW_SKELETON_01".
                    sLeft = GetStringRight(sRight5,3);
                    if (sLeft!="XXX")
                    {
                        sNewTag=sLeft;
                        iCopyObject = TRUE;
                        // > * DEBUG_SPK
                        if (DEBUG_SPK==TRUE)
                        {
                            PrintString("(~)    AP: CopyObject applied.");
                        }
                    }
                }
                // ***********************************************************
                // * End Legacy Code
                // ***********************************************************

                // ****************************************
                // * Nwn 1.61 Tag Over Ride(s)
                // ****************************************
                /*
                    Varible Notes:

                    ASG_ NewTag         Type: String - This allows you to give
                                        your spanwed in creature a truely
                                        unique Tag.
                    ASG_Creature_Table  Type: Int- This responds to the Tag
                                        being "RANDOM". The list is kept on
                                        the Placeable itself. Thus you can edit
                                        it outside of the scripting enviropemt.
                    ASG_Creature_X      Type: String - This is where you hold
                                        the ResRefs for the creatures. You can
                                        often have the TAG or the ResRef here.
                                        The "X" needs to be replaced by a number
                                        and that number should not exceed the
                                        number you have entered in the
                                        ASG_Creature_Table varible.
                    ASG_SpawnLeader     Spawn Leader.
                    ASG_WalkWayPoints   if this set to "0" then the spawned
                                        monster will just wander around. Otherwise
                                        it setting this to "1" will have the
                                        creature "WalkWaypoints";
                    ASG_NoDestroy       If this is Set to "1" then the Object
                                        will not be destroyed when all players
                                        exit. Nor will the Delayed Destroy
                                        will be assigend out of the module.
                    ASG_Spawn_ClearArea Setting this Int to "1" will not have
                                        the creature respawn untill all players
                                        have left the area.
                */
                string sNewCreatureTag = sCreatureTag;
                string sHotUNewTag = GetLocalString(oSpawnPoint,"ASG_NewTag");
                if (sHotUNewTag!="")
                {
                    sNewCreatureTag = sHotUNewTag;
                }
                // Find if I should Even Spawn
                // Random Monster Off of List
                // If the Tag on the Spawn Point Reads RANDOM instead of a regular
                // creature Tag, then it will look for inforamtion on the varible
                // often used by me to create a Random list of mobs.
                int iTable = GetLocalInt(oSpawnPoint,"ASG_Creature_Table");
                if (sCreatureTag == "RANDOM" || iTable > 0)
                {
                    // Call Random Monster List from SpawnPoint

                    int iTableRoll = Random(iTable)+1;
                    sCreatureTag = GetLocalString(oSpawnPoint,"ASG_Creature_"+IntToString(iTableRoll));
                    if (sCreatureTag == "")
                    {
                        sCreatureTag = "nw_badger";// Badger,Default for Errors
                    }
                }
                // Check for Leader Spawn
                // The Spawn Leader is the Mob boss. if the Boss is alive keep
                // spawinging in the monster else no spawn.
                string sSpawnLeaderTag = GetLocalString(oSpawnPoint,"ASG_SpawnLeader");
                if (sSpawnLeaderTag !="")
                {
                    iPass = FALSE;
                    object oSpawnLeader = GetObjectByTag(sSpawnLeaderTag);
                    if (GetIsObjectValid(oSpawnLeader)) iPass = TRUE;
                }
                int iASG_WalkWayPoints = GetLocalInt(oSpawnPoint,"ASG_WalkWayPoints");
                if (iASG_WalkWayPoints == 1)
                {
                    iWander = FALSE;
                }
                // ********************************************************
                // * Dawn to Night Spawn Time ins
                // ********************************************************
                if (iPass == TRUE)
                {
                    // ****************************************************
                    // Legacy Overides
                    // ****************************************************

                    // Passed Leader Information Get Day Night Info
                    iPass = FALSE;
                    if (iDawnTime>0 && GetIsDawn() == TRUE)
                    {
                        iNeedToRoll = TRUE; iChance = iDawnTime;
                    }
                    if (iDayTime>0 && GetIsDay() == TRUE)
                    {
                        iNeedToRoll = TRUE; iChance = iDayTime;
                    }
                    if (iDuskTime>0 && GetIsDusk() == TRUE)
                    {
                        iNeedToRoll = TRUE; iChance = iDuskTime;
                    }
                    if (iNightTime>0 && GetIsNight() == TRUE)
                    {
                        iNeedToRoll = TRUE; iChance = iNightTime;
                    }
                    // ** Check and Roll times
                    if(iNeedToRoll == TRUE)
                    {
                        iRoll = d100();
                        if (iRoll<=iChance) iPass = TRUE;
                    }
                }
                // **********************************************************
                //  No Destroy?
                // **********************************************************

                int iASG_NoDestroy = GetLocalInt(oSpawnPoint,"ASG_NoDestroy");
                // *************************************
                // * End of most Overides.
                // **************************************
                // > * DEBUG_SPK

                if (DEBUG_SPK==TRUE)
                {
                    PrintString("(~)  Attempting to Create Creature "+sCreatureTag+" in Area "+GetName(oArea));
                }
                if (iPass != FALSE)
                {
                    // *************
                    // * added so Creature does not spawn OnTop of Character
                    // *************
                    object oNearestPC = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,lLoc);
                    iPass = TRUE;
                    if (GetIsObjectValid(oNearestPC))
                    {
                        location lNPC = GetLocation(oNearestPC);
                        float fDistance = GetDistanceBetweenLocations(lNPC,lLoc);
                        // Current Problem ID freindlies SOo.. .Disabled
                        if (fDistance>15.0)iPass = TRUE;
                    }
                    // ** Nearest PC far enough away
                    // **************
                    // * Added Clear Area Varible
                    // ***********
                    int iClearArea = GetLocalInt(oSpawnPoint,"ASG_Spawn_ClearArea");
                    if (iClearArea == 1)
                    {
                        // Check to See if Spawn Point has Already Spawned a Creature.
                        if (GetLocalInt(oSpawnPoint,"SPK_Respawn")==TRUE) iPass= FALSE;
                    }
                    // *** ALL PASED LETS SPAWN IN!
                    if (iPass == TRUE)
                    {
                        oCreature = CreateObject(OBJECT_TYPE_CREATURE,GetStringLowerCase(sCreatureTag),lLoc,FALSE,sNewCreatureTag);
                        // ****************
                        // * Scripting Hook
                        // ****************
                        if (GetIsObjectValid(oCreature))
                        {   // ASG_Script_On_Spawn
                            string sASG_Script_On_Spawn = GetLocalString(oSpawnPoint,"ASG_Script_On_Spawn");
                            if (sASG_Script_On_Spawn!="SCRIPT_INVALID" || sASG_Script_On_Spawn!="")
                            {
                                // This Script Exicutes on the newly formed Mob
                                ExecuteScript(sASG_Script_On_Spawn,oCreature);
                            }
                            if (iASG_NoDestroy==1)
                            {
                                    SetLocalInt(oCreature,"iASG_NoDestroy",TRUE);

                            }
                            SetLocalObject(oCreature,"SpawnPoint",oSpawnPoint);
                            SetLocalString(oCreature,"AreaLock",sCreature);
                            SetLocalInt(oSpawnPoint,"SPK_Respawn",TRUE);
                            // 0----------------------------------------
                            // New Auto Delete Code Added
                            // o----------------------------------------
                            if (iDeleteTime>0) DestroyObject(oCreature, RoundsToSeconds(iDeleteTime));

                        }
                        // end valid
                    }
                }
                else
                {
                    oCreature = OBJECT_INVALID;
                    // > * DEBUG_SPK
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(*)   Creature Not Spawn, not proper time yet to Spawn.");
                    }
                }
                // ****************
                // *
                // * Advanced Flag : CopyObject
                // *
                if (iCopyObject == TRUE)
                {
                    oNewCreature = CopyObject(oCreature,GetLocation(oCreature),OBJECT_INVALID,GetTag(oCreature)+"_"+sNewTag);
                    DestroyObject(oCreature);
                    oCreature = oNewCreature;
                    // > * DEBUG_SPK
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(*)   Attempting to Copy Creature.");
                    }

                }
                // * Succesful.
                if (GetIsObjectValid(oCreature))
                {

                    // > * DEBUG_SPK
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(*)  Created {"+GetName(oCreature)+"} Creature Succesful!");
                    }
                    // *******************
                    // *
                    // * Faction Change
                    // *
                    string sFactionS = GetLocalString(oSpawnPoint,"ASG_Spawn_Faction");
                    if (sFactionS!="")
                    {
                        if (sFactionS!="DEFAULT")
                        {
                            int iNewFaction = STANDARD_FACTION_HOSTILE;
                            if (sFactionS!="LEADER")
                            {
                                if (sFactionS == "COMMONER")
                                    iNewFaction = STANDARD_FACTION_COMMONER;
                                if (sFactionS == "DEFENDER")
                                    iNewFaction = STANDARD_FACTION_DEFENDER;
                                if (sFactionS == "HOSTILE")
                                    iNewFaction = STANDARD_FACTION_HOSTILE;
                                if (sFactionS == "MERCHANT")
                                    iNewFaction = STANDARD_FACTION_MERCHANT;
                                ChangeToStandardFaction(oCreature,iNewFaction);
                            }
                            else
                            {
                                object oSpawnLeader = GetObjectByTag(sSpawnLeaderTag);
                                if (GetIsObjectValid(oSpawnLeader))
                                {
                                    ChangeFaction(oCreature,oSpawnLeader);
                                }
                            }
                        }
                    }
                    // ****************
                    // *
                    // * Wandering or WayPoint
                    // *
                    if (iWander==FALSE) AssignCommand(oCreature,WalkWayPoints(FALSE,1.0));
                    else
                    {
                        AssignCommand(oCreature,ActionRandomWalk());
                    }
                    // *****************
                    // *
                    // * Set Object To Area
                    // *
                     SetLocalObject(oSpawnPoint,"oSpawnPoint_Creature",oCreature);
                    // ********************
                    // *
                    // * Set to Plot
                    // *
                    int iPlot = GetLocalInt(oSpawnPoint,"ASG_Spawn_Trait_Plot");
                    if (iPlot==1)  SetPlotFlag(oCreature,TRUE);
                    // ********************
                    // *
                    // * Set to Immortal
                    // *
                    iPlot = 0;iPlot = GetLocalInt(oSpawnPoint,"ASG_Spawn_Trait_Immortal");
                    if (iPlot==1)  SetImmortal(oCreature,TRUE);
                }
                else
                {
                    // > * DEBUG_SPK
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(!) Error Could not Create Creature "+sCreatureTag+" in Area "+GetName(oArea));
                    }
                }
            }
            else
            {
                // * > DEBUG_SPK
                if (DEBUG_SPK==TRUE)
                {
                    PrintString("(*) Creature Already Exsists.");
                }
            }
        // } - Use of iN
    // } - // Use of K
    // > * DEBUG_SPK
    if (DEBUG_SPK==TRUE)
    {
        PrintString("*******************************");
        PrintString("* End OnEnterArea Script");
        PrintString("*******************************");
    }
    SetLocalInt(oArea,"ASG_A_SPAWNWORKING",FALSE);
}
// **
void asg_CleanArea(object oArea)
{
    int iDeleteTime = GetLocalInt(GetModule(),"ASG_SKIT_DELETETIME");
    // * > DEBUG_SPK
    if (DEBUG_SPK == TRUE)
    {
        PrintString("*******************************");
        PrintString("Starting Creature - OnExitArea Script for "+GetName(oArea));
        PrintString("*******************************");
    }
    BiowareClean(oArea);
    if (iDeleteTime>0)
    {
        if (DEBUG_SPK == TRUE)
        {
            PrintString("(!) Found DeleteTime Timer, aborting regular code.");
        }
        return;
    }
    // *********
    // ** Set as Busy
    SetLocalInt(oArea,"ASG_A_SPAWNWORKING",TRUE);
    int iIndex = GetLocalInt(oArea,"ASG_AREA_SPAWNPOINT_INDEX");

    int iK;
    int iN;
    string sBase;
    string sComp;
    string sCreature;
    int iLen;

    object oCreature;
    object oSpawnPoint;
    object oPlayer; // This one is thrown in For Redundacy,
    location lLoc;

    int iCurHp;

    // Ovride Varibles
    int iASG_NoDestroy;


    for (iK=1;iK<=iIndex;iK++)
    {
        sBase = "oSpawnPoint_";
        sComp = sBase + IntToString(iK);
         // Orignal Spawn Point Locked to Area.
        oSpawnPoint = GetLocalObject(oArea,sComp);

        if (GetIsObjectValid(oSpawnPoint))
        {
            // Now this is where you would Assign Multiple Creatures
            // to the Spawn Point It could have it's own Index

            // Reset Respawn
            SetLocalInt(oSpawnPoint,"SPK_Respawn",FALSE);
            sCreature = "oSpawnPoint_Creature";
            // Now check to see if Creature is Alive
            oCreature = GetLocalObject(oSpawnPoint,sCreature);
            if (GetIsObjectValid(oCreature))
            {
                // Check to see if it needs Vaporising
                iASG_NoDestroy = GetLocalInt(oCreature,"iASG_NoDestroy");
                oPlayer = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,oCreature);

                if (GetIsObjectValid(oPlayer)!=TRUE && iASG_NoDestroy==FALSE)
                {
                    // Check for Overides in player
                    // Found and Destroy)
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(!) Creature Found alive, destroying.");
                    }
                    DestroyObject(oCreature);
                }
                else
                {
                    if (DEBUG_SPK==TRUE)
                    {
                        PrintString("(!) Other Despawn Paramitors Used.");
                    }
                }
            }
            else
            {
                // * > DEBUG_SPK
                if (DEBUG_SPK==TRUE)
                {
                    PrintString("(*) Creature does not Exsits, Doing Nothing");
                }

            }
        }
    }
    // > * DEBUG_SPK
    if (DEBUG_SPK==TRUE)
    {
        PrintString("*******************************");
        PrintString("* End OnExitArea Script");
        PrintString("*******************************");
    }
    SetLocalInt(oArea,"ASG_A_SPAWNWORKING",FALSE);
}
// **
void asg_SetUpArray(object oArea)
{
    // * > DEBUG_SPK

    if (DEBUG_SPK == TRUE)
    {
        PrintString("*******************************");
        PrintString("Starting Spawn Point Index for Area "+GetName(oArea));
        PrintString("*******************************");
    }
    // *********
    int iIndex;
    // ** LOOK FOR SPAWN POINTS and store to memory
    // *  Tag information: "SPAWN_"+Creature Tag.
    // *  For this to work correctly the Creature Tag Must be ID to the ResRes.
    object oTarget = GetFirstObjectInArea(oArea);
    string sBase = "oSpawnPoint_";
    string sComp;
    string sTag;
    string sTagLeft;
    int iSpawnPoint;
    int iTotalSP;
    int iOType;

    // ** Search for Zombies
    while (GetIsObjectValid(oTarget))
    {
        iOType = GetObjectType(oTarget);
            sTag = GetTag(oTarget);
            sTagLeft = GetStringLeft(sTag,5);
            if (sTagLeft=="SPAWN")
            {
                iSpawnPoint++;
                sComp = sBase+IntToString(iSpawnPoint);
                // * Points to Spawn Location
                // oSpawnPoint_X - Object Spawn Point
                SetLocalObject(oArea,sComp,oTarget);
                // * > DEBUG_SPK
            }
        oTarget = GetNextObjectInArea(oArea);
    }
    SetLocalInt(oArea,"ASG_AREA_SPAWNPOINT_INDEX",iSpawnPoint);

    // * > DEBUG_SPK
    if (DEBUG_SPK == TRUE)
    {
        PrintString("*******************************");
        PrintString("End Area "+GetName(oArea)+" Spawn Point Index, Found "+IntToString(iTotalSP)+" Spawn Points, for a Total of "+IntToString(iIndex)+" differant Creatures.");
        PrintString("*******************************");
    }
    // *********
}


