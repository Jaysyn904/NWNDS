void main()
{
    object oPlayer = GetLastUsedBy();

    AssignCommand(oPlayer, ClearAllActions());
    AssignCommand(oPlayer, ActionJumpToObject(GetWaypointByTag("cut02way_enter")));
}
