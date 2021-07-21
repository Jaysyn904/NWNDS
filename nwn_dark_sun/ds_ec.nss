void main()
{
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
if (GetTimeHour() > 19 || GetTimeHour() < 7)
{
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_ECAWAY"))));
DelayCommand(4.8, FloatingTextStringOnCreature("The Elven Caravan has left, leaving the Oasis at the mercy of the desert inhabitants.", oPC, FALSE));
}
}
