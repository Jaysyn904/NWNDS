int StartingConditional()
{
    int iResult;
    int iCounter = GetLocalInt(GetModule(), "re_AreaToolIndex");
    object oObject = GetLocalObject(GetModule(), "re_oAreaTool" + IntToString(iCounter));
    iResult = GetLocalInt(oObject, "re_disable");
    return iResult;
}
