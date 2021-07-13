void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_thecircle") == 6)
    {
     object oPC = GetEnteringObject();
     object oWayPoint = GetWaypointByTag("WP_CROMWINDBLOW");
    location lLoc = GetLocation(oWayPoint);
    AssignCommand(oPC,JumpToLocation(lLoc));
    AssignCommand(GetEnteringObject(),SpeakOneLinerConversation("cv_cromwindblow"));
    }
}
