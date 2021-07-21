int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "jt_forbiddentomb") == 6))
        return FALSE;

    return TRUE;
}
