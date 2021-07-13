void main()
{
DelayCommand(20.0,ActionCloseDoor(OBJECT_SELF));
string sDoor = GetTag(OBJECT_SELF);
int num = Random(9) + 1;
string sExit = "MD"+IntToString(num);
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
string sWP = GetLocalString(oPC, sDoor);
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag(sExit))));
}
