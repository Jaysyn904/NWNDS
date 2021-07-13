void main()
{
DelayCommand(20.0,ActionCloseDoor(OBJECT_SELF));
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
int num;
num = Random(9) + 1;
string sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor1", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor2", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor3", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor4", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor5", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor6", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor7", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor8", sExit);
num = Random(9) + 1;
sExit = "MD"+IntToString(num);
SetLocalString(oPC, "MazeDoor9", sExit);
num = Random(9) + 1;
string sDoor = "MazeDoor"+IntToString(num);
SetLocalString(oPC, sDoor, "WPAmuletRoom2");
SetLocalString(oPC, "MazeExit1", "ME2");
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag("MEnt1"))));
}
