void main()
{
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
if (GetTimeHour() > 6 && GetTimeHour() < 20)
{
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("WP_EC"))));
DelayCommand(4.8, FloatingTextStringOnCreature("The Elven Caravan has arrived and set up camp at the Oasis.", oPC, FALSE));
}
}
