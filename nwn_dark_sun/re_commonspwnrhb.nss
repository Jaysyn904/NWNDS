//::///////////////////////////////////////////////
//:: FileName re_mmorpghb.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script is used in the heartbeat of the
BESIE Commoner Spawner tool, part of the BESIE
Random Encounter System by Ray Miller.
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 9-2-02
//:://////////////////////////////////////////////

#include "re_rndenc"
void DoFacing(object oSource)
{
object oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oSource, 1, CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);
vector vTarget = GetPositionFromLocation(GetLocation(oTarget));
vector vSource = GetPositionFromLocation(GetLocation(oSource));
AssignCommand(oSource, SetFacingPoint(vTarget));
if(oSource == GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oTarget, 1, CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC))
    {
    if(GetTag(oTarget) == "Patron"
    || GetTag(oTarget) == "Citizen"
    || GetTag(oTarget) == "Commoner"
    || GetLocalObject(oTarget, "re_oRandomEncounterSpawner") == OBJECT_SELF)
        {
        if(!GetIsPC(oTarget)) AssignCommand(oTarget, SetFacingPoint(vSource));
        }
    }
}

void main()
{
    if(!GetLocalInt(OBJECT_SELF, "re_BESIE"))
        {
        SetLocalInt(OBJECT_SELF, "re_BESIE", TRUE);
        SetLocalString(OBJECT_SELF, "re_ToolType", "Commoner Spawner");
        }
    if(GetLocalInt(GetModule(), "re_disableCommonerSpawner") || GetLocalInt(GetArea(OBJECT_SELF), "re_disableCommonerSpawner") || GetLocalInt(OBJECT_SELF, "re_disable"))
        {
        if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
        if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
        return;
        }
    object oCreature;
    object oAmIASpawn;
    object oArea = GetArea(OBJECT_SELF);
    int iCounter1;
    int iCounter2;
    int iCounterSpawn;
    int bTimeIn;
    int bSpawn;
    int iSpawnRadius = GetFortitudeSavingThrow(OBJECT_SELF) * 5;
    int iTableNumber = GetReflexSavingThrow(OBJECT_SELF);
    int iMaxSpawns = GetWillSavingThrow(OBJECT_SELF);
    int iSpawnAmount;
    string sBuild;
    string sCustom = "nil";
    string sTemplate = "re_commoner" + IntToString(iTableNumber);
    if(!GetLocalInt(OBJECT_SELF, "re_bCommonerSpawner")) SetLocalInt(OBJECT_SELF, "bCommonerSpawner", TRUE);
    if(!GetLocalInt(OBJECT_SELF, "bFirstRun"))
        {
        if(GetStringLeft(GetTag(OBJECT_SELF), 3) == "re_")
            {
            for(iCounter1 = 3; iCounter1 <= GetStringLength(GetTag(OBJECT_SELF)); iCounter1++)
                {
                if(sCustom != "nil"
                && (GetSubString(GetTag(OBJECT_SELF), iCounter1, 1) == "0" || StringToInt(GetSubString(GetTag(OBJECT_SELF), iCounter1, 1)) > 0))
                    {
                    sBuild = sBuild + GetSubString(GetTag(OBJECT_SELF), iCounter1, 1);
                    }
                else if(sCustom != "nil")
                    {
                    if(sCustom == "b") SetLocalInt(OBJECT_SELF, "re_iBegin", StringToInt(sBuild));
                    if(sCustom == "e") SetLocalInt(OBJECT_SELF, "re_iEnd", StringToInt(sBuild));
                    sCustom = "nil";
                    sBuild = "";
                    }
                if(GetSubString(GetTag(OBJECT_SELF), iCounter1, 1) == "b" || GetSubString(GetTag(OBJECT_SELF), iCounter1, 1) == "e")
                    {
                    sCustom = GetSubString(GetTag(OBJECT_SELF), iCounter1, 1);
                    }
                }
            }
        SetLocalInt(OBJECT_SELF, "bFirstRun", TRUE);
        }
    if(GetLocalInt(OBJECT_SELF, "re_iBegin") > 23) SetLocalInt(OBJECT_SELF, "re_iBegin", 23);
    if(GetLocalInt(OBJECT_SELF, "re_iEnd") > 23) SetLocalInt(OBJECT_SELF, "re_iEnd", 23);
    int iStartTime = GetLocalInt(OBJECT_SELF, "re_iBegin");
    int iStopTime = GetLocalInt(OBJECT_SELF, "re_iEnd");
    if((iStartTime <= iStopTime && (GetTimeHour() >= iStartTime && GetTimeHour() < iStopTime))
    || (iStartTime >= iStopTime && (GetTimeHour() >= iStartTime || GetTimeHour() < iStopTime)))
    bTimeIn = TRUE;
    else bTimeIn = FALSE;
    if(iMaxSpawns < 0)iMaxSpawns = 1;
    oAmIASpawn = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oAmIASpawn))
        {
        if(GetIsPC(oAmIASpawn) && !GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oAmIASpawn))) bSpawn = TRUE;
        if(GetLocalObject(oAmIASpawn, "re_oRandomEncounterSpawner") == OBJECT_SELF && bTimeIn)
            {
            iCounterSpawn++;

            //This is so the CleanHouse function doesn't clean up the commoners.
            if(GetLocalInt(oAmIASpawn, "re_bRandomEncounter")) DeleteLocalInt(oAmIASpawn, "re_bRandomEncounter");

            int iShouldIWalk = Random(100) + 1;
            if(Random(100) + 1 < GetMaxHitPoints(OBJECT_SELF) && !GetIsInCombat(oAmIASpawn) && !IsInConversation(oAmIASpawn) && !GetIsPC(oAmIASpawn))
                {
                ClearAllActions();
                RandomWalk2(GetLocation(OBJECT_SELF), iSpawnRadius, oAmIASpawn);
                }
            if(!GetIsInCombat(oAmIASpawn) && !IsInConversation(oAmIASpawn) && !GetIsPC(oAmIASpawn)) AssignCommand(oAmIASpawn, ActionDoCommand(DoFacing(oAmIASpawn)));
            }
        if(GetLocalObject(oAmIASpawn, "re_oRandomEncounterSpawner") == OBJECT_SELF && (!bTimeIn || GetLocalInt(OBJECT_SELF, "re_bDespawn")))
            {
            if(!GetIsInCombat(oAmIASpawn) && !IsInConversation(oAmIASpawn) && !GetIsPC(oAmIASpawn)) DestroyObject(oAmIASpawn);
            }
        oAmIASpawn = GetNextObjectInArea(oArea);
        }
    if(!bSpawn) SetLocalInt(OBJECT_SELF, "re_bDespawn", TRUE);
    else DeleteLocalInt(OBJECT_SELF, "re_bDespawn");
    if(iCounterSpawn < iMaxSpawns && bSpawn && bTimeIn)
        {
        //This is to prevent a Too Many Instructions error that occurs if more than 23 spawns are generated
        //in a single loop.
        if(iMaxSpawns - iCounterSpawn > 20) iSpawnAmount = 20;
        else iSpawnAmount = iMaxSpawns - iCounterSpawn;
        for(iCounter2 = 1; iCounter2 <= iSpawnAmount; iCounter2++)
            {
            oCreature = RandomEncounter(100.0, OBJECT_SELF, sTemplate, 0, 1, 1, iSpawnRadius, 360);
            DelayCommand(2.0, DoFacing(oCreature));
            }
        }
    if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
    if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
}
