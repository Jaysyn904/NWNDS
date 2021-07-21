//
// NESS V8.1
//
// Spawn sample onEnter
//
// If you want to use pseudo-heartbeats and do not already have an area onEnter
// script, you can use this one.  Otherwise, just add Spawn_OnAreaEnter() to
// your existing onEnter handler.  Note that you use this (and
// SpawnOnAreaExit()) INSTEAD OF Spawn() / spawn_sample_hb.
//

#include "spawn_functions"
#include "tgdc_explore_inc"
#include "se_inc_resp_trap"
#include "ar_db_main"

void main()
{
  //NC:EDIT
  //added to enable defiling aura on NPC's
  //7-3-06
  object oEntering = GetEnteringObject();
  object oArea = GetArea(oEntering);
  SetLocalInt(GetArea(oEntering), "X2_L_WILD_MAGIC", 1);
  //NC:EDIT
  //added arsx area index to area
  SetLocalInt(oArea,ARSX_AREA_INDEX,ARSX_IndexArea(oArea));
  //Heatstroke's Edit
  //Added code to enable player exploration
  PlayerExplore(oEntering, 0);

  // Spawn_OnAreaEnter() can take three arguments - the name of the heartbeat
  // script to execute, the heartbeat duration, and a delay for the first
  // heartbeat.  They default to spawn_sample_hb, 6.0, and 0.0 respectively; as
  // if it were called like:
  Spawn_OnAreaEnter( "spawn_sample_hb", 10.0, 0.0 );

  //Spawn_OnAreaEnter();

//Kyri's Addition:
//The Following addition is for a set of specific zones on Clockwork Isle
//However, the tech involved can be adapted to other areas where traps are
//used. The following allows random traps to be placed in a given area on
//the ground, doors or objects. This is not a system of my own design.
//Credit for the system is as follows:
//::////////////////////////////////////////////////////////////////////////////
//:: Name Sir Elric's Respawning Traps v2.7
//:: FileName se_oea_rsp_trap
//::////////////////////////////////////////////////////////////////////////////
/*
   - Add to the OnEnterArea event of any area you want respawning traps
   - Place either or both of the invisible objects tagged INVIS_TRAP_SPAWNER or
     INVIS_TRAP_SPAWNER_RANDOM set them up to suit the area and your done.
*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By   : Sir Elric
//:: Created On   : 19th June, 2006
//:: Modified On  : 19th December, 2007
//:: Event Used   : OnEnterArea
//:: Patch        : 1.67 or above required
//::////////////////////////////////////////////////////////////////////////////

  {
   int bValid;
   object oPC = GetEnteringObject();
   if(GetIsObjectValid(oPC) == FALSE)
   oPC = OBJECT_SELF;

   object oArea = GetArea(oPC);

   if(GetLocalInt(oArea, "NO_TRAPS_TO_SET") == TRUE)
   {
      SE_Debug("[" + GetName(oArea) + "] Player has entered. No objects or doors are set for respawning traps in this area - return");
      return;
   }

   if(GetIsPC(oPC) && GetLocalInt(oArea, "TRAPS_SET") == FALSE)
   {
      object oObject = GetFirstObjectInArea();
      while(GetIsObjectValid(oObject))
      {
         if(GetLocalInt(oObject, "TRAP_ALWAYS") == TRUE)
         {
            bValid = TRUE;
            ExecuteScript("se_respawn_trap", oObject);
         }
         else if(SE_GetIsASpawnerObject(oObject))
         {
            bValid = TRUE;
            DelayCommand(0.5, ExecuteScript("se_respawn_trap", oObject));
         }
         oObject = GetNextObjectInArea();
      }

      if(bValid == TRUE)
      {
         SetLocalInt(oArea, "TRAPS_SET", TRUE);
         SetLocalInt(oArea, "TRAP_RESPAWN_INITIATED", TRUE);
         // If optional area timer is not set use the default SE_AREA_TIMER
         float fTimer = GetLocalFloat(oArea, "TRAP_AREA_TIMER");
         if(fTimer == 0.0)
         {
            fTimer = SE_AREA_TIMER;

           SE_Debug("[" + GetName(oArea) + "] Optional area timer not set using the default "
               + FloatToString(SE_AREA_TIMER, 2, 0) + " seconds");
         }
         AssignCommand(oArea, DelayCommand(fTimer, DeleteLocalInt(oArea, "TRAPS_SET")));
         AssignCommand(oArea, DelayCommand(fTimer, DeleteLocalInt(oArea, "TRAP_RESPAWN_INITIATED")));
         SE_Debug("[" + GetName(oArea) + "] Player has entered setting traps");
      }
      else
      {
         SetLocalInt(oArea, "NO_TRAPS_TO_SET", TRUE);
         SE_Debug("[" + GetName(oArea) + "] Player has entered. No objects or doors are set for respawning traps in this area - return");
      }
   }
   else if(GetLocalInt(oArea, "TRAP_RESPAWN_INITIATED") == TRUE)
   {
       SE_Debug("[" + GetName(oArea) + "] Trap respawn timer already initiated");
   }
   else
   {
      SE_Debug("[" + GetName(oArea) + "] Player has entered. Respawn timer has not yet been initiated");
   }
}
}
