void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("wp_coldfire01");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));

}
