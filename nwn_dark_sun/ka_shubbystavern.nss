void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_SHUBBYROOM");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
