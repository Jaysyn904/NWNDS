void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("wp_aboveoldwell");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
