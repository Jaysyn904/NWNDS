void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(GetEnteringObject(),"NW_JOURNAL_ENTRY"  + "jt_unearthed") == 1)
    {
        AssignCommand(GetEnteringObject(),SpeakOneLinerConversation("cv_coldyintakatt"));
    }
}

