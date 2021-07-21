int StartingConditional()
{
    if(GetGold(GetPCSpeaker()) < 10000)
        return FALSE;
    return TRUE;
}
