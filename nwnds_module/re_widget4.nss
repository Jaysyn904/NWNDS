int StartingConditional()
{
    int iResult;
    int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex") + 1;
    iResult = iCounter <= GetLocalInt(GetModule(), "re_iAreaTool");
    return iResult;
}
