void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_AMBERROOM");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
