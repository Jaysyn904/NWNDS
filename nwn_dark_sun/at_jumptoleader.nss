void main()
{
object oPC = GetPCSpeaker();
    object oWayPoint = GetFactionLeader(oPC);
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
}
