//::///////////////////////////////////////////////
//:: Name       Spawn Kit Heartbeat Maniger
//:: FileName   asg_scr_spkithbs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This file runs the area heartbeat in releation ship with the SpawnKit
    it is only found and to be used on the placeable. ONLY one placeable
    per area.

*/
//:://////////////////////////////////////////////
//:: Created By:    Donny Wilbanks
//:: Created On:    5/13/04
//:://////////////////////////////////////////////

#include "asg_i_spawnkit"

void main()
{

    object oSelf;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,oSelf);
    int iSingleSpawnIn = GetLocalInt(oSelf,"SPK_SLOWSPAWNIN");
    if (GetIsObjectValid(oPC) && iSingleSpawnIn == TRUE)
    {
        // do a quick check since we found PC in area
        while (GetIsObjectValid(oPC))
        {

            // ***********************************************************
            // * ASG SPAWN KIT 1.3 - Slow Spawn Code
            // ***********************************************************
            // Designed for the ASG Spawn Kit - needed for the Slow Spawn
            // set up.
            object oArea = GetArea(oPC);
            if (GetIsObjectValid(oArea))
            {
                asg_SpawnCreature(oArea);
            }
        }
    }

}
