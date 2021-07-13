void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_unearthed") == 1)
    {
        AssignCommand(GetNearestObjectByTag("SALIK001"),SpeakOneLinerConversation());
    }
}
