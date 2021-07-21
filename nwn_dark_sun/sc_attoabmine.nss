void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("wp_abmine02");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));

}
