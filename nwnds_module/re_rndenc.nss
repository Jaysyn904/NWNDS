//::///////////////////////////////////////////////
//:: Name re_rndenc
//:: FileName re_rndenc.nss
//:: Copyright (c) 2002 Raymond Miller
//:://////////////////////////////////////////////
/*
This script creates functions called RandomEncounter(),
CleanHouse(), and SetRndEncProperties() for use in the NWN
scripting language.  This script is meant to be used as an #include
and is part of the BESIE Random Encounter package by Ray Miller
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 7/6/2002
//:://////////////////////////////////////////////

// Encounter Type Constants
int ENCOUNTER_TYPE_AREA = 3;
int ENCOUNTER_TYPE_PARTY = 1;
int ENCOUNTER_TYPE_IND = 2;
int ENCOUNTER_TYPE_TOTALPARTYLEVELS = 4;

struct RndEncProperties
    {
    int bInitialized;
    int iDifficulty;
    int bConsiderCR;
    string sCreatureTable;
    int iLifeTime;
    int iMph;
    int iEncounterType;
    int bConflict;
    int iChanceOnRest;
    int bLOSCheck;
    };

// FUNCTION DECLARATIONS

// Sets properties for random encounters that are likely to seldom change
// - oObject: The object that holds these properties.
// - iDifficulty: 1 to 10
// - bConsiderCR: If TRUE takes CR of creature into consideration when
//   choosing an encounter.
// - sCreatureTable: "re_***" - where *** is a string of letter and/or numbers to indicate to the function what type
//   of creatures to spawn.  They are as follows:
//      a - animals
//      c - construct
//      d - dragon
//      e - elemental
//      g - giant
//      h - humanoid
//      i - insect
//      m - miscellaneous
//      p - planar
//      u - undead
//      b - bandit
//      x1 through x### - These are for custom encounter tables.
//      t1 through t### - These are for treasure tables.
// - iLifeTime: Time in seconds before unengaged encounters decay.
// - Mph: Should equal the Minutes Per Hour setting of the Module.
// - iEncounterType:
//      ENCOUNTER_TYPE_PARTY - Takes into consideration the average level of the entire party of the PC who is to
//      receive the encounter when choosing an encounter of appropriate difficulty level.
//      ENCOUNTER_TYPE_TOTALPARTYLEVELS (default) - Takes into consideration the TOTAL of all the levels of the PC's party who
//      currently reside in the same area as the PC to receive the encounter.
//      ENCOUNTER_TYPE_AREA - Takes into consideration the levels off all PCs and henchmen within a 20m radius of the PC
//      who is to receive the encounter.
//      ENCOUNTER_TYPE_IND - Takes into consideration only the levels of the individual PC who is to receive the encounter.
// - bConflict: If set to TRUE then random encounters can occur during combat.
// - iChanceOnRest: The chance of a random encounter occuring when a PC rests (only matters on Area Object and the "re_onrest"
//   script must be placed in PlayerOnRest handler of the module object).
// - bLOSCheck: Dependant upon a broken scripting function.  (future use!)
// Note:  This function is best called by the OnModuleLoad or OnAreaLoad handler.
void SetRndEncProperties(object oObject = OBJECT_SELF, int iDifficulty = 4, int bConsiderCR = TRUE, string sCreatureTable = "re_ceghimpubt0", int iLifeTime = 180, int iMph = 2, int iEncounterType = 4, int bConflict = FALSE, int iChanceOnRest = 20, int bLOSCheck = FALSE);

// Returns the structure "RndEncProperties" containing all the Random Encounter Properties set on oObject.
// The elements of the structure are as follows:
// - bInitialized: TRUE if properties have been set on this object.
// - iDifficulty: 1 to 10
// - bConsiderCR: If TRUE, takes CR of creature into consideration when
//   choosing an encounter.
// - sCreatureTable: "re_***" - where *** is a string of letter and/or numbers to indicate to the function what type
//   of creatures to spawn.  They are as follows:
//      a - animals
//      c - construct
//      d - dragon
//      e - elemental
//      g - giant
//      h - humanoid
//      i - insect
//      m - miscellaneous
//      p - planar
//      u - undead
//      b - bandit
//      x1 through x### - These are for custom encounter tables.
//      t1 through t### - These are for treasure tables.
// - iLifeTime: Time in seconds before unengaged encounters decay.
// - iMph: Should equal the Minutes Per Hour setting of the Module.
// - iEncounterType:
//      ENCOUNTER_TYPE_PARTY - Takes into consideration the average level of the entire party of the PC who is to
//      receive the encounter when choosing an encounter of appropriate difficulty level.
//      ENCOUNTER_TYPE_TOTALPARTYLEVELS (default) - Takes into consideration the TOTAL of all the levels of the PC's party who
//      currently reside in the same area as the PC to receive the encounter.
//      ENCOUNTER_TYPE_AREA - Takes into consideration the levels off all PCs and henchmen within a 20m radius of the PC
//      who is to receive the encounter.
//      ENCOUNTER_TYPE_IND - Takes into consideration only the levels of the individual PC who is to receive the encounter.
// - bConflict: If TRUE then random encounters can occur during combat.
// - iChanceOnRest: The chance of a random encounter occuring when a PC rests (only matters on Area Object and the "re_onrest"
//   script must be placed in PlayerOnRest handler of the module object).
// - bLOSCheck: Dependant upon a broken scripting function.  (future use!)
struct RndEncProperties GetRndEncProperties(object oObject);

// Generates the likelihood of a random encounter.
// - fChanceOfEncounter: Odds of encounter spawning when funciton is called.  Accurate to two
//   decimal places.  .01 to 100.00 percent chance.
// - oEncounterObject: The object about which the encounter will spawn, whose levels (if a player)
//   will be considered when determining an appropriate creature.
// - sTemplate: When used as the sCreatureTable parameter in the SetRndEncProperties()
//   function this parameter has higher priority.  It can also be set to the tag of a
//   specific creature, or to "random" to use the default table set by SetRndEncProperties()
// - iMinNumberOfCreatures: If > 0, a random number of creatures between this and iMaxNumberOfCreatures
//   will spawn.  If set to 0, then exactly the number of creatures set by iMaxNumberOfCreatures will
//   spawn.
// - iMaxNumberOfCreatures: If this and iMinNumberOfCreatures is set to 0 then the number of Creatures
//   spawned will be determined by the CR of the creature spawned compared to the levels of the player(s).
// - iMinEncounterDistance: If set to 0, encounter distance will always be at the number set by iMaxEncounterDistance.
// - iMaxEncounterDistance: Farthest distance the encounter can be from oEncounterObject.
// - iOrientation: 0 to 360.  Counterclockwise representing the angle from facing where the encounter will spawn.
//   a value of 0 will spawn the encounter directly in front of oEncounterObject.  360 will generate a random angle.
// - iTolerance: The number of degrees by which the angle can randomly be off from iOrientation.
// - iCheckDistance: The distance a PC has to move before a Random Encounter check can be made against him.  If the PC has
//   not covered this much distance, then a call to the RandomEncounter() function for this PC will yield
//   OBJECT_INVALID.
// - iLevelOverride: Use this to force the function to base the encounter on a character level other than that
//   determined by oEncounterObject.
// - iDifficulty: Overrides the difficulty setting determined by the SetRndEncProperties() function.
object RandomEncounter(float fChanceOfEncounter = 100.0, object oEncounterObject = OBJECT_SELF, string sTemplate = "random", int iMinNumberOfCreatures = 0, int iMaxNumberOfCreatures = 0, int iMinEncounterDistance = 1, int iMaxEncounterDistance = 15, int iOrientation = 360, int iTolerance = 0, int iCheckDistance = 0, int iLevelOverride = 0, int iDifficulty = 0);

// Used to "clean up" an area that has become littered by random encounters.
// - bDestroyPlotItems - Tells the function whether or not to destroy items with their plot flags set.  If set to TRUE,
//   plot items will be destroyed just like any other item.
// - oArea - The area to clean up.
// - iSpawnOverride - Overrides the default (set by the SetRndEncProperties() function) time to destroy random encounter
//   creatures who are not engaged by PCs.
// - iItemOverride - Overrides the default time of 30 minutes after which to destroy items dropped by PCs
//   Note: Only works if the "re_moditemdrop" script included with the BESIE Random Encounter package
//   is placed in the module OnItemUnacquire handler.
// - iBodyBagOverride - Overrides the default time of 5 minutes after which to destroy loot that was dropped by creatures
//   who were killed.
// NOTE: If there is bDestroyPlotItems is FALSE and there is a plot item or items inside a container or body bag, the container
// and all non-plot items will decay but the plot item(s) will be left.
// NOTE: A value of zero assigned to the override parameters will cause the function to use the default value for that parameter.
void CleanHouse(int bDestroyPlotItems = FALSE, object oArea = OBJECT_SELF, int iSpawnOverride = 0, int iItemOverride = 0, int iBodyBagOverride = 0);

// Returns the game's calander time in seconds since time zero.
// - iMph: Minutes Per Hour.  This should match the module's setting.
int GetTimeInSeconds(int iMph = 2);

// Causes oCreature to walk to a randomly determined location.
// - lCenter: The center of a circle in which random destinations can be generated.
// - iDistance: The distance from lCenter in which to randomly generate destinations.
// - oCreature: The creature to perform the random walk.
// Note: Unlike the default RandomWalk function, this function does not persist until a ClearAllActions is called.  Instead this
// function generates a single random desitination and the move to that destination is added to the creatures action que only once
// per call.
location RandomWalk2(location lCenter, int iDistance = 20, object oCreature = OBJECT_SELF);

void SetRndEncProperties(object oObject = OBJECT_SELF, int iDifficulty = 4, int bConsiderCR = TRUE, string sCreatureTable = "re_ceghimpubt0", int iLifeTime = 180, int iMph = 2, int iEncounterType = 4, int bConflict = TRUE, int iChanceOnRest = 20, int bLOSCheck = FALSE)
{
    SetLocalInt(oObject, "re_bInitialized", TRUE);
    SetLocalInt(oObject, "re_iDifficulty", iDifficulty);
    SetLocalInt(oObject, "re_bConsiderCR", bConsiderCR);
    SetLocalString(oObject, "re_sCreatureTable", sCreatureTable);
    SetLocalInt(oObject, "re_iLifeTime", iLifeTime);
    SetLocalInt(oObject, "re_iMph", iMph);
    SetLocalInt(oObject, "re_iEncounterType", iEncounterType);
    SetLocalInt(oObject, "re_bConflict", bConflict);
    SetLocalInt(oObject, "re_iChanceOnRest", iChanceOnRest);
    SetLocalInt(oObject, "re_bLOSCheck", bLOSCheck);
}

struct RndEncProperties GetRndEncProperties(object oObject = OBJECT_SELF)
{
    if(oObject == GetModule() && !GetLocalInt(GetModule(), "re_bInitialized")) SetRndEncProperties(GetModule());
    struct RndEncProperties strProps;
    strProps.bInitialized = GetLocalInt(oObject, "re_bInitialized");
    strProps.iDifficulty = GetLocalInt(oObject, "re_iDifficulty");
    strProps.bConsiderCR = GetLocalInt(oObject, "re_bConsiderCR");
    strProps.sCreatureTable = GetLocalString(oObject, "re_sCreatureTable");
    strProps.iLifeTime = GetLocalInt(oObject, "re_iLifeTime");
    strProps.iMph = GetLocalInt(oObject, "re_iMph");
    strProps.iEncounterType = GetLocalInt(oObject, "re_iEncounterType");
    strProps.bConflict = GetLocalInt(oObject, "re_bConflict");
    strProps.iChanceOnRest = GetLocalInt(oObject, "re_iChanceOnRest");
    strProps.bLOSCheck = GetLocalInt(oObject, "re_bLOSCheck");
    return strProps;
}

#include "re_table"
object RandomEncounter(float fChanceOfEncounter = 100.0, object oEncounterObject = OBJECT_SELF, string sTemplate = "random", int iMinNumberOfCreatures = 0, int iMaxNumberOfCreatures = 0, int iMinEncounterDistance = 1, int iMaxEncounterDistance = 15, int iOrientation = 360, int iTolerance = 0, int iCheckDistance = 0, int iLevelOverride = 0, int iDifficulty = 0)
{
// IF PROPERTIES ARE NOT SET ON MODULE OBJECT THEN SET THEM WITH DEFAULTS
    if(!GetLocalInt(GetModule(), "re_bInitialized"))
        {
        SetRndEncProperties(GetModule());
        }

// DETERMINE IF ENCOUNTER HAPPENS
    //Has the player moved farther than the CheckDistance?
    float fTravelDistance;
    if(GetIsPC(oEncounterObject))
        {
        if(!GetLocalInt(oEncounterObject, "re_bOldLocationSet"))
            {
            SetLocalInt(oEncounterObject, "re_bOldLocationSet", TRUE);
            SetLocalLocation(oEncounterObject, "re_lOldLocation", GetLocation(oEncounterObject));
            if(iCheckDistance) return OBJECT_INVALID;
            }
        if(GetDistanceBetweenLocations(GetLocation(oEncounterObject), GetLocalLocation(oEncounterObject, "re_lOldLocation")) < 0.0)
            {
            SetLocalLocation(oEncounterObject, "re_lOldLocation", GetLocation(oEncounterObject));
            if(iCheckDistance) return OBJECT_INVALID;
            }
        fTravelDistance = GetDistanceBetweenLocations(GetLocation(oEncounterObject), GetLocalLocation(oEncounterObject, "re_lOldLocation"));
        SetLocalFloat(oEncounterObject, "re_fTravelDistance", GetLocalFloat(oEncounterObject, "re_fTravelDistance") + fTravelDistance);
        SetLocalLocation(oEncounterObject, "re_lOldLocation", GetLocation(oEncounterObject));
        if(GetLocalFloat(oEncounterObject, "re_fTravelDistance") >= IntToFloat(iCheckDistance)) DeleteLocalFloat(oEncounterObject, "re_fTravelDistance");
        else return OBJECT_INVALID;
        }
    // The following two lines allow for a chance of encounter with a precision of up to
    // two decimal places.  ie. 100.00.  An encounter can have as little as a 0.01 chance
    // of occuring.
    int iHappens = Random(10000)+1;
    int iChanceOfEncounter = FloatToInt(fChanceOfEncounter * 100);
    if(iChanceOfEncounter < iHappens)
        {
        return OBJECT_INVALID;
        }
    //Are encounters disabled for this player?
    if(GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oEncounterObject)))
        {
        return OBJECT_INVALID;
        }
    //Are random encounters disabled altogether?
    if(GetLocalInt(GetModule(), "re_disable"))
        {
        return OBJECT_INVALID;
        }
    //Is the player in combat with bConflict equal to false?
    object oHolder;
    int iCounter7 = 1; // Used in checking for nearby enemies.
    if(GetLocalInt(oEncounterObject, "re_bInitialized")) oHolder = oEncounterObject;
    else if(GetLocalInt(GetArea(oEncounterObject), "re_bInitialized")) oHolder = GetArea(oEncounterObject);
    else oHolder = GetModule();
    int bConflict = GetLocalInt(oHolder, "re_bConflict");
    if(!bConflict && GetIsPC(oEncounterObject))
        {
        if(GetIsInCombat(oEncounterObject)) return OBJECT_INVALID;
        object oNearest = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oEncounterObject, iCounter7);
        while(GetIsObjectValid(oNearest) && GetDistanceToObject(oNearest) < 35.0)
            {
            if(GetIsEnemy(oNearest) && (GetIsInCombat(oNearest) || GetObjectSeen(oNearest))) return OBJECT_INVALID;
            iCounter7++;
            oNearest = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oEncounterObject, iCounter7);
            }
        }
    //Are any nearby party members in a conversation?
    object oAmIAPC;
    oAmIAPC = GetFirstObjectInShape(SHAPE_SPHERE, 35.0, GetLocation(oEncounterObject), FALSE, OBJECT_TYPE_CREATURE);
    if(GetIsObjectValid(oAmIAPC))
        {
        while(GetIsObjectValid(oAmIAPC))
            {
            if(GetIsPC(oAmIAPC))
                {
                if(GetFactionEqual(oEncounterObject, oAmIAPC))
                    {
                    if(IsInConversation(oAmIAPC))
                        {
                        return OBJECT_INVALID;
                        }
                    }
                }
            oAmIAPC = GetNextObjectInShape(SHAPE_SPHERE, 25.0, GetLocation(oEncounterObject), FALSE, OBJECT_TYPE_CREATURE);
            }
        }

// DECLARE AND INITIALIZE VARIABLES
    object oMod = GetModule();
    int iMph;
    if(!iDifficulty) iDifficulty = GetLocalInt(oHolder, "re_iDifficulty");
    int bConsiderCR = GetLocalInt(oHolder, "re_bConsiderCR");
    if(GetStringLowerCase(sTemplate) == "random") sTemplate = GetLocalString(GetModule(), "re_sCreatureTable");
    int iLifeTime = GetLocalInt(oHolder, "re_iLifeTime");
    if(!GetLocalInt(oHolder, "re_iMph")) iMph = 2;
    else iMph = GetLocalInt(oHolder, "re_iMph");
    int bLOSCheck = GetLocalInt(oHolder, "re_bLOSCheck");
    int iEncounterType = GetLocalInt(oHolder, "re_iEncounterType");
    int iCounter1 = 1; // Used to count the creatures when spawning them.
    int iCounter2 = 1; // Used in loop to set difficulty level.
    int iCounter3 = 1; // Used in loop to check line of sight float fEncounterDistance (future use!).
    int iCounter4;// Used in determining the PC to spawn the encounter if the encounter object passed is an area or the module.
    int iCounter5; // Used in determining treasure table.
    int iCounter6; // Used in giving treasure.
    int iNumberOfCreatures;
    int iEncounterDistance;
    int iFacingSameWay;
    int iLevels;
    int iTableNumber;
    int bNumberByLevel = FALSE;
    int bNoEncounter = FALSE;
    int bComplete1 = FALSE;
    int bComplete2 = FALSE;
    int bTreasure;
    float fMinCR;
    float fMaxCR;
    float fEncounterDistance;
    float fNewEncounterDistance;
    float fCreatureFacing;
    float fEncounterAngle;
    float fEncounterVector;
    float fAngleOffset;
    float fLevels;
    float fDifficulty = 0.167;
    string sBuild;
    string sTreasure = sTemplate;
    vector vEncounterVector;
    vector vVectorOffset;
    vector vCreatureVector;
    object oObject;
    object oCreature;
    object oArea;
    if(oEncounterObject == GetModule())
        {
        oAmIAPC = GetFirstPC();
        while(GetIsObjectValid(oAmIAPC))
            {
            if(!GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oAmIAPC)))
                {
                SetLocalObject(oMod, "re_oEncounterObject" + IntToString(iCounter4), oAmIAPC);
                iCounter4++;
                }
            oAmIAPC = GetNextPC();
            }
        oEncounterObject = GetLocalObject(oMod, "re_oEncounterObject" + IntToString(Random(iCounter4)));
        }
    else if(GetObjectType(oEncounterObject) == 0 && oEncounterObject != GetModule())
        {
        oArea = oEncounterObject;
        oAmIAPC = GetFirstObjectInArea(oArea);
        while(GetIsObjectValid(oAmIAPC))
            {
            if(GetIsPC(oAmIAPC) && !GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oAmIAPC)))
                {
                SetLocalObject(oArea, "re_oEncounterObject" + IntToString(iCounter4), oAmIAPC);
                iCounter4++;
                }
            oAmIAPC = GetNextObjectInArea(oArea);
            }
        oEncounterObject = GetLocalObject(oArea, "re_oEncounterObject" + IntToString(Random(iCounter4)));
        }
    else
        {
        oArea = GetArea(oEncounterObject);
        }
    if(!GetIsPC(oEncounterObject))
        iEncounterType = ENCOUNTER_TYPE_AREA;
    location lCreatureLocation;
    vector vEncounterObjectVector = GetPosition(oEncounterObject);
    int iMin = 60;
    int iHr = iMin * iMph;
    int iDay = iHr * 24;
    int iMth = iDay * 28;
    int iYr = iMth * 12;
    if(iDifficulty > 10)
        {
        iDifficulty = 10;
        }
    if(iDifficulty == 0)
        {
        iDifficulty = GetGameDifficulty() * 2;
        }
    while(iCounter2 <= iDifficulty)
        {
        fDifficulty = fDifficulty * 1.5;
        iCounter2++;
        }

// ERROR CORRECTION
    if(iMaxNumberOfCreatures < iMinNumberOfCreatures)
        {
        iMaxNumberOfCreatures = iMinNumberOfCreatures;
        }
    if(iMaxEncounterDistance < iMinEncounterDistance)
        {
        iMaxEncounterDistance = iMinEncounterDistance;
        }
    if(!GetIsPC(oEncounterObject))
        {
        iEncounterType = ENCOUNTER_TYPE_AREA;
        }

// CHECK TO SEE IF PC IS RESTING VIA THE BESIE "re_onrest" SCRIPT AND IF SO
// REMOVE RESTING EFFECTS.
    if(GetIsPC(oEncounterObject) && GetLocalInt(oEncounterObject, "re_resting"))
        {
        DeleteLocalInt(oEncounterObject, "re_resting");
        effect eEffect = GetFirstEffect(oEncounterObject);
        while(GetIsEffectValid(eEffect))
            {
            if(GetEffectType(eEffect) == EFFECT_TYPE_BLINDNESS && GetEffectCreator(eEffect) == GetModule()) RemoveEffect(oEncounterObject, eEffect);
            if(GetEffectType(eEffect) == VFX_IMP_SLEEP && GetEffectCreator(eEffect) == GetModule()) RemoveEffect(oEncounterObject, eEffect);
            eEffect = GetNextEffect(oEncounterObject);
            }
        }

// DETERMINE THE ANGLE OFFSET OF THE SPAWN
    if(iOrientation == 360)
        {
        fEncounterAngle = IntToFloat(Random(360));
        }
    else
        {
        fEncounterAngle = GetFacingFromLocation(GetLocation(oEncounterObject)) + IntToFloat(iOrientation);
        fEncounterAngle = (fEncounterAngle + (IntToFloat(iTolerance) * 0.5)) - (IntToFloat(Random(iTolerance)));
        }

// DETERMINE THE DISTANCE FROM THE SPAWNING OBJECT
    if(iMinEncounterDistance == 0)
        {
        iMinEncounterDistance = iMaxEncounterDistance;
        fEncounterDistance = IntToFloat(iMaxEncounterDistance);
        }
    else
        {
        fEncounterDistance = IntToFloat(iMinEncounterDistance + Random((iMaxEncounterDistance - iMinEncounterDistance) + 1));
        }
    iEncounterDistance = FloatToInt(fEncounterDistance);

// DETERMINE THE FACING OF THE SPAWN
    if(GetLocalInt(oEncounterObject, "re_Facing"))
        {
        fCreatureFacing = fEncounterAngle + 180.0;
        iFacingSameWay = TRUE;
        DeleteLocalInt(oEncounterObject, "re_Facing");
        }
    else
        {
        fCreatureFacing = IntToFloat(Random(360));
        iFacingSameWay = Random(2); // Note: If there is more than one creature there is a 50% chance they will all be facing the same direction
        }

// DETERMINE TOTAL CHARACTER LEVELS TO CONSIDER WHEN CHOOSING A CREATURE
// AND/OR DETERMINING THE NUMBER OF CREATURES TO SPAWN.
    // If the variable iEncounterType is AREA, this routine
    // determines the total character levels
    // based upon the character levels of all PCs
    // in a 20 meter radius around the object that spawned
    // the encounter.
    // Later on the total character levels will be compared to
    // the challenge rating of the creature spawned, and a number
    // of creatures will be determined from that comparison.
    if(iEncounterType == ENCOUNTER_TYPE_AREA)
        {
        oAmIAPC = GetFirstObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oEncounterObject), FALSE, OBJECT_TYPE_CREATURE);
        while(GetIsObjectValid(oAmIAPC))
            {
            if(GetIsPC(oAmIAPC))
                {
                iLevels = iLevels + GetLevelByPosition(1, oAmIAPC) + GetLevelByPosition(2, oAmIAPC) + GetLevelByPosition(3, oAmIAPC);
                if(GetIsObjectValid(GetHenchman(oAmIAPC)))
                    {
                    iLevels = iLevels + GetLevelByPosition(1, GetHenchman(oAmIAPC)) + GetLevelByPosition(2, GetHenchman(oAmIAPC)) + GetLevelByPosition(3, GetHenchman(oAmIAPC));
                    }
                }
            oAmIAPC = GetNextObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oEncounterObject), FALSE, OBJECT_TYPE_CREATURE);
            }
        }
    else if(iEncounterType == ENCOUNTER_TYPE_PARTY)
        {
        iLevels = GetFactionAverageLevel(oEncounterObject);
        }
    else if(iEncounterType == ENCOUNTER_TYPE_TOTALPARTYLEVELS)
        {
        oObject = GetFirstFactionMember(oEncounterObject);
        while(GetIsObjectValid(oObject))
            {
            if(GetArea(oObject) == GetArea(oEncounterObject))
                {
                iLevels = iLevels + GetLevelByPosition(1, oObject) + GetLevelByPosition(2, oObject) + GetLevelByPosition(3, oObject);
                }
            oObject = GetNextFactionMember(oEncounterObject);
            }
        }
    else
        {
        // If the variable iEncounterType is set to IND, this
        // routine determines the total character levels based upon the
        // character level of the object that spawned the encounter.
        // if the object that spawned the encounter is NOT a PC then
        // the number of creatures spawned will be one.  This shouldn't
        // happen since the the encounter type sets itself to AREA if
        // the encounter object is a placeable.
        if(GetIsPC(oEncounterObject))
            {
            iLevels = GetLevelByPosition(1, oEncounterObject) + GetLevelByPosition(2, oEncounterObject) + GetLevelByPosition(3, oEncounterObject);
            }
        }
    // Modify the float representing the total levels by the difficulty level.
    if(iLevelOverride)
        {
        iLevels = iLevelOverride;
        }
    fLevels = IntToFloat(iLevels) * fDifficulty;

// CHOOSE A CREATURE TO SPAWN
    if(GetStringLowerCase(sTemplate) == "random" || GetStringLowerCase(GetStringLeft(sTemplate, 3)) == "re_")
        {
        if(GetStringLowerCase(GetStringLeft(sTemplate, 3)) == "re_")
            {
            sTemplate = GetStringRight(sTemplate, GetStringLength(sTemplate) - 3);
            }
        if(fLevels < 0.25)
            {
            fMaxCR = 0.25;
            }
        else
            {
            fMaxCR = fLevels;
            }
        fMinCR = IntToFloat(FloatToInt(fMaxCR * 0.3));
        //If there is a definative number of creatures to spawn passed to
        //the RandomEncounter function when it is called, then do not
        //allow as much play in the low end, and a little more in the
        // high end challange ratings.
        if(iMinNumberOfCreatures == 0 && iMaxNumberOfCreatures > 1)
        {
        fMinCR = IntToFloat(FloatToInt(fMaxCR * 0.4));
        fMaxCR = fMaxCR * 1.2;
        fMinCR = IntToFloat(FloatToInt(fMinCR));
        }
        if(iMinNumberOfCreatures == 0 && iMaxNumberOfCreatures == 1)
        {
        fMinCR = IntToFloat(FloatToInt(fMaxCR * 0.6));
        fMaxCR = fMaxCR * 1.2;
        fMinCR = IntToFloat(FloatToInt(fMinCR));// Round off the CR.
        }
        if(GetLocalInt(oHolder, "re_bConsiderCR") == FALSE)
            {
            fMaxCR = 9999.0;
            fMinCR = 0.0;
            }
        sTemplate = GetRndEncCreature(fMinCR, fMaxCR, sTemplate);
        if(sTemplate == "") return OBJECT_INVALID;
        }

// DETERMINE IF CREATURE IS TO HAVE TREASURE AND WHAT TABLES TO USE
        if(GetLocalString(oMod, "re_s2DATreasure") != "")
            {
            sTreasure = GetLocalString(oMod, "re_s2DATreasure");
            DeleteLocalString(oMod, "re_s2DATreasure");
            }
        for(iCounter5 = 0; iCounter5 <= GetStringLength(sTreasure); iCounter5++)
        {
        if(bTreasure
        && (GetSubString(sTreasure, iCounter5, 1) == "0" || StringToInt(GetSubString(sTreasure, iCounter5, 1)) > 0))
            {
            sBuild = sBuild + GetSubString(sTreasure, iCounter5, 1);
            }
        else if(bTreasure)
            {
            iTableNumber++;
            SetLocalString(OBJECT_SELF, "re_sTreasureTable" + IntToString(iTableNumber), sBuild);
            bTreasure = FALSE;
            sBuild = "";
            }
        if(GetStringLowerCase(GetSubString(sTreasure, iCounter5, 1)) == "t")
            {
            bTreasure = TRUE;
            }
        }

// DETERMINE LOCATION AND SPAWN ONE CREATURE
    // NOTE: Line Of Sight checks have a bug.  Bioware says they are looking
    // into the bug.  I have spent an ungodly amount of hours trying to come
    // up with an acceptable work-around to the Line Of Sight functionality
    // of Get**ObjectInShape().  Unless somebody else can come up with a working
    // LOS check, I have no choice but to disregard LOS checks until they are
    // fixed.
    //
    // if(LOSCheck = TRUE)
    //     {
    //     <LOS code goes here>
    //     }
    //
    // note: one creature is spawned in now so its challange rating can be
    // used to determine if more are needed. (if that option is set)
        vEncounterVector = AngleToVector(fEncounterAngle);
        vVectorOffset = vEncounterVector * fEncounterDistance;
        vCreatureVector = vEncounterObjectVector + vVectorOffset;
        lCreatureLocation = Location(oArea, vCreatureVector, fCreatureFacing);
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lCreatureLocation, FALSE);

// VERIFY THE RESREF OF THE SPAWNED CREATURE AGAINST THE TEMPLATE AND RETURN AN ERROR IF THEY DO NOT MATCH
        if(GetStringLowerCase(GetResRef(oCreature)) != GetStringLowerCase(sTemplate))
            {
            string sError = "BESIE Error: " + sTemplate + " does not match the blueprint of a valid creature object!";
            DestroyObject(oCreature);
            if(GetIsPC(oEncounterObject)) SendMessageToPC(oEncounterObject, sError);
            else
                {
                object oPC = GetFirstPC();
                while(GetIsObjectValid(oPC))
                    {
                    if(GetArea(oPC) == GetArea(oEncounterObject)) SendMessageToPC(oPC, sError);
                    oPC = GetNextPC();
                    }
                }
            SendMessageToAllDMs(sError);
            WriteTimestampedLogEntry(sError);
            return OBJECT_INVALID;
            }

// DETERMINE THE NUMBER OF ADDITIONAL CREATURES TO SPAWN.
    // If the min and max number of creatures in the function call are zero
    // then get the min and max number from the local variables in the module
    // object.
    if(iMinNumberOfCreatures == 0 && iMaxNumberOfCreatures == 0)
        {
        iMinNumberOfCreatures = GetLocalInt(oMod, "re_iMinNumberOfCreatures");
        iMaxNumberOfCreatures = GetLocalInt(oMod, "re_iMaxNumberOfCreatures");
        }
    // Now that we are done with these local integers, we need to clean reset
    // them to their defaults so we don't accidentally use old numbers later.
    SetLocalInt(oMod, "re_iMinNumberOfCreatures", 0);
    SetLocalInt(oMod, "re_iMaxNumberOfCreatures", 0);
    if(iMinNumberOfCreatures == 0 && iMaxNumberOfCreatures != 0)
        {
        iNumberOfCreatures = iMaxNumberOfCreatures;
        }
    if(iMinNumberOfCreatures != 0 && iMaxNumberOfCreatures != 0)
        {
        iNumberOfCreatures = iMinNumberOfCreatures + Random((iMaxNumberOfCreatures - iMinNumberOfCreatures) + 1);
        }
    if(iMinNumberOfCreatures == 0 && iMaxNumberOfCreatures == 0)
        {
        // This is the routine that sets the number of creatures to spawn
        // based on their challenge rating and the total character levels.
        // It chooses a random number between one half (truncated) and 120
        // percent (1 for every 4) of the number of creatures ideal for the
        // difficulty level set.
        iMaxNumberOfCreatures = FloatToInt(fLevels / GetChallengeRating(oCreature));
        iMinNumberOfCreatures = FloatToInt(IntToFloat(iMaxNumberOfCreatures) * 0.5);
        iMaxNumberOfCreatures = FloatToInt(IntToFloat(iMaxNumberOfCreatures) * 1.25);

        //These lines were added with the v1.7 release because I noticed a situation where characters of
        //up to level 4 would still spawn orcs, goblins and other < CR1 creatures but they would
        //spawn a rediculous amount of them because of the low CR/LV ratio.  This is just to eliminate
        //that.
        if(iMinNumberOfCreatures > 8) iMinNumberOfCreatures = 8;
        if(iMaxNumberOfCreatures > 9) iMaxNumberOfCreatures = 9;

        iNumberOfCreatures = iMinNumberOfCreatures + Random((iMaxNumberOfCreatures - iMinNumberOfCreatures) + 1);
        if((iNumberOfCreatures < 1) && (iLevels > 0))
            {
            iNumberOfCreatures = 1;
            }
        }

// SPAWN THOSE SUCKERS!
    while(iCounter1 <= iNumberOfCreatures)
        {
        // Stick some labels on the creature for record keeping and reference (future use!)
        SetLocalInt(oCreature, "re_bRandomEncounter", TRUE);
        SetLocalObject(oCreature, "re_oRandomEncounterSpawner", oEncounterObject);
        SetLocalInt(oCreature, "re_iRandomEncounterCounter", 1);
        SetLocalInt(oCreature, "re_iRandomEncounterSpawnTime", (GetCalendarYear() * iYr) + (GetCalendarMonth() * iMth) + (GetCalendarDay()* iDay) + (GetTimeHour()* iHr) + (GetTimeMinute() * iMin) + GetTimeSecond());
        SetLocalInt(oCreature, "re_iRandomEncounterLifeTime", iLifeTime);
        /*-------------------------
        This routine was removed in v1.8 because the standard treasure tables were removed and replaced
        with a routine that simply awards an appropriate amount of coin.
        if(!GetLocalInt(GetModule(), "re_standardtable")
        || (GetLocalInt(GetModule(), "re_standardtable") && iCounter1 < 4))
        // The preceding if statement looks for a local variable set by the
        // standard treasure table included with BESIE.  If this variable is
        // set then it halts execution of the treasure script after the first
        // 3 creatures.  This prevents a Too Many Instructions error.
        {
        DeleteLocalInt(GetModule(), "re_standardtable");  //delete standard table int so as not to interfere with custom scripts.
        */
        // Give treasure to the creature if any tables are set.
        for(iCounter6 = 1; iCounter6 <= iTableNumber; iCounter6++)
            {
            ExecuteScript("re_treasure" + GetLocalString(OBJECT_SELF, "re_sTreasureTable" + IntToString(iCounter6)), oCreature);
            }
        //}
        if(iCounter1 < iNumberOfCreatures)
            {
            oCreature = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lCreatureLocation, FALSE);
            }
        iCounter1++;
        // Determine the facing of the next creature
        if(iFacingSameWay == FALSE)
            {
            fCreatureFacing = IntToFloat(Random(360));
            lCreatureLocation = Location(oArea, vCreatureVector, fCreatureFacing);
            }
        }
    // Stick a lable on the spawning object for record keeping and reference (future use?)
    SetLocalObject(oEncounterObject, "re_oLastRandomEncounterSpawned", oCreature);
    return oCreature;
}



void CleanHouse(int bDestroyPlotItems = FALSE, object oArea = OBJECT_SELF, int iSpawnOverride = 0, int iItemOverride = 0, int iBodyBagOverride = 0)
{
// GET THE TIME SCALE FOR THE MODULE
    int iMph;
    if(!GetLocalInt(GetModule(), "re_iMph"))
        {
        iMph = 2;
        }
    else
        {
        iMph = GetLocalInt(GetModule(), "re_iMph");
        }

// DECLARE AND INTIALIZE VARIABLES
    int iMin = 60;
    int iHr = iMin * iMph;
    int iDay = iHr * 24;
    int iMth = iDay * 28;
    int iYr = iMth * 12;
    int bShouldIKillHim = TRUE;
    int iLifeTime;
    int iItemLifeTime;
    int iBodyBagLifeTime;
    int iPresentTime = (GetCalendarYear() * iYr) + (GetCalendarMonth() * iMth) + (GetCalendarDay() * iDay) + (GetTimeHour() * iHr) + (GetTimeMinute() * iMin) + GetTimeSecond();
    object oObject;


// GET EACH OBJECT IN THE AREA AND TEST FOR VALIDITY
    //The following assignment uses a peculiar property of the GetArea() function in that if the GetArea() function
    //is called on an area then the area is returned.  So the oArea parameter of the CleanHouse function can be set
    //to an area or an object within that area and the function will work. (unless and/or until this is changed).
    object oAmIASpawn = GetFirstObjectInArea(GetArea(oArea));
    while(GetIsObjectValid(oAmIASpawn))
        {
        // IS IT A BODY BAG?
        if(GetTag(oAmIASpawn) == "BodyBag" && !GetLocalInt(oAmIASpawn, "re_bDroppedItem"))
            {
            SetLocalInt(oAmIASpawn, "re_bDroppedItem", TRUE);
            SetLocalInt(oAmIASpawn, "re_iDropTime", iPresentTime);
            object oItem = GetFirstItemInInventory(oAmIASpawn);
            while(GetIsObjectValid(oItem))
                {
                if(GetLocalInt(oItem, "bItemForGold")) DestroyObject(oItem);
                oItem = GetNextItemInInventory(oAmIASpawn);
                }
            }
        // IS IT A DROPPED ITEM?
        if(GetLocalInt(oAmIASpawn, "re_bDroppedItem"))
            {
            // HAS IT BEEN AROUND TOO LONG?
            if(iItemOverride)
                {
                iItemLifeTime = iItemOverride;
                }
            else
                {
                iItemLifeTime = 1800;
                }
            if(iBodyBagOverride)
                {
                iBodyBagLifeTime = iBodyBagOverride;
                }
            else
                {
                iBodyBagLifeTime = 300;
                }
            if((iPresentTime - GetLocalInt(oAmIASpawn, "re_iDropTime") > iItemLifeTime && GetTag(oAmIASpawn) != "BodyBag") || (iPresentTime - GetLocalInt(oAmIASpawn, "re_iDropTime") > iBodyBagLifeTime && GetTag(oAmIASpawn) == "BodyBag"))// && !GetPlotFlag(oAmIASpawn))
                {
                if(GetHasInventory(oAmIASpawn))
                    {
                    oObject = GetFirstItemInInventory(oAmIASpawn);
                    while(GetIsObjectValid(oObject))
                        {
                        if(!GetPlotFlag(oObject) || bDestroyPlotItems)
                            {
                            DestroyObject(oObject, 0.0);
                            }
                        oObject = GetNextItemInInventory(oAmIASpawn);
                        }
                    }
                if(!GetPlotFlag(oAmIASpawn) || bDestroyPlotItems)
                    {
                    DestroyObject(oAmIASpawn, 0.0);
                    }
                }
            }
        // IS HE IS A RANDOM ENCOUNTER?
        if(GetLocalInt(oAmIASpawn, "re_bRandomEncounter"))
            {
            // HAS HE BEEN AROUND TOO LONG?
            if(iSpawnOverride)
                {
                iLifeTime = iSpawnOverride;
                }
            else
                {
                iLifeTime = GetLocalInt(oAmIASpawn, "re_iRandomEncounterLifeTime");
                }
            if(iPresentTime - GetLocalInt(oAmIASpawn, "re_iRandomEncounterSpawnTime") > iLifeTime)
                {
                // IS HE IN COMBAT?
                if(!GetIsInCombat(oAmIASpawn))
                    {
                    // GET EACH PC AND TEST IF THE CREATURE SEES HIM
                    // Note: this is because the creature might be charmed
                    // or influenced not to attack the PCs by other means.
                    object oPC = GetFirstPC();
                    if(GetIsObjectValid(oPC))
                        {
                        while(GetIsObjectValid(oPC))
                            {
                            if(GetObjectSeen(oPC, oAmIASpawn))
                                {
                                bShouldIKillHim = FALSE;
                                }
                            oPC = GetNextPC();
                            }
                        }
                    // IF THE CREATURE HAS PASSED ALL OF THESE CHECKS, DESTROY HIM.
                    if(bShouldIKillHim)
                        {
                        if(!GetIsPC(oAmIASpawn)) //This is prevent despawning of creatures while possessed by a DM.
                            {
                            DestroyObject(oAmIASpawn, 0.0);
                            }
                        }
                    }
                }
            }
        oAmIASpawn = GetNextObjectInArea(oArea);
        }
}

//GET TIME IN SECONDS FUNCTION
int GetTimeInSeconds(int iMph = 2)
{
    if(!iMph) iMph = GetLocalInt(GetModule(), "re_iMph");
    int iMin = 60;
    int iHr = iMin * iMph;
    int iDay = iHr * 24;
    int iMth = iDay * 28;
    int iYr = iMth * 12;
    int iPresentTime = (GetCalendarYear() * iYr) + (GetCalendarMonth() * iMth) + (GetCalendarDay() * iDay) + (GetTimeHour() * iHr) + (GetTimeMinute() * iMin) + GetTimeSecond();
    return iPresentTime;
}

location RandomWalk2(location lCenter, int iDistance = 20, object oCreature = OBJECT_SELF)
{
    vector vVector;
    vector vVectorOffset;
    vector vFinalVector;
    location lLocation;
    object oArea = GetAreaFromLocation(lCenter);
    object oWaypoint;
    int nLocationValid = 0;
    float fDistanceToDoor;
    object oDoor;
    // determine location of invisible object to be used as target of ActionMoveToLocation command
    // if object is too near a door, location will be changed
    while (nLocationValid != 1)
       {
       // determine random location of invisible object to be placed as target of walk command
       float fAngle = IntToFloat(Random(360));
       float fDistance = IntToFloat(Random(iDistance) + 1);
       vVector = AngleToVector(fAngle);
       vVectorOffset = vVector * fDistance;
       vFinalVector = GetPositionFromLocation(lCenter) + vVectorOffset;
       lLocation = Location(oArea, vFinalVector, fAngle);
       // check distance for nearest door, set LocationValid flag if beyond 1 meter
       oWaypoint = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lLocation);
       oDoor = GetNearestObject(OBJECT_TYPE_DOOR, oWaypoint);
       fDistanceToDoor = GetDistanceBetween (oWaypoint, oDoor);
       if (fDistanceToDoor > 1.0)
          nLocationValid = 1; // terminates loop with current oWaypoint if door further away than 1 meter
       }
    lLocation = GetLocation(oWaypoint);
    AssignCommand(oCreature, ActionDoCommand(ActionMoveToLocation(lLocation)));
    DestroyObject(oWaypoint);
    return lLocation;
}
