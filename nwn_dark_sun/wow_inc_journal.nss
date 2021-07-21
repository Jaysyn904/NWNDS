// This will return the state of the journal quest.
// sJournalID is the tag of the journal quest to return
// oPlayer is the player to retrieve it from
int GetJournalQuestStatus (string sJournalID, object oPlayer)
{
    return GetLocalInt(oPlayer, "NW_JOURNAL_ENTRY"+sJournalID);
}


