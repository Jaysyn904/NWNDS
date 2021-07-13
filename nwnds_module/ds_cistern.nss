void main()
{
AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),ActionJumpToLocation(GetLocation(GetObjectByTag("CISTERN"))));
DelayCommand(5.0,FloatingTextStringOnCreature("There is a Cistern under the bed.",GetLastUsedBy(),FALSE));
}
