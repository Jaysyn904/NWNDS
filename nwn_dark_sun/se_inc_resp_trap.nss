//::////////////////////////////////////////////////////////////////////////////
//:: Name Sir Elric's Respawning Traps v2.7
//:: FileName se_inc_resp_trap
//:: Copyright (c) 2006 Melnibone Corp.
//::////////////////////////////////////////////////////////////////////////////
/*
   - Change the constant setting below to suit your module

   - This is an include file and will NOT compile like a normal script.
     Once you have chosen your settings save it via Ctrl+S
     Then build and compile ALL scripts for the changes to take effect.
*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By : Sir Elric
//:: Created On : 19th June, 2006
//:: Modified On: 19th December, 2007
//:: Patch      : 1.67 or above required
//::////////////////////////////////////////////////////////////////////////////


// -----------------------------------------------------------------------------
//  CONSTANTS
// -----------------------------------------------------------------------------


// DEBUG - TRUE or FALSE(Set to TRUE by default - Gives debugging info)
const int DEBUG_MODE = FALSE;

// DEBUG - TRUE or FALSE(Set to TRUE by default - Visual effect for trap creation)
const int DO_EFFECTS = FALSE;

// Area trap respawner timer
// When a player enters the area objects are scanned and trapped, if set
// And the timer is started
const float SE_AREA_TIMER = 300.0; // 1 minute for testing

// Trap defaults if not set by the builder
const float SE_TRAP_SIZE_DEFAULT       = 1.0; // 1 game meter
const int   SE_TRAP_PERCENTILE_DEFAULT = 50;  // 50%
const int   SE_TRAP_TYPE_DEFAULT       = 2;   // Average category

// Reward disarm XP to the disarmer of the trap?
const int SE_DISARM_XP_ACTIVE = TRUE; // Main toggle - Switch on or off here

   const int SE_DISARM_XP_ROGUE_ONLY = TRUE; // Reward rogues only?
   const int SE_DISARM_XP_ONCE_ONLY  = TRUE; // Reward once per object per player per reset?

   // The XP reward is equal to the disarm XP
   const int SE_DISARM_XP_MULTIPLIER = 1; // Use the multiplier to increase it
   const int SE_DISARM_XP_DIVIDER    = 1; // Use the divider to decrease it

// Random trap disarm constants. Set to suit your module
const int SE_DISARM_BASE_DC          = 25;
const int SE_DISARM_RANDOM           = 10;

const int SE_DISARM_MODIFIER_MINOR   = 0;
const int SE_DISARM_MODIFIER_AVERAGE = 0;
const int SE_DISARM_MODIFIER_STRONG  = 5;
const int SE_DISARM_MODIFIER_DEADLY  = 10;
const int SE_DISARM_MODIFIER_EPIC    = 25;

// Random object trapping array
// This ensures the exact perentage of objects are trapped in an area
// No more no less (leave as is)
const string VALID_OBJECT_ARRAY = "sObjectArray";

// -----------------------------------------------------------------------------
//  PROTOTYPES
// -----------------------------------------------------------------------------


// Debug messages
void SE_Debug(string sMessage);

// Optional Trap Settings - Check and adjust accordingly
void SE_OptionalTrapSettings(object oTrap, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nOneShot);

// Create a trap at the location of the object only if one doesn't already exist
// lLoc       - Location to create trap
// fSize      - Size of the trap
// oObject    - Object to create trap on
// nTrapType  - Type of trap
// nNoDetect  - Non-Detectable? 1 is TRUE optional
// nDetectDC  - Set detect DC (1 to 250) optional
// nNoDisarm  - Non-Disarmable?  1 is TRUE  optional
// nDisarmDC  - Set disarm DC (1 to 250) optional
// nNoRecover - Non-Recoverable? 1 is TRUE  optional
// nMultiShot - Not a one shot trap? 1 is TRUE optional
void SE_SpawnTrapAtLocation(location lLoc, float fSize, object oObject, int nTrapType, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nMultiShot);

// Create a trap on the object only if one doesn't already exist
// oObject    - Object to create trap on
// nTrapType  - Type of trap
// nNoDetect  - Non-Detectable? 1 is TRUE optional
// nDetectDC  - Set detect DC (1 to 250) optional
// nNoDisarm  - Non-Disarmable?  1 is TRUE  optional
// nDisarmDC  - Set disarm DC (1 to 250) optional
// nNoRecover - Non-Recoverable? 1 is TRUE  optional
// nOneShot   - One shot trap?
void SE_SpawnTrapOnObject(object oObject, int nTrapType, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nMultiShot);

// Return a random trap dependant on the trap strength set on the invisible object
// nTrapStength = 1 Minor, 2 Average, 3 Strong, 4 Deadly, 5 Epic
int SE_TrapType(int nTrap, object oSelf);

// Create a random trap on each object or door in the area dependant on the
// percentile set on the invisible object but only if one doesn't already exist.
// oSelf - Object to create trap on
void SE_SetRandomTrapsEveryTime(object oSelf);

// Create a random trap on each object or door in the area dependant on the
// percentile set on the invisible object but only if one doesn't already exist.
// oSelf - Object to create trap on
void SE_SetRandomTraps(object oSelf);

// Check only object & doors previously trapped by SE_SetRandomTraps()
// If trap is invalid create a new one
// oSelf - Object to check for traps
void SE_CheckRandomTraps(object oSelf);

// Random DisarmDC range by default
// - 1 Minor   = 25 to 35 DC range
// - 2 Average = 25 to 35 DC range
// - 3 Strong  = 30 to 40 DC range
// - 4 Deadly  = 35 to 45 DC range
// - 5 Epic    = 50 to 60 DC range
// nType = Trap strength category
int SE_RandomDisarmDC(int nType);

// Return TRUE if a valid target object or door
int SE_GetIsValidTrapTarget(object oObject);

// Return TRUE if an invisible spawner object
int SE_GetIsASpawnerObject(object oObject);

// Return TRUE if already trapped or a valid transition
// The latter prevents trapping open doorways
int SE_GetIsTrappedOrTransition(object oObject);

// Return TRUE if there is no trap found, the trap is futher away than 1.0
// the trap creator is a PC
int SE_CheckGroundTrapStatus(object oObject, object oTrap);

// Return the trap type
// If not set return the default
int SE_ReturnTrapType(object oSelf);

// Return the trap size
// If not set return the default
float SE_ReturnTrapSize(object oSelf);

// -----------------------------------------------------------------------------
//  FUNCTIONS
// -----------------------------------------------------------------------------


void SE_Debug(string sMessage)
{
    if(DEBUG_MODE)
    {
       SendMessageToPC(GetFirstPC(), "DEBUG: " + sMessage);
       PrintString("**" + sMessage);
    }
}

void SE_OptionalTrapSettings(object oTrap, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nOneShot)
{
   if(nNoDetect)
   {
      SetTrapDetectable(oTrap, FALSE);

      SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
         + "Setting non-detectable for " + GetName(oTrap) + " to TRUE");
   }
   if(nDetectDC)
   {
      SetTrapDetectDC(oTrap, nDetectDC);

      SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
         + "Setting trap detect DC for " + GetName(oTrap) + " to "
         + IntToString(GetTrapDetectDC(oTrap)));
   }
   if(nNoDisarm)
   {
      SetTrapDisarmable(oTrap, FALSE);

      SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
         + "Setting non-disarmable for " + GetName(oTrap) + " to TRUE");
   }
   if(nDisarmDC)
   {
      SetTrapDisarmDC(oTrap, nDisarmDC);

         SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
            + "Setting trap disarm DC for " + GetName(oTrap)+" to "
            + IntToString(GetTrapDisarmDC(oTrap)));
   }
   if(nNoRecover)
   {
      SetTrapRecoverable(oTrap, FALSE);

      SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
         + "Setting non-recoverable for " + GetName(oTrap) + " to TRUE");
   }
   if(nOneShot)
   {
      SetTrapOneShot(oTrap, FALSE);

      SE_Debug("[" + GetName(GetArea(oTrap)) + "] "
         + "Setting one shot for " + GetName(oTrap) + " to FALSE");
   }
}


void SE_SpawnTrapAtLocation(location lLoc, float fSize, object oObject, int nTrapType, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nMultiShot)
{
   object oTrap = CreateTrapAtLocation(nTrapType, lLoc, fSize, "", STANDARD_FACTION_HOSTILE, "se_on_disarmed_l", "");

   SE_Debug("[" + GetName(GetArea(oObject)) + "] "
      + "Creating trap " + Get2DAString("traps", "Label", nTrapType)
      + " at the location of " + GetName(oObject));

   // Check for optional trap settings and set accordingly
   SE_OptionalTrapSettings(oTrap, nNoDetect, nDetectDC, nNoDisarm, nDisarmDC, nNoRecover, nMultiShot);

   if(DO_EFFECTS)
   {
      effect eEffect = EffectVisualEffect(VFX_IMP_TORNADO);
      ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lLoc);
   }
}

void SE_SpawnTrapOnObject(object oObject, int nTrapType, int nNoDetect, int nDetectDC, int nNoDisarm, int nDisarmDC, int nNoRecover, int nMultiShot)
{
   if(GetIsTrapped(oObject))
   {
      SE_Debug("[" + GetName(GetArea(oObject)) + "] "
         + GetName(GetTrapCreator(oObject)) + " set a trap on the "
         + GetName(oObject) + " spawn cancelled.");

      return;
   }

   SE_Debug("[" + GetName(GetArea(oObject)) + "] "
      + "Creating trap " + Get2DAString("traps", "Label", nTrapType)
      + " on the " + GetName(oObject));

   CreateTrapOnObject(nTrapType, oObject, STANDARD_FACTION_HOSTILE, "se_on_disarmed", "");

   // Check for optional trap settings and set accordingly
   SE_OptionalTrapSettings(oObject, nNoDetect, nDetectDC, nNoDisarm, nDisarmDC, nNoRecover, nMultiShot);

   if(DO_EFFECTS)
   {
      effect eEffect = EffectVisualEffect(VFX_IMP_TORNADO);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oObject);
   }
   // v1.5 addition
   //SetLocalInt(oObject, "STOCK_TRAP_DISARM_DC", GetTrapDisarmDC(oObject));

}

int SE_TrapType(int nTrap, object oSelf)
{
   switch(nTrap)
   {
      case 1: nTrap = GetLocalInt(oSelf, "PRESET_TYPE");
              if(nTrap == 0 || nTrap > 11 )
                 nTrap = Random(10) + 1;
              switch(nTrap)// Minor
              {
                 case 1:  nTrap = TRAP_BASE_TYPE_MINOR_ACID;       return nTrap;
                 case 2:  nTrap = TRAP_BASE_TYPE_MINOR_ACID_SPLASH;return nTrap;
                 case 3:  nTrap = TRAP_BASE_TYPE_MINOR_ELECTRICAL; return nTrap;
                 case 4:  nTrap = TRAP_BASE_TYPE_MINOR_FIRE;       return nTrap;
                 case 5:  nTrap = TRAP_BASE_TYPE_MINOR_FROST;      return nTrap;
                 case 6:  nTrap = TRAP_BASE_TYPE_MINOR_GAS;        return nTrap;
                 case 7:  nTrap = TRAP_BASE_TYPE_MINOR_HOLY;       return nTrap;
                 case 8:  nTrap = TRAP_BASE_TYPE_MINOR_NEGATIVE;   return nTrap;
                 case 9:  nTrap = TRAP_BASE_TYPE_MINOR_SONIC;      return nTrap;
                 case 10: nTrap = TRAP_BASE_TYPE_MINOR_SPIKE;      return nTrap;
                 case 11: nTrap = TRAP_BASE_TYPE_MINOR_TANGLE;     return nTrap;
              }

      case 2: nTrap = GetLocalInt(oSelf, "PRESET_TYPE");
              if(nTrap == 0 || nTrap > 11 )
                 nTrap = Random(10) + 1;
              switch(nTrap)// Average
              {
                 case 1: nTrap  = TRAP_BASE_TYPE_AVERAGE_ACID;       return nTrap;
                 case 2: nTrap  = TRAP_BASE_TYPE_AVERAGE_ACID_SPLASH;return nTrap;
                 case 3: nTrap  = TRAP_BASE_TYPE_AVERAGE_ELECTRICAL; return nTrap;
                 case 4: nTrap  = TRAP_BASE_TYPE_AVERAGE_FIRE;       return nTrap;
                 case 5: nTrap  = TRAP_BASE_TYPE_AVERAGE_FROST;      return nTrap;
                 case 6: nTrap  = TRAP_BASE_TYPE_AVERAGE_GAS;        return nTrap;
                 case 7: nTrap  = TRAP_BASE_TYPE_AVERAGE_HOLY;       return nTrap;
                 case 8: nTrap  = TRAP_BASE_TYPE_AVERAGE_NEGATIVE;   return nTrap;
                 case 9: nTrap  = TRAP_BASE_TYPE_AVERAGE_SONIC;      return nTrap;
                 case 10: nTrap = TRAP_BASE_TYPE_AVERAGE_SPIKE;      return nTrap;
                 case 11: nTrap = TRAP_BASE_TYPE_AVERAGE_TANGLE;     return nTrap;
              }
      case 3 : nTrap = GetLocalInt(oSelf, "PRESET_TYPE");
              if(nTrap == 0 || nTrap > 11 )
                 nTrap = Random(10) + 1;
              switch(nTrap)// Strong
              {
                 case 1: nTrap  = TRAP_BASE_TYPE_STRONG_ACID;       return nTrap;
                 case 2: nTrap  = TRAP_BASE_TYPE_STRONG_ACID_SPLASH;return nTrap;
                 case 3: nTrap  = TRAP_BASE_TYPE_STRONG_ELECTRICAL; return nTrap;
                 case 4: nTrap  = TRAP_BASE_TYPE_STRONG_FIRE;       return nTrap;
                 case 5: nTrap  = TRAP_BASE_TYPE_STRONG_FROST;      return nTrap;
                 case 6: nTrap  = TRAP_BASE_TYPE_STRONG_GAS;        return nTrap;
                 case 7: nTrap  = TRAP_BASE_TYPE_STRONG_HOLY;       return nTrap;
                 case 8: nTrap  = TRAP_BASE_TYPE_STRONG_NEGATIVE;   return nTrap;
                 case 9: nTrap  = TRAP_BASE_TYPE_STRONG_SONIC;      return nTrap;
                 case 10: nTrap = TRAP_BASE_TYPE_STRONG_SPIKE;      return nTrap;
                 case 11: nTrap = TRAP_BASE_TYPE_STRONG_TANGLE;     return nTrap;
              }
      case 4: nTrap = GetLocalInt(oSelf, "PRESET_TYPE");
              if(nTrap == 0 || nTrap > 11 )
                 nTrap = Random(10) + 1;
              switch(nTrap)// Deadly
              {
                 case 1: nTrap  = TRAP_BASE_TYPE_DEADLY_ACID;       return nTrap;
                 case 2: nTrap  = TRAP_BASE_TYPE_DEADLY_ACID_SPLASH;return nTrap;
                 case 3: nTrap  = TRAP_BASE_TYPE_DEADLY_ELECTRICAL; return nTrap;
                 case 4: nTrap  = TRAP_BASE_TYPE_DEADLY_FIRE;       return nTrap;
                 case 5: nTrap  = TRAP_BASE_TYPE_DEADLY_FROST;      return nTrap;
                 case 6: nTrap  = TRAP_BASE_TYPE_DEADLY_GAS;        return nTrap;
                 case 7: nTrap  = TRAP_BASE_TYPE_DEADLY_HOLY;       return nTrap;
                 case 8: nTrap  = TRAP_BASE_TYPE_DEADLY_NEGATIVE;   return nTrap;
                 case 9: nTrap  = TRAP_BASE_TYPE_DEADLY_SONIC;      return nTrap;
                 case 10: nTrap = TRAP_BASE_TYPE_DEADLY_SPIKE;      return nTrap;
                 case 11: nTrap = TRAP_BASE_TYPE_DEADLY_TANGLE;     return nTrap;
              }
      case 5: nTrap = GetLocalInt(oSelf, "PRESET_TYPE");
              if(nTrap == 0 || nTrap > 4 )
                 nTrap = Random(3) + 1;
              switch(nTrap)// Epic
              {
                 case 1: nTrap = TRAP_BASE_TYPE_EPIC_ELECTRICAL;return nTrap;
                 case 2: nTrap = TRAP_BASE_TYPE_EPIC_FIRE;      return nTrap;
                 case 3: nTrap = TRAP_BASE_TYPE_EPIC_FROST;     return nTrap;
                 case 4: nTrap = TRAP_BASE_TYPE_EPIC_SONIC;     return nTrap;
              }
    }
     return SE_TRAP_TYPE_DEFAULT; // Fail safe
}

void SE_SetRandomTrapsEveryTime(object oSelf)
{
   int nObject = 1;

   // Return the trap type, if not set use the default
   int nTrapType = SE_ReturnTrapType(oSelf);

   // Return the trap size, if not set use the default
   float fSize = SE_ReturnTrapSize(oSelf);

   // Return the percentile, if not set use the default
   int nPerc = GetLocalInt(oSelf, "TRAP_PERCENTILE");

   if(nPerc == 0)
   {
       DelayCommand(3.0,
           SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
               + "DEFAULT: Trap percentile was not set on "
               + GetName(oSelf) + " setting it to the default "
               + IntToString(SE_TRAP_PERCENTILE_DEFAULT) + "%"));

       SetLocalInt(oSelf, "TRAP_PERCENTILE", SE_TRAP_PERCENTILE_DEFAULT);
   }
   else
   {
       DelayCommand(3.0,
           SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
               + " Trap percentile was set to "
               + IntToString(nPerc) + "%"));
   }

   // iterate through each object in the area
   int i, n, nPick, nLast;

   object oObject = GetFirstObjectInArea();
   while(GetIsObjectValid(oObject))
   {
      // Remove previously spawned traps first
      if(GetIsTrapped(oObject))
      {
         object oTrapCreator = GetTrapCreator(oObject);
         if(GetIsPC(oTrapCreator) == FALSE && GetLocalInt(oObject, "TRAP_ALWAYS") == FALSE)
         {
            SetTrapDisabled(oObject);
            if(GetObjectType(oObject) == OBJECT_TYPE_TRIGGER)
            {
               SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
                     + " Removing location trap " + GetName(oObject));
            }
            else
            {
               SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
                     + " Removing trap from " + GetName(oObject));
            }
         }
      }

      // "TRAP_ALWAYS" objects will be trapped so no need to add them to the random list
      // "TRAP_NEVER" skip these from the random list
      if(SE_GetIsValidTrapTarget(oObject)
            && GetLocalInt(oObject, "TRAP_ALWAYS") == FALSE
            && GetLocalInt(oObject, "TRAP_NEVER") == FALSE)
      {
         // Not a spawner object or a valid transition
         if(SE_GetIsASpawnerObject(oObject) == FALSE &&
            !GetIsObjectValid(GetTransitionTarget(oObject)))
         {
           SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(n), oObject);
           n++; // increment counter
         }
      }
        oObject = GetNextObjectInArea();
   }

   // Work out our percentage to trap here from the total valid targets
   nPerc = (n * nPerc / 100);

   DelayCommand(3.5,
       SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
           + IntToString(nPerc) + " of " + IntToString(n)
           + " valid targets to be trapped in this area"));

   // now we shuffle the array
   for(nLast = n - 1 ; nLast > 1; nLast--)
   {
       // pick a number at random between 1 and last unshuffled element
       nPick = Random(nLast - 1) + 1;

       object oLast = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nLast));
       object oPick = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nPick));

       SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nLast), oPick);
       SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nPick), oLast);
   }

   // Now we finally trap the percent to be trapped
   i = 1;
   for(i ; i <= nPerc; i++)
   {
       oObject = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(i));
       if(GetTag(oObject) == "RANDOM_GROUND_TRAP_LOCATION")
       {
           location lNewLoc = GetLocation(oObject);
           SE_SpawnTrapAtLocation(lNewLoc,
              fSize,
              oObject,
              SE_TrapType(nTrapType, oSelf),
              GetLocalInt(oSelf, "TRAP_DETECTABLE"),
              GetLocalInt(oSelf, "TRAP_DETECT_DC"),
              GetLocalInt(oSelf, "TRAP_DISARM"),
              SE_RandomDisarmDC(nTrapType),
              GetLocalInt(oSelf, "TRAP_RECOVERABLE"),
              GetLocalInt(oSelf, "TRAP_MULTI_SHOT"));

           // Increment number of trapped placeables
           SetLocalInt(oSelf, "NUMBER_TRAPPED", nObject);
           nObject += 1;

           SE_Debug("[" + GetName(GetArea(oObject)) + "] * Trapping "
               + GetName(oObject));
        }
        else
        {
           SE_SpawnTrapOnObject(oObject,
              SE_TrapType(nTrapType, oSelf),
              GetLocalInt(oSelf, "TRAP_DETECTABLE"),
              GetLocalInt(oSelf, "TRAP_DETECT_DC"),
              GetLocalInt(oSelf, "TRAP_DISARM"),
              SE_RandomDisarmDC(nTrapType),
              GetLocalInt(oSelf, "TRAP_RECOVERABLE"),
              GetLocalInt(oSelf, "TRAP_MULTI_SHOT"));

           // Increment number of trapped placeables
           SetLocalInt(oSelf, "NUMBER_TRAPPED", nObject);
           nObject += 1;

           SE_Debug("[" + GetName(GetArea(oObject)) + "] * Trapping " + GetName(oObject));
        }
   }
      DelayCommand(4.0,
          SE_Debug("[" + GetName(GetArea(oObject)) + "] Total valid targets that were trapped "
              + IntToString(nObject - 1)));
}
void SE_SetRandomTraps(object oSelf)
{
   int nObject = 1;

   // Only run this function once per random spawner object
   SetLocalInt(oSelf, "LOOP_AREA_ONCE", TRUE );

   // Return the trap type, if not set use the default
   int nTrapType = SE_ReturnTrapType(oSelf);

   // Return the trap size, if not set use the default
   float fSize = SE_ReturnTrapSize(oSelf);

   // Return the percentile, if not set use the default
   int nPerc = GetLocalInt(oSelf, "TRAP_PERCENTILE");

   if(nPerc == 0)
   {
       DelayCommand(3.0,
           SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
               + "DEFAULT: Trap percentile was not set on "
               + GetName(oSelf) + " setting it to the default "
               + IntToString(SE_TRAP_PERCENTILE_DEFAULT) + "%"));

       SetLocalInt(oSelf, "TRAP_PERCENTILE", SE_TRAP_PERCENTILE_DEFAULT);
   }
   else
   {
       DelayCommand(3.0,
           SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
               + " Trap percentile was set to "
               + IntToString(nPerc) + "%"));
   }

   // iterate through each object in the area
   int i, n, nPick, nLast;

   object oObject = GetFirstObjectInArea();
   while(GetIsObjectValid(oObject))
   {
      // "TRAP_ALWAYS" objects will be trapped so no need to add them to the random list
      // "TRAP_NEVER" skip these from the random list
      if(SE_GetIsValidTrapTarget(oObject)
            && GetLocalInt(oObject, "TRAP_ALWAYS") == FALSE
            && GetLocalInt(oObject, "TRAP_NEVER") == FALSE)
      {
         // Not a spawner object or a valid transition
         if(SE_GetIsASpawnerObject(oObject) == FALSE && SE_GetIsTrappedOrTransition(oObject) == FALSE)
         {
           SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(n), oObject);
           n++; // increment counter
         }
      }
        oObject = GetNextObjectInArea();
   }

   // Work out our percentage to trap here from the total valid targets
   nPerc = (n * nPerc / 100);

   DelayCommand(3.5,
       SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
           + IntToString(nPerc) + " of " + IntToString(n)
           + " valid targets to be trapped in this area"));

   // now we shuffle the array
   for(nLast = n - 1 ; nLast > 1; nLast--)
   {
       // pick a number at random between 1 and last unshuffled element
       nPick = Random(nLast - 1) + 1;

       object oLast = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nLast));
       object oPick = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nPick));

       SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nLast), oPick);
       SetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(nPick), oLast);
   }

   // Now we finally trap the percent to be trapped
   i = 1;
   for(i ; i <= nPerc; i++)
   {
       oObject = GetLocalObject(oSelf, VALID_OBJECT_ARRAY + IntToString(i));
       if(GetTag(oObject) == "RANDOM_GROUND_TRAP_LOCATION")
       {
           location lNewLoc = GetLocation(oObject);
           SE_SpawnTrapAtLocation(lNewLoc,
              fSize,
              oObject,
              SE_TrapType(nTrapType, oSelf),
              GetLocalInt(oSelf, "TRAP_DETECTABLE"),
              GetLocalInt(oSelf, "TRAP_DETECT_DC"),
              GetLocalInt(oSelf, "TRAP_DISARM"),
              SE_RandomDisarmDC(nTrapType),
              GetLocalInt(oSelf, "TRAP_RECOVERABLE"),
              GetLocalInt(oSelf, "TRAP_MULTI_SHOT"));

           // Increment number of trapped placeables
           SetLocalObject(oSelf, "TRAP_SET" + IntToString(nObject), oObject);
           SetLocalInt(oSelf, "NUMBER_TRAPPED", nObject);
           nObject += 1;

           SE_Debug("[" + GetName(GetArea(oObject)) + "] * Trapping "
               + GetName(oObject));
        }
        else
        {
           SE_SpawnTrapOnObject(oObject,
              SE_TrapType(nTrapType, oSelf),
              GetLocalInt(oSelf, "TRAP_DETECTABLE"),
              GetLocalInt(oSelf, "TRAP_DETECT_DC"),
              GetLocalInt(oSelf, "TRAP_DISARM"),
              SE_RandomDisarmDC(nTrapType),
              GetLocalInt(oSelf, "TRAP_RECOVERABLE"),
              GetLocalInt(oSelf, "TRAP_MULTI_SHOT"));

           // Increment number of trapped placeables
           SetLocalObject(oSelf, "TRAP_SET" + IntToString(nObject), oObject);
           SetLocalInt(oSelf, "NUMBER_TRAPPED", nObject);
           nObject += 1;

           SE_Debug("[" + GetName(GetArea(oObject)) + "] * Trapping " + GetName(oObject));
        }
   }
      DelayCommand(4.0,
          SE_Debug("[" + GetName(GetArea(oObject)) + "] Total valid targets that were trapped "
              + IntToString(nObject - 1)));
}


void SE_CheckRandomTraps(object oSelf)
{
   // Return the trap type, if not set use the default
   int nTrapType = SE_ReturnTrapType(oSelf);

   // Return the trap size, if not set use the default
   float fSize = SE_ReturnTrapSize(oSelf);

   location lMyLoc;
   int nLoop;
   int nObjectsTrapped = GetLocalInt(oSelf, "NUMBER_TRAPPED");
   if(!nObjectsTrapped)
   {
      SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
         + "No traps were set. Destroying invisible object.");

      DestroyObject(oSelf, 0.0);
      return;
   }
   for (nLoop=1; nLoop<=nObjectsTrapped; nLoop++)
   {
      object oObject = GetLocalObject(oSelf, "TRAP_SET"+IntToString(nLoop));
      if(GetIsObjectValid(oObject))
      {
         // Ground trap waypoint?
         if(GetTag(oObject) == "RANDOM_GROUND_TRAP_LOCATION")
         {
            object oTrap = GetNearestTrapToObject(oObject, FALSE );

            if(SE_CheckGroundTrapStatus(oObject, oTrap))
            {
               SE_Debug("[" + GetName(GetArea(oObject)) + "] "
                   + "No trap found at the location of "
                   + GetName(oObject) + " creating one");

               lMyLoc = GetLocation(oObject);

               SE_SpawnTrapAtLocation(lMyLoc,
                   fSize,
                   oObject,
                   SE_TrapType(nTrapType, oSelf),
                   0,
                   0,
                   0,
                   SE_RandomDisarmDC(nTrapType),
                   0,
                   0);
            }
         }
         else if(!GetIsTrapped(oObject))
         {
            SE_Debug("[" + GetName(GetArea(oObject)) + "] " + "No trap found on "
                + GetName(oObject) + " creating one");

            SE_SpawnTrapOnObject(oObject,
                SE_TrapType(nTrapType, oSelf),
                0,
                0,
                0,
                SE_RandomDisarmDC(nTrapType),
                0,
                0);
         }
      }
   }
}

int SE_RandomDisarmDC(int nType)
{
    int nDC = SE_DISARM_BASE_DC;
    switch(nType)
    {
       case 1: nDC += SE_DISARM_MODIFIER_MINOR;   break;
       case 2: nDC += SE_DISARM_MODIFIER_AVERAGE; break;
       case 3: nDC += SE_DISARM_MODIFIER_STRONG;  break;
       case 4: nDC += SE_DISARM_MODIFIER_DEADLY;  break;
       case 5: nDC += SE_DISARM_MODIFIER_EPIC;    break;
    }
    nDC += Random(SE_DISARM_RANDOM) + 1;
    return nDC;
}


int SE_GetIsValidTrapTarget(object oObject)
{
    int nType = GetObjectType(oObject);

    if(nType == OBJECT_TYPE_DOOR)
        return TRUE;

    if(nType == OBJECT_TYPE_PLACEABLE && GetUseableFlag(oObject) == TRUE)
        return TRUE;

    if((nType == OBJECT_TYPE_WAYPOINT) && GetTag(oObject) == "RANDOM_GROUND_TRAP_LOCATION")
        return TRUE;

    return FALSE;
}


int SE_GetIsASpawnerObject(object oObject)
{
    if(GetTag(oObject) == "INVIS_TRAP_SPAWNER_RANDOM" ||
       GetTag(oObject) == "INVIS_TRAP_SPAWNER")
       return TRUE;

       return FALSE;
}


int SE_GetIsTrappedOrTransition(object oObject)
{
    if(GetIsTrapped(oObject) || GetIsObjectValid(GetTransitionTarget(oObject)))
    return TRUE;

    return FALSE;
}


int SE_CheckGroundTrapStatus(object oObject, object oTrap)
{
   object oCreator = GetTrapCreator(oTrap);

   if(GetIsObjectValid(oTrap) == FALSE
   || GetDistanceBetween(oObject, oTrap) > 1.0f
   || GetIsPC(oCreator))

     return TRUE;

     return FALSE;
}


int SE_ReturnTrapType(object oSelf)
{
    int nType = GetLocalInt(oSelf, "TRAP_TYPE");
    if(nType == 0)
    {
        DelayCommand(4.0,
            SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
                + "DEFAULT: Trap type was not set on "
                + GetName(oSelf) + " setting it to the default of "
                + IntToString(SE_TRAP_TYPE_DEFAULT)));

        SetLocalInt(oSelf, "TRAP_TYPE", SE_TRAP_TYPE_DEFAULT);
        nType = SE_TRAP_TYPE_DEFAULT;
     }
     return nType;
}

float SE_ReturnTrapSize(object oSelf)
{
    float fSize = GetLocalFloat(oSelf, "TRAP_SIZE");
    if(fSize == 0.0)
    {
       DelayCommand(4.0,
           SE_Debug("[" + GetName(GetArea(oSelf)) + "] "
               + "DEFAULT: Trap size not set on "
               + GetName(oSelf) + " setting it to the default of "
               + IntToString(FloatToInt(SE_TRAP_SIZE_DEFAULT))));

       SetLocalFloat(oSelf, "TRAP_SIZE", SE_TRAP_SIZE_DEFAULT);
       fSize = SE_TRAP_SIZE_DEFAULT;
    }
    return fSize;
}
//void main() {}
