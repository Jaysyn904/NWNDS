void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_olinasass") == 1)
    {
        AssignCommand(GetNearestObjectByTag("PIRATEASSASSIN"),SpeakOneLinerConversation());
    }
}
