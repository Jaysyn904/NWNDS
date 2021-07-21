//::///////////////////////////////////////////////
//:: Name re_modheartbeat.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This script is part of the BESIE Random Encounter
System by Ray Miller.  It is meant to be placed in
the Module OnHeartbeat Handler.  It is used to run
the CleanHouse() function on all areas in which PCs
currently reside.
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 1-6-03
//:://////////////////////////////////////////////
#include "re_rndenc"
void main()
{
object oArea;
object oPC = GetFirstPC();
while(GetIsObjectValid(oPC))
    {
    oArea = GetArea(oPC);
    if(!GetIsObjectValid(GetLocalObject(oArea, "re_oHouseCleaner")))
        {
        CleanHouse(FALSE, oArea);
        }
    oPC = GetNextPC();
    }
}
