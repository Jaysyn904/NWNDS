int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "jt_forbiddentomb") == 5))
        return FALSE;

    return TRUE;
}
