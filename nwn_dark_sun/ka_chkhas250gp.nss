int StartingConditional()
{
    if(GetGold(GetPCSpeaker()) < 250)
        return FALSE;
    return TRUE;
}
