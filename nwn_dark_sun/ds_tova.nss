void main()
{

   AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),ActionJumpToLocation(GetLocation(GetWaypointByTag("TOBHVA"))));
   DelayCommand(10.0,SetLocked(OBJECT_SELF,TRUE));
}
