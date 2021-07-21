void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "rottedparchment") == 2)
    {
        AssignCommand(GetEnteringObject(),SpeakOneLinerConversation("cv_revspeech2"));
    }
}

