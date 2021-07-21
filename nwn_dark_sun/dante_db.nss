string GetCampaignVariableName(object oPlayer)
{
    string sAccountName = GetPCPlayerName(oPlayer);
    string sCDKey = GetPCPublicCDKey(oPlayer);
    string sName = GetName(oPlayer);
    string sVariable = sCDKey;
    sVariable += IntToString(GetStringLength(sAccountName));
    sVariable += GetStringLeft(sAccountName, 6);
    sVariable += IntToString(GetStringLength(sName));
    sVariable += GetStringLeft(sName, 6);

    return GetStringUpperCase(sVariable);
}

//void main () {}
