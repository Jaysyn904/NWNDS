int StartingConditional()
{
    int iResult;
    object oTarget = GetItemActivatedTarget();
    iResult = GetIsPC(oTarget) && !GetIsDM(oTarget);
    return iResult;
}
