void main()
{

   AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),ActionJumpToLocation(GetLocation(GetObjectByTag("THEPRIESTS"))));
   DelayCommand(10.0,SetLocked(GetObjectByTag("3BarreltoPriests"),TRUE));
}
