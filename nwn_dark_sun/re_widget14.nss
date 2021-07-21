int StartingConditional()
{
    int iResult;
    object oTarget = GetItemActivatedTarget();
    iResult = GetIsPC(oTarget) && GetLocalInt(GetModule(), "re_" + GetPCPlayerName(oTarget));
    return iResult;
}
