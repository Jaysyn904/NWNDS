int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "jt_gaorgsdebt") == 2))
        return FALSE;

    return TRUE;
}
