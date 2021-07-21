void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "rottedparchment") == 1)
    {
        AssignCommand(GetNearestObjectByTag("SLIG001"),SpeakOneLinerConversation());
    }
}
