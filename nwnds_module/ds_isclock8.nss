int StartingConditional()
{

    // Inspect local variables
    if((GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph1") == 1) &&
       (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph2") == 1) &&
       (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph3") == 1) &&
       (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph4") == 1) &&
       (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph5") == 1) &&
       (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "glyph6") == 1))
    return TRUE;

    return FALSE;
}
