//::///////////////////////////////////////////////
//:: FileName re_mmorpghb.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script is used in the heartbeat of the
BESIE RES tool, part of the BESIE Random Encounter
package by Ray Miller.
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 9-2-02
//:://////////////////////////////////////////////

#include "re_rndenc"
void main()
{
///////////////////////////////////////////////////////////
/*
if you don't want a DM possessed NPC to produce spawns,
insert the following code into your module OnClientEnter
handler.

note: this code is contained in the script "re_oncliententer"

if(GetIsDM(GetEnteringObject())) SetLocalInt(GetModule(), "re_" + GetName(GetEnteringObject()), TRUE);
else DeleteLocalInt(GetModule(), "re_" + GetName(GetEnteringObject()));
*/
///////////////////////////////////////////////////////////
/*
If you want a MMORPG Spawner to start and stop spawning
creatures at particular game times, set the following variables
to the appropriate times and save the script under a different
name.  You could also set the local integers "re_iBegin" and
"re_iEnd" on the spawner externally if you wanted.
*/
int StartTime = 0;
int StopTime = 0;
///////////////////////////////////////////////////////////

    int bTimeIn;
    if(StartTime || StopTime)
        {
        SetLocalInt(OBJECT_SELF, "re_iBegin", StartTime);
        SetLocalInt(OBJECT_SELF, "re_iEnd", StopTime);
        }
    if(GetLocalInt(OBJECT_SELF, "re_iBegin") > 23) SetLocalInt(OBJECT_SELF, "re_iBegin", 23);
    if(GetLocalInt(OBJECT_SELF, "re_iEnd") > 23) SetLocalInt(OBJECT_SELF, "re_iEnd", 23);
    if(!GetLocalInt(OBJECT_SELF, "re_BESIE"))
        {
        SetLocalInt(OBJECT_SELF, "re_BESIE", TRUE);
        SetLocalString(OBJECT_SELF, "re_ToolType", "MMORPG Spawner");
        }
    if(GetLocalInt(GetModule(), "re_disableMMORPG") || GetLocalInt(GetArea(OBJECT_SELF), "re_disableMMORPG") || GetLocalInt(OBJECT_SELF, "re_disable"))
        {
        if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
        if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
        return;
        }
    int iStartTime = GetLocalInt(OBJECT_SELF, "re_iBegin");
    int iStopTime = GetLocalInt(OBJECT_SELF, "re_iEnd");
    if((iStartTime <= iStopTime && (GetTimeHour() >= iStartTime && GetTimeHour() < iStopTime))
    || (iStartTime >= iStopTime && (GetTimeHour() >= iStartTime || GetTimeHour() < iStopTime)))
    bTimeIn = TRUE;
    else bTimeIn = FALSE;
    string sTemplate;
    object oCreature;
    object oAmIASpawn;
    object oArea = GetArea(OBJECT_SELF);
    int iTreasure;
    int iType;
    int bSpawnOne;
    int iCounterPC;
    int iCounterParty;
    int iCounterSpawn;
    int iSpawnRadius = GetFortitudeSavingThrow(OBJECT_SELF) * 5;
    int iEncounterLevel = GetReflexSavingThrow(OBJECT_SELF);
    int iMaxSpawns = GetWillSavingThrow(OBJECT_SELF);
    float fZeroTest;
    float fPCFactor;
    float fChanceOfSpawn;
    float fChallengeFactor;
    float fFactor;
    if(!iMaxSpawns) return;
    if(!iEncounterLevel)
        {
        oAmIASpawn = GetFirstObjectInArea(oArea);
        while(GetIsObjectValid(oAmIASpawn))
            {
            if(GetIsPC(oAmIASpawn))
                {
                iCounterPC++;
                if(GetFactionLeader(oAmIASpawn) == oAmIASpawn)
                    {
                    iCounterParty++;
                    }
                iEncounterLevel = iEncounterLevel + GetLevelByPosition(1, oAmIASpawn) + GetLevelByPosition(2, oAmIASpawn) + GetLevelByPosition(3, oAmIASpawn);
                if(GetIsObjectValid(GetHenchman(oAmIASpawn)))
                    {
                    iEncounterLevel = iEncounterLevel + GetLevelByPosition(1, GetHenchman(oAmIASpawn)) + GetLevelByPosition(2, GetHenchman(oAmIASpawn)) + GetLevelByPosition(3, GetHenchman(oAmIASpawn));
                    }
               }
            oAmIASpawn = GetNextObjectInArea(oArea);
            }
        if(iCounterParty < 1) iCounterParty = 1;
        iEncounterLevel = FloatToInt(IntToFloat(iEncounterLevel) / IntToFloat(iCounterParty));
        }
    if(iMaxSpawns < 0)iMaxSpawns = 1;

    //This code was removed in v1.8.  I'm not sure why I was doing things this way.
    //if(GetStringLeft(GetTag(OBJECT_SELF), 3) == "re_")
    //    {
        sTemplate = GetTag(OBJECT_SELF);
    //    }
    //else
    //    {
    //    sTemplate = "random";
    //    }
    oAmIASpawn = GetFirstObjectInArea(oArea);
    while(GetIsObjectValid(oAmIASpawn))
        {
        if(GetLocalInt(oAmIASpawn, "re_bRandomEncounter") && GetLocalObject(oAmIASpawn, "re_oRandomEncounterSpawner") == OBJECT_SELF)
            {
            iCounterSpawn++;
            if(!bTimeIn && !GetIsInCombat(oAmIASpawn) && !IsInConversation(oAmIASpawn)) DestroyObject(oAmIASpawn);
            if(!iEncounterLevel) SetLocalInt(oAmIASpawn, "re_iRandomEncounterLifeTime", 450);
            else SetLocalInt(oAmIASpawn, "re_iRandomEncounterLifeTime", 900);
            int iShouldIWalk = Random(100) + 1;
            if(Random(100) + 1 < GetMaxHitPoints(OBJECT_SELF) && !GetIsInCombat(oAmIASpawn) && !GetIsPC(oAmIASpawn))
                {
                ClearAllActions();
                RandomWalk2(GetLocation(OBJECT_SELF), iSpawnRadius, oAmIASpawn);
                }
            }
        if(GetIsPC(oAmIASpawn) && !GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oAmIASpawn))) bSpawnOne = TRUE;
        oAmIASpawn = GetNextObjectInArea(oArea);
        }
    if(bSpawnOne && bTimeIn && iCounterSpawn < iMaxSpawns)
        {
        if(iCounterPC > iMaxSpawns / 4) iCounterPC = iMaxSpawns / 4;
        //The following two lines were put in place with v1.8 because of some rare div by zero reports.  This is
        //the only place where this spawner could generate this error.  I suspect it has to do with the presence
        //of a dm possessed creature, or something of that nature.  At any rate, this should eliminate the error.
        fZeroTest = (IntToFloat(iMaxSpawns) - ((IntToFloat(iCounterPC) / (IntToFloat(iMaxSpawns) * 0.25)) * IntToFloat(iCounterSpawn)));
        if(fZeroTest == 0.0) return;

        fPCFactor = IntToFloat(iMaxSpawns) / fZeroTest;
        fChanceOfSpawn = ((100.0 - ((IntToFloat(iCounterSpawn) / IntToFloat(iMaxSpawns)) * 100.0)) * fPCFactor);
        oCreature = RandomEncounter(fChanceOfSpawn, OBJECT_SELF, sTemplate, 0, 1, 1, iSpawnRadius, 360, 0, 0, iEncounterLevel, 5);
        }
    if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
    if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
}
