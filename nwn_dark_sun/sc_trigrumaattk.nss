void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_bloodletter") == 2)
    {
        AssignCommand(GetNearestObjectByTag("AR_RUMAGON"),SpeakOneLinerConversation());
    }
}
