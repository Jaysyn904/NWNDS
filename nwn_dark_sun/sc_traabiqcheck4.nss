int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY"  + "jt_traabislotus") == 4))
        return FALSE;

    return TRUE;
}

