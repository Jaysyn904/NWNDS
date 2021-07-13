int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "SageAdvice") == 1))
        return FALSE;

    return TRUE;
}
