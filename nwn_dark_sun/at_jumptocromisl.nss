void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_CROMISLESHIP");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
