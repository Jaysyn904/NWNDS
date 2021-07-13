void main()
{
 AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),ActionJumpToLocation(GetLocation(GetObjectByTag("WP_DEADSREVENGE"))));
 DelayCommand(30.0,SetLocked(GetObjectByTag("dt_healerschest"),TRUE));
}
