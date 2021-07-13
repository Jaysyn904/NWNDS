int StartingConditional()
{
    if(GetGold(GetPCSpeaker()) < 25)
        return FALSE;
    return TRUE;
}
