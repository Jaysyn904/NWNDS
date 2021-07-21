void main()
{
int nEntryPoint = d8();
string sPoint = "Crimson" + IntToString(nEntryPoint);

object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetObjectByTag(sPoint))));
}
