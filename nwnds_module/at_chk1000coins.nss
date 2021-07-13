int StartingConditional()
{
    if(GetGold(GetPCSpeaker()) < 1000)
        return FALSE;
    return TRUE;
}
