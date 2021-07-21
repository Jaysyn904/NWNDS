void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_GOLDENINIXROOM");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
