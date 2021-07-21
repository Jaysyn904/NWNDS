int StartingConditional()
{

    // Restrict based on the player's alignment
    if(GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_EVIL)
        return TRUE;

    return FALSE;
}
