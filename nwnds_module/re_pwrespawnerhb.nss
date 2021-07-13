//:://///////////////////////////////////////////////////////////////
//:: FileName re_spawnerhb
//:: Copyright (c) 2001 Bioware Corp.
//:://///////////////////////////////////////////////////////////////
/*
This script is used in the heartbeat of the
BESIE Persistent World Respawner tool, part
of the BESIE Random Encounter System.
*/
//:://///////////////////////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 3-30-03
//:://///////////////////////////////////////////////////////////////

#include "re_rndenc"

void main()
{
// DEFINE VARIABLES
    if(!GetLocalInt(OBJECT_SELF, "re_BESIE"))
        {
        SetLocalInt(OBJECT_SELF, "re_BESIE", TRUE);
        SetLocalString(OBJECT_SELF, "re_ToolType", "PW Respawner");
        }
    if(GetLocalInt(GetModule(), "re_disablePWRespawner") || GetLocalInt(GetArea(OBJECT_SELF), "re_disablePWRespawner") || GetLocalInt(OBJECT_SELF, "re_disable"))
        {
        if(!GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner"))) SetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner", OBJECT_SELF);
        if(GetLocalObject(GetArea(OBJECT_SELF), "re_oHouseCleaner") == OBJECT_SELF) CleanHouse();
        return;
        }
    int iRespawnTime = GetReflexSavingThrow(OBJECT_SELF);
    int iLevel = GetFortitudeSavingThrow(OBJECT_SELF);
    int iSpawnerNumber = GetWillSavingThrow(OBJECT_SELF);
    int iCounter1;
    int iCounter2 = 1;
    int iCounter3;
    float fChanceOfEncounter = IntToFloat(GetMaxHitPoints(OBJECT_SELF)) / 100;
    string sTemplate = GetTag(OBJECT_SELF);
    string sMatchString;
    object oArea = GetArea(OBJECT_SELF);
    object oCreature;
    object oSpawner;
    if(iSpawnerNumber > 99) iSpawnerNumber = 99;
    if(iSpawnerNumber < 10) sMatchString = "PWS0" + IntToString(iSpawnerNumber);
    else sMatchString = "PWS" + IntToString(iSpawnerNumber);

// IF THIS IS THE FIRST RUN THEN INITIALIZE EACH SPAWN POINT BY PARSING THE TAG FOR SWITCHES AND SETTING
// LOCAL VARIABLES.
    if(!GetLocalInt(OBJECT_SELF, "re_bFirstRun"))
        {
        SetLocalInt(OBJECT_SELF, "re_bFirstRun", TRUE);
        SetLocalInt(OBJECT_SELF, "re_bSpawnNow", TRUE);
        fChanceOfEncounter = 100.00;
        object oObject = GetFirstObjectInArea(oArea);
        string sCustom = "nil";
        string sBuild;
        while(GetIsObjectValid(oObject))
            {
            if(GetStringLeft(GetTag(oObject), 5) == sMatchString)
                {
                iCounter1++;
                SetLocalObject(OBJECT_SELF, "re_oPWWaypoint" + IntToString(iCounter1), oObject);
                for(iCounter3 = 5; iCounter3 <= GetStringLength(GetTag(oObject)); iCounter3++)
                    {
                    if(sCustom != "nil"
                    && (GetSubString(GetTag(oObject), iCounter3, 1) == "0" || StringToInt(GetSubString(GetTag(oObject), iCounter3, 1)) > 0))
                        {
                        sBuild = sBuild + GetSubString(GetTag(oObject), iCounter3, 1);
                        }
                    else if(sCustom != "nil")
                        {
                        if(sCustom == "s") SetLocalInt(oObject, "re_bSwitch" + sBuild, TRUE);
                        if(sCustom == "b")
                            {
                            int iBegin = StringToInt(sBuild);
                            if(iBegin > 23) iBegin = 23;
                            if(iBegin < 0) iBegin = 0; //Don't think this is necessary, but... safety first!
                            SetLocalInt(oObject, "re_iBegin", iBegin);
                            }
                        if(sCustom == "e")
                            {
                            int iEnd = StringToInt(sBuild);
                            if(iEnd > 23) iEnd = 23;
                            if(iEnd < 0) iEnd = 0;
                            SetLocalInt(oObject, "re_iEnd", iEnd);
                            }
                        if(sCustom == "t")
                            {
                            SetLocalInt(oObject, "re_iTerritory", StringToInt(sBuild));
                            if(GetLocalInt(oObject, "re_iTerritory") < 30) SetLocalInt(oObject, "re_iTerritory", 30);
                            }
                        sCustom = "nil";
                        sBuild = "";
                        }
                    if(GetSubString(GetTag(oObject), iCounter3, 1) == "s"
                    || GetSubString(GetTag(oObject), iCounter3, 1) == "t"
                    || GetSubString(GetTag(oObject), iCounter3, 1) == "b"
                    || GetSubString(GetTag(oObject), iCounter3, 1) == "e")
                        {
                        sCustom = GetSubString(GetTag(oObject), iCounter3, 1);
                        }
                    }
                }
            oObject = GetNextObjectInArea(oArea);
            }
        SetLocalInt(OBJECT_SELF, "re_iTotalSpawnpoints", iCounter1);
        }

// CYCLE THROUGH THE SPAWN POINTS.
    for(iCounter2 = 1; iCounter2 <= GetLocalInt(OBJECT_SELF, "re_iTotalSpawnpoints"); iCounter2++)
        {
        oSpawner = GetLocalObject(OBJECT_SELF, "re_oPWWaypoint" + IntToString(iCounter2));
        oCreature = GetLocalObject(oSpawner, "re_oLastRandomEncounterSpawned");
        int bTimeIn = TRUE;
        struct RndEncProperties stEncProperties = GetRndEncProperties(oSpawner);
        if(!stEncProperties.bInitialized) stEncProperties = GetRndEncProperties(GetArea(OBJECT_SELF));
        if(!stEncProperties.bInitialized) stEncProperties = GetRndEncProperties(GetModule());
        if(!iLevel) SetRndEncProperties(oSpawner, stEncProperties.iDifficulty, FALSE, stEncProperties.sCreatureTable, stEncProperties.iLifeTime, stEncProperties.iMph, stEncProperties.iEncounterType, stEncProperties.bConflict, stEncProperties.iChanceOnRest, stEncProperties.bLOSCheck);
        else SetRndEncProperties(oSpawner, stEncProperties.iDifficulty, TRUE, stEncProperties.sCreatureTable, stEncProperties.iLifeTime, stEncProperties.iMph, stEncProperties.iEncounterType, stEncProperties.bConflict, stEncProperties.iChanceOnRest, stEncProperties.bLOSCheck);
        if(GetLocalInt(oSpawner, "re_iBegin") || GetLocalInt(oSpawner, "re_iEnd"))
            {
            int iStartTime = GetLocalInt(oSpawner, "re_iBegin");
            int iStopTime = GetLocalInt(oSpawner, "re_iEnd");
            if((iStartTime <= iStopTime && (GetTimeHour() >= iStartTime && GetTimeHour() < iStopTime))
            || (iStartTime >= iStopTime && (GetTimeHour() >= iStartTime || GetTimeHour() < iStopTime)))
            bTimeIn = TRUE;
            else bTimeIn = FALSE;
            }
        if(GetLocalInt(oSpawner, "re_bDay"))
            {
            if(GetIsDusk() || GetIsNight())
                {
                DeleteLocalInt(oSpawner, "re_bDay");
                if(GetLocalInt(oSpawner, "re_bSwitch6")) fChanceOfEncounter = 100.0;
                }
            }
        else
            {
            if(GetIsDawn() || GetIsDay())
                {
                SetLocalInt(oSpawner, "re_bDay", TRUE);
                if(GetLocalInt(oSpawner, "re_bSwitch5")) fChanceOfEncounter = 100.0;
                }
            }
        // If the creature is dead or not valid then attempt to spawn him.
        if(!GetIsObjectValid(oCreature) || GetIsDead(oCreature))
            {
            if(!GetLocalInt(oSpawner, "re_TimeOfDeath")) SetLocalInt(oSpawner, "re_TimeOfDeath", GetTimeInSeconds());
            if((GetTimeInSeconds() - GetLocalInt(oSpawner, "re_TimeOfDeath")) / 60 >= iRespawnTime || GetLocalInt(OBJECT_SELF, "re_bSpawnNow"))
                {
                if((!GetLocalInt(oSpawner, "re_bSwitch5") && !GetLocalInt(oSpawner, "re_bSwitch6") && bTimeIn)
                || (GetLocalInt(oSpawner, "re_bSwitch5") && (GetIsDawn() || GetIsDay()) && bTimeIn)
                || (GetLocalInt(oSpawner, "re_bSwitch6") && (GetIsDusk() || GetIsNight()) && bTimeIn))
                    {
                    oCreature = RandomEncounter(fChanceOfEncounter, oSpawner, sTemplate, 0, 1, 0, 0, 0, 0, 0, iLevel, 5);
                    if(GetIsObjectValid(oCreature))
                        {
                        if(GetLocalInt(oSpawner, "re_bSwitch2")) AssignCommand(oCreature, ActionRandomWalk());
                        if(GetLocalInt(oSpawner, "re_bSwitch3")) AssignCommand(oCreature, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 4000.0));
                        AssignCommand(oCreature, SetFacing(GetFacing(oSpawner)));
                        DeleteLocalInt(oSpawner, "re_TimeOfDeath");
                        DeleteLocalInt(oCreature, "re_bRandomEncounter"); //This is so this creature isn't destroyed by the CleanHouse() function
                        }
                    }
                }
            }
        else
            {
            location lLocation = GetLocation(oSpawner);
            location lCreature = GetLocation(oCreature);
            vector vLocation = GetPositionFromLocation(lLocation);
            vector vCreature = GetPositionFromLocation(lCreature);
            object oAttacker = GetLastHostileActor(oCreature);
            location lAttacker = GetLocation(oAttacker);

            // Send the creature home if the territory switch is set and the creature is out of his territory
            // and not in combat and not DM controlled.
            if(GetLocalInt(oSpawner, "re_iTerritory") && GetDistanceBetweenLocations(lLocation, lCreature) > IntToFloat(GetLocalInt(oSpawner, "re_iTerritory")))
                {
                if(!GetIsObjectValid(oAttacker)
                || (!GetIsInCombat(oAttacker) && !GetIsPC(oCreature) && GetDistanceBetweenLocations(lLocation, lAttacker) > IntToFloat(GetLocalInt(oSpawner, "re_iTerritory"))))
                    {
                    AssignCommand(oCreature, ClearAllActions());
                    AssignCommand(oCreature, JumpToLocation(lLocation));
                    AssignCommand(oCreature, SetFacing(GetFacing(oSpawner)));
                    }
                }

            // Things to do if creature is valid, alive, not in combat, and not DM controlled.
            if(!GetIsInCombat(oCreature) && !GetIsPC(oCreature))
                {
                float fDamage = IntToFloat(GetMaxHitPoints(oCreature) - GetCurrentHitPoints(oCreature)) / 5.0;
                if(fDamage < 1.0 && fDamage > 0.0) fDamage = 1.0;
                int iDamage = FloatToInt(fDamage);
                if(GetLocalInt(oSpawner, "re_bSwitch5") && (GetIsDusk() || GetIsNight())
                || GetLocalInt(oSpawner, "re_bSwitch6") && (GetIsDawn() || GetIsDay())
                || !bTimeIn)
                    {
                    DestroyObject(oCreature);
                    }
                if(vLocation.x != vCreature.x || vLocation.y != vCreature.y || GetFacing(oCreature) != GetFacing(oSpawner))
                    {
                    if(!GetLocalInt(oSpawner, "re_bSwitch1"))
                        {
                        if(!GetLocalInt(oSpawner, "re_bSwitch2") || GetDistanceBetweenLocations(lLocation, lCreature) >= 15.0)
                            {
                            //AssignCommand(oCreature, ClearAllActions());
                            if(GetLocalInt(oSpawner, "re_iTerritory")) AssignCommand(oCreature, ActionMoveToLocation(lLocation));
                            else AssignCommand(oCreature, ActionMoveToLocation(lLocation));
                            AssignCommand(oCreature, ActionDoCommand(SetFacing(GetFacing(oSpawner))));
                            if(GetLocalInt(oSpawner, "re_bSwitch3")) AssignCommand(oCreature, ActionDoCommand(PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 4000.0)));
                            }
                        }
                    }
                if(lLocation == lCreature && GetFacing(oCreature) != GetFacing(oSpawner)) AssignCommand(oCreature, ActionDoCommand(SetFacing(GetFacing(oSpawner))));
                if(!GetLocalInt(oSpawner, "re_bSwitch4") && iDamage) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(iDamage), oCreature);
                if(GetLocalInt(oSpawner, "re_bSwitch2")) AssignCommand(oCreature, ActionDoCommand(ActionRandomWalk()));
                if(GetLocalInt(oSpawner, "re_bSwitch3"))
                    {
                    if(GetLocalInt(oSpawner, "re_bSwitch1"))
                        {
                        AssignCommand(oCreature, ClearAllActions());
                        AssignCommand(oCreature, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 4000.0));
                        }
                    else if(lLocation == lCreature)
                        {
                        AssignCommand(oCreature, ClearAllActions());
                        AssignCommand(oCreature, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 4000.0));
                        }
                    }
                }
            }
        }
        if(GetLocalInt(OBJECT_SELF, "re_bSpawnNow")) DeleteLocalInt(OBJECT_SELF, "re_bSpawnNow");
}
