int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "LostHeirloom") == 1))
        return FALSE;

    return TRUE;
}
