int StartingConditional()
{
    int iResult;
    int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex") - 1;
    iResult = iCounter > 0;
    return iResult;
}

