int StartingConditional()
{
    int iResult;
    iResult = !GetLocalInt(GetModule(), "re_disable");
    return iResult;
}

