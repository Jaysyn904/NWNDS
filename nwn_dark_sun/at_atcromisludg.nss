void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_thecircle") == 6)
    {
     object oPC = GetEnteringObject();
     object oWayPoint = GetWaypointByTag("WP_CROMISLUDG");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
    }
}
