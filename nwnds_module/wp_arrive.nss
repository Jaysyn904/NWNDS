void main()
{
    object oPC = GetLastUsedBy();
    object oDest = GetObjectByTag("wp_arrive_02");
    AssignCommand(oPC, JumpToObject(oDest));

}
