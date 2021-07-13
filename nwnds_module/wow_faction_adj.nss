// The delay for 2DA reads, change as needed.
const float DELAY_2DA = 0.3;

// The delay between switching factions, change as needed.
const float DELAY_FACTION = 0.3;

// Row is how self feels about column
int wow_GetCurrentWorkingFaction();
void wow_SetCurrentWorkingFaction(int nFaction);
int wow_GetIsBusy();
void wow_SetIsBusy(int nBusy = TRUE);
void wow_ResetFactions(int nRun = 1);
int wow_GetMaxFactions();
void wow_SetUpFaction(int nFaction = 1, int nRun = 0);
int wow_GetIsFactionSetUp(int nFaction);
void wow_ChangeFactionFeelings(int nFaction, int nWorking = 1);

void main()
{
    if(wow_GetIsBusy()) SendMessageToPC(GetLastUsedBy(), "Factions are currently being reset already.");
    else
    {
        SendMessageToAllDMs("Resetting factions now.  This will take a few moments");
        wow_SetIsBusy();
        wow_ResetFactions();
    }
}

void MessagePC(string sMessage)
{
    SendMessageToPC(GetFirstPC(), sMessage);
}

void wow_ChangeFactionFeelings(int nFaction, int nWorking = 1)
{
    int nMax = wow_GetMaxFactions();
    if(nWorking <= nMax)
    {
        string sSourceTag = GetLocalString(OBJECT_SELF, "FACTION"+IntToString(nFaction));
        string sTargetTag = GetLocalString(OBJECT_SELF, "FACTION"+IntToString(nWorking));
        object oSource = GetObjectByTag(sSourceTag);
        object oTarget = GetObjectByTag(sTargetTag);
        object oTemp = GetFirstFactionMember(oSource, FALSE);
        string sTrue = sSourceTag+"_"+IntToString(nWorking);
        int nTrueFeelings = GetLocalInt(OBJECT_SELF, sTrue);
        int nCurrentFeelings;
        while(GetIsObjectValid(oTemp))
        {
            nCurrentFeelings = GetReputation(oTemp, oTarget);

            if(nCurrentFeelings != nTrueFeelings) AdjustReputation(oTemp, oTarget, (nTrueFeelings - nCurrentFeelings));
            oTemp = GetNextFactionMember(oSource, FALSE);
        }
        nWorking++;
        DelayCommand(DELAY_FACTION, wow_ChangeFactionFeelings(nFaction, nWorking));
    }
    else
    {
        nFaction++;
        DelayCommand(DELAY_FACTION, wow_ResetFactions(nFaction));
    }
}

void wow_ResetFactions(int nRun = 1)
{
    int nMax = wow_GetMaxFactions();
    if(nRun <= nMax)
    {
        if(!wow_GetIsFactionSetUp(nRun))
        {
            wow_SetUpFaction();
        }
        else wow_ChangeFactionFeelings(nRun);
    }
    else
    {
        SendMessageToAllDMs("Factions are now reset.");
        wow_SetIsBusy(FALSE);
    }
}

void wow_SetUpFaction(int nFaction = 1, int nRun = 0)
{
    string sFaction = GetLocalString(OBJECT_SELF, "FACTION"+IntToString(nFaction));
    int nMax = wow_GetMaxFactions();

    if(nRun > 0)
    {
        string sTemp = Get2DAString("athas_factions", "Faction"+IntToString(nRun), nFaction);
        SetLocalInt(OBJECT_SELF, sFaction+"_"+IntToString(nRun), StringToInt(sTemp));
    }
    else
    {
        sFaction = Get2DAString("athas_factions", "FactionTag", nFaction);
        SetLocalString(OBJECT_SELF, "FACTION"+IntToString(nFaction), sFaction);
    }
    nRun++;
    if(nRun <= nMax)
    {
        DelayCommand(DELAY_2DA, wow_SetUpFaction(nFaction, nRun));
    }
    else
    {
        nFaction++;
        if(nFaction <= nMax) DelayCommand(DELAY_FACTION, wow_SetUpFaction(nFaction, 0));
        else DelayCommand(DELAY_2DA, wow_ResetFactions(1));
    }
}

int wow_GetIsFactionSetUp(int nFaction)
{
    if(GetLocalString(OBJECT_SELF, "FACTION"+IntToString(nFaction)) != "") return TRUE;
    else return FALSE;
}

int wow_GetMaxFactions()
{
    int nReturn = GetLocalInt(OBJECT_SELF, "MAX_FACTIONS");
    if(!nReturn)
    {
        nReturn = StringToInt(Get2DAString("athas_factions", "NumberOfFactions", 0));
        SetLocalInt(OBJECT_SELF, "MAX_FACTIONS", nReturn);
    }
    return nReturn;
}

void wow_SetIsBusy(int nBusy = TRUE)
{
    SetLocalInt(OBJECT_SELF, "BUSY", nBusy);
}

int wow_GetIsBusy()
{
    return GetLocalInt(OBJECT_SELF, "BUSY");
}

int wow_GetCurrentWorkingFaction()
{
    return GetLocalInt(OBJECT_SELF, "CURRENT_FACTION");
}

void wow_SetCurrentWorkingFaction(int nFaction)
{
    SetLocalInt(OBJECT_SELF, "CURRENT_FACTION", nFaction);
}


