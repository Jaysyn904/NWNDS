#include "re_rndenc"
int StartingConditional()
{
object oPC = GetPCSpeaker();
object oObject = GetFirstObjectInArea(GetArea(oPC));
string sToken;
struct RndEncProperties strProps = GetRndEncProperties(GetArea(oPC));
if(!strProps.bInitialized)
    {
    sToken = sToken + "Area properties not set.  Using module properties:\n";
    strProps = GetRndEncProperties(GetModule());
    }
else sToken = sToken + "Area Properties:\n";
sToken = sToken + "Difficulty: " + IntToString(strProps.iDifficulty)
+ "\nConsider CR: " + IntToString(strProps.bConsiderCR)
+ "\nCreature Table: " + strProps.sCreatureTable
+ "\nCreature Decay Time: " + IntToString(strProps.iLifeTime)
+ "\nEncounter Type: ";
if(strProps.iEncounterType == 1) sToken = sToken + "(1)PARTY";
if(strProps.iEncounterType == 2) sToken = sToken + "(2)INDIVIDUAL";
if(strProps.iEncounterType == 3) sToken = sToken + "(3)AREA";
if(strProps.iEncounterType == 4) sToken = sToken + "(4)TOTAL PARTY LEVELS";
sToken = sToken + "\nEnc During Conflict: " + IntToString(strProps.bConflict)
+ "\nChance On Rest: " + IntToString(strProps.iChanceOnRest);
sToken = sToken + "\n\nArea Spawners:\n";
while(GetIsObjectValid(oObject))
    {
    if(GetLocalInt(oObject, "re_BESIE"))
        {
        sToken = sToken + GetName(oObject) + " - " + GetTag(oObject) + " - ";
        if(GetLocalInt(oObject, "re_iBegin")
        || GetLocalInt(oObject, "re_iEnd"))
            {
            sToken = sToken + "B" + IntToString(GetLocalInt(oObject, "re_iBegin")) + " E" + IntToString(GetLocalInt(oObject, "re_iEnd")) + " - ";
            }
        if(GetLocalInt(oObject, "re_disable")) sToken = sToken + "Disabled";
        else sToken = sToken + "Enabled";
        sToken = sToken + "\n\n";
        }
    oObject = GetNextObjectInArea(GetArea(oPC));
    }
SetCustomToken(2112, sToken);
return TRUE;
}
