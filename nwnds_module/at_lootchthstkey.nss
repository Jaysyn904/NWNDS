int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nLootedCromChest") == 1))
        return FALSE;
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY" + "jt_thecircle") == 3))
        return FALSE;

    return TRUE;
}
