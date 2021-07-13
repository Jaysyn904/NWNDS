//::///////////////////////////////////////////////
//:: Urik Below Sewer Exit
//:: ds_exit_urik_sew.nss
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
Transitions from Urik Sewers to Urik - Obsidian Gate

*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: March 14 2021
//:://////////////////////////////////////////////

void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("WP_URIKBELOW_SEWER_EXIT");

lTarget = GetLocation(oTarget);

//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

AssignCommand(oPC, ActionJumpToLocation(lTarget));

}

