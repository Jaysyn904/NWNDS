//::///////////////////////////////////////////////
//:: FileName at_attopcdocks
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/6/2002 5:12:08 PM
//:://////////////////////////////////////////////
void main()
{

    // Remove some gold from the player
    TakeGoldFromCreature(500, GetPCSpeaker(), TRUE);

object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_PCDOCKS");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
