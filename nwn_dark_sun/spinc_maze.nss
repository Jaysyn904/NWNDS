//:://////////////////////////////////////////////
//:: Maze scripts common functions
//:: spinc_maze
//:://////////////////////////////////////////////
/** @file


    @author Ornedan
    @date   Created - 2005.10.18
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "prc_inc_spells"
#include "prc_inc_teleport"
#include "inc_dynconv"

// Direction constants
const int NORTH = 0x1000;
const int SOUTH = 0x0100;
const int WEST  = 0x0010;
const int EAST  = 0x0001;

// The escape DC. Should always be 20, but changeable for ease of testing
const int MAZE_ESCAPE_DC = 20;

const int LOCAL_DEBUG = FALSE;




/**
 * Debugging function for converting the direction constants to
 * readable strings.
 *
 * @param n One of the direction constants in this file.
 * @return  Name of the constant.
 */
string DebugDir2String(int n)
{
    return (n == NORTH ? "NORTH":
            n == SOUTH ? "SOUTH":
            n == WEST  ? "WEST" :
            n == EAST  ? "EAST" :
            "ERROR"
            );
}

/**
 * Makes the creature move in the direction specified.
 *
 * @param oCreature  The creature to command to move.
 * @param nDirection One of the direction constants in this file.
 */
void GoDirection(object oCreature, int nDirection)
{
    if(LOCAL_DEBUG) DoDebug("GoDirection(): Direction is " + DebugDir2String(nDirection));
    // Generate location for the direction
    location lDir;
    vector v = GetPosition(oCreature);
    if(nDirection == NORTH || nDirection == SOUTH)
    {
        v.y = nDirection == NORTH ? 160.0f : 0.0f;
        lDir = Location(GetArea(oCreature), v, 0.0f);
    }
    else
    {
        v.x = nDirection == EAST ? 160.0f : 0.0f;
        lDir = Location(GetArea(oCreature), v, 0.0f);
    }
    // Generate a location at the center of the trigger
    location lTrigCenter;
    v = GetPosition(OBJECT_SELF);
    v.x = IntToFloat(((FloatToInt(v.x) / 10) * 10) + 5);
    v.y = IntToFloat(((FloatToInt(v.y) / 10) * 10) + 5);
    lTrigCenter = Location(GetArea(oCreature), v, GetFacing(oCreature));

    // Nuke current action and move to the direction
    AssignCommand(oCreature, ClearAllActions());
    AssignCommand(oCreature, ActionMoveToLocation(lTrigCenter));
    AssignCommand(oCreature, ActionMoveToLocation(lDir));
    // Turn the camera
    AssignCommand(oCreature, SetCameraFacing((nDirection == NORTH ? 90.0f  :
                                              nDirection == SOUTH ? 270.0f :
                                              nDirection == WEST  ? 180.0f :
                                                         /*EAST*/  0.0f
                                              ),
                                             -1.0f, -1.0f, CAMERA_TRANSITION_TYPE_FAST)
                  );

    // Store the direction one should not move to from the next junction
    switch(nDirection)
    {
        case NORTH: SetLocalInt(oCreature, "PRC_Maze_Direction", SOUTH); break;
        case SOUTH: SetLocalInt(oCreature, "PRC_Maze_Direction", NORTH); break;
        case WEST:  SetLocalInt(oCreature, "PRC_Maze_Direction", EAST);  break;
        case EAST:  SetLocalInt(oCreature, "PRC_Maze_Direction", WEST);  break;
    }
}

void DoMazeVFX(location lLoc)
{
    DrawSpiral(DURATION_TYPE_INSTANT, VFX_IMP_HEAD_SONIC, lLoc, 1.0, 3.0, 0.0, 60, 2.5, 2.0, 0.0f, "z"/*, GetFacingFromLocation(lLoc)*/);
}

void ReturnFromMaze(object oCreature)
{
    if(LOCAL_DEBUG) DoDebug("ReturnFromMaze() running\noCreature = '" + GetName(oCreature) + "'");
    location lReturn = GetLocalLocation(oCreature, "PRC_Maze_Return_Location");
    AssignCommand(oCreature, ClearAllActions(TRUE));
    DelayCommand(2.0f, AssignCommand(oCreature, JumpToLocation(lReturn)));

    // Do VFX
    DoMazeVFX(GetLocation(oCreature));
}

void MazeEscapeHB(object oCreature, int nCountLeft)
{
    if(LOCAL_DEBUG) DoDebug("MazeEscapeHB() running\n"
                          + "oCreature = '" + GetName(oCreature) + "'\n"
                          + "nCountLeft = " + IntToString(nCountLeft) + "\n"
                            );

    // If the counter has reached zero, ie. full 10 mins have passsed, return is automatic
    if(nCountLeft <= 0)
    {
        if(LOCAL_DEBUG) DoDebug("MazeEscapeHB(): Timer has run out, returning from maze.");
        ReturnFromMaze(oCreature);
        return;
    }

    // If it's a PC that hasn't made it's decision yet, don't run the int check
    if(!GetLocalInt(oCreature, "PRC_Maze_PC_Waiting"))
    {
        if(LOCAL_DEBUG) DoDebug("MazeEscapeHB(): Running Int check.");

        // Int check versus MAZE_ESCAPE_DC to escape
        int nD20    = d20();
        int nIntMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oCreature);
        int bResult = (nD20 + nIntMod) >= MAZE_ESCAPE_DC;

        // Inform the creature of the result
        SendMessageToPC(oCreature, GetRGB(7,7,15) + GetName(oCreature) + "</c>" + //   "Int check"                                       "success"                 "failure"
                                   GetRGB(1,1,15) + " : "  + GetStringByStrRef(16825701) + " : *" + (bResult ? GetStringByStrRef(5352) : GetStringByStrRef(5353)) + "* : (" + IntToString(nD20) + " + " + IntToString(nIntMod) + " = " + IntToString(nD20 + nIntMod) + " vs. DC: " + IntToString(MAZE_ESCAPE_DC) + ")</c>");

        // Return from the maze if the check was successfull
        if(bResult)
        {
            ReturnFromMaze(oCreature);
            return;
        }
    }

    // Schedule next check
    DelayCommand(6.0f, MazeEscapeHB(oCreature, nCountLeft - 1));
}

// Test main
//void main(){}
