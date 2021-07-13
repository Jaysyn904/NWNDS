//::///////////////////////////////////////////////
//:: FileName ds_giveclockmap
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/14/02 7:08:33 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker the items
        SetLocalInt(GetPCSpeaker(), "nClock", 10);
    CreateItemOnObject("mapofclockwork", GetPCSpeaker(), 1);
    CreateItemOnObject("helmofthemind", GetPCSpeaker(), 1);
    RemoveJournalQuestEntry("glyph1",GetPCSpeaker());
    RemoveJournalQuestEntry("glyph2",GetPCSpeaker());
    RemoveJournalQuestEntry("glyph3",GetPCSpeaker());
    RemoveJournalQuestEntry("glyph4",GetPCSpeaker());
    RemoveJournalQuestEntry("glyph5",GetPCSpeaker());
    RemoveJournalQuestEntry("glyph6",GetPCSpeaker());
}
