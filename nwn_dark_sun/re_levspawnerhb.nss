//:://///////////////////////////////////////////////////////////////
//:: FileName re_spawnerhb
//:: Copyright (c) 2001 Bioware Corp.
//:://///////////////////////////////////////////////////////////////
/*
This script is used in the heartbeat of the
BESIE RES tool, part of the BESIE Random
Encounter package by Ray Miller.
*/
//:://///////////////////////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 9-2-02
//:://///////////////////////////////////////////////////////////////
#include "re_rndenc"
void main()
{
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//Set this parameter to FALSE if you wish
//your encounter distances to be constant
int RandomDistance = TRUE;
/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/*
If you want a PW RES tool to start and stop spawning
creatures at particular game times, set the following variables
to the appropriate times and save the script under a different
name.  You could also set the local integers "re_iBegin" and
"re_iEnd" on the spawner externally if you wanted.
*/
int StartTime = 0;
int StopTime = 0;
///////////////////////////////////////////////////////////

    float fChanceOfEncounter;
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
        SetLocalString(OBJECT_SELF, "re_ToolType", "PW RES");
        }
    if(GetLocalInt(GetModule(), "re_disablePWRES") || GetLocalInt(GetArea(OBJECT_SELF), "re_disablePWRES") || GetLocalInt(OBJECT_SELF, "re_disable"))
        {
        if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
        if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
        return;
        }
    int iStartTime = GetLocalInt(OBJECT_SELF, "re_iBegin");
    int iStopTime = GetLocalInt(OBJECT_SELF, "re_iEnd");
    if((iStartTime <= iStopTime && (GetTimeHour() >= iStartTime && GetTimeHour() < iStopTime))
    || (iStartTime >= iStopTime && (GetTimeHour() >= iStartTime || GetTimeHour() < iStopTime)))
    fChanceOfEncounter = IntToFloat(GetMaxHitPoints(OBJECT_SELF)) / 100;
    else fChanceOfEncounter = 0.0;
    int iFaction;
    int iCounterX;
    object oEncounterObject;
    object oArea = GetArea(OBJECT_SELF);
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
        {
        if(GetArea(oPC) == oArea)
            {
            string sLeader = GetPCPlayerName(GetFactionLeader(oPC)) + GetName(GetFactionLeader(oPC));
            if(!GetLocalInt(OBJECT_SELF, "i" + sLeader))
                {
                iFaction++;
                SetLocalString(OBJECT_SELF, "sFaction" + IntToString(iFaction), sLeader);
                }
            SetLocalInt(OBJECT_SELF, "i" + sLeader, GetLocalInt(OBJECT_SELF, "i" + sLeader) + 1);
            SetLocalObject(OBJECT_SELF, "o" + sLeader + IntToString(GetLocalInt(OBJECT_SELF, "i" + sLeader)), oPC);
            }
        oPC = GetNextPC();
        }
    if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
    if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
    if(!iFaction) return;
    string sLeader = GetLocalString(OBJECT_SELF, "sFaction" + IntToString(Random(iFaction) + 1));
    int iMember = Random(GetLocalInt(OBJECT_SELF, "i" + sLeader)) + 1;
    oEncounterObject = GetLocalObject(OBJECT_SELF, "o" + sLeader + IntToString(iMember));
    for(iCounterX = 1; iCounterX <= iFaction; iCounterX++)
        {
        DeleteLocalInt(OBJECT_SELF, "i" + GetLocalString(OBJECT_SELF, "sFaction" + IntToString(iCounterX)));
        DeleteLocalString(OBJECT_SELF, "sFaction" + IntToString(iCounterX));
        }
    string sTemplate = GetTag(OBJECT_SELF);
    int iNumberOfParties;
    int iMinDistance = RandomDistance;
    int iLevel = GetFortitudeSavingThrow(OBJECT_SELF);
    int iCheckDistance = GetReflexSavingThrow(OBJECT_SELF);
    int iMaxDistance = GetWillSavingThrow(OBJECT_SELF);

    // Return if the resting variable is set by the re_onrest script.
    if(GetLocalInt(oEncounterObject, "re_resting")) return;

    if(!iMaxDistance)
        {
        iMaxDistance = 1;
        }
    if(GetStringLeft(sTemplate, 3) != "re_")
        sTemplate = "random";
    fChanceOfEncounter = IntToFloat(iFaction) * fChanceOfEncounter;
    RandomEncounter(fChanceOfEncounter, oEncounterObject, sTemplate, 0, 0, iMinDistance, iMaxDistance, 360, 0, iCheckDistance, iLevel, 0);
}
