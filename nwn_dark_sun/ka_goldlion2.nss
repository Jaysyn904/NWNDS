void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_GOLDLIONROOM2");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
