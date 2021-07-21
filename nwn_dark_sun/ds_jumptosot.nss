void main()
{
object oUser = GetLastUsedBy();
AssignCommand(oUser,ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_UNDERHILL"))));
}
