void main()
{
TakeGoldFromCreature(50, GetPCSpeaker(), TRUE);

object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_SANDSTONEROOM");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
