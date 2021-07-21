void main()
{
DelayCommand(20.0,ActionCloseDoor(OBJECT_SELF));
string sDoor = GetTag(OBJECT_SELF);
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
string sWP = GetLocalString(oPC, sDoor);
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag(sWP))));

}
