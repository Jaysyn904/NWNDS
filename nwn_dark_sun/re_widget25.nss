int StartingConditional()
{
    string sToken;
    sToken = "\nBESIE is currently ";
    if(GetLocalInt(GetModule(), "re_disable")) sToken = sToken + "disabled";
    else sToken = sToken + "enabled";
    SetCustomToken(2112, sToken);
    return TRUE;
}
