void main()
{
    object oPC = GetPCSpeaker();
    DelayCommand(300.0,SetLocalInt(oPC, "KILL_TASK_FLAG", 0));
    DelayCommand(300.0,SetLocalInt(oPC, "DELIVERY_TASK_FLAG", 0));
    RemoveJournalQuestEntry("kt_journal_01", oPC);
    RemoveJournalQuestEntry("kt_journal_02", oPC);
    RemoveJournalQuestEntry("kt_journal_03", oPC);
}
