void main()
{
TakeGoldFromCreature(100, GetPCSpeaker(), TRUE);

object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_KLEDINNROOM");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
