int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "jt_forbiddentomb") == 4))
        return FALSE;

    return TRUE;
}
