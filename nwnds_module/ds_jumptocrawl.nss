void main()
{

AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),ActionJumpToLocation(GetLocation(GetObjectByTag("THECRAWL"))));
DelayCommand(10.0,SetLocked(GetObjectByTag("KatjanasCloset"),TRUE));
}
