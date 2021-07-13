#include "gen_inc_color"
#include "aps_include"


void wow_Setup()
{
    object oModule = GetModule();
    int nSystem = GetLocalInt(oModule, "WOW_LOADING_SYSTEM");
    int nHour = GetTimeHour();
    int nMinute = GetTimeMinute();
    int nSecond = GetTimeSecond();
    int nMilli = GetTimeMillisecond();
    object oTemp;
    switch(nSystem)
    {
        case 0:
        {
            WriteTimestampedLogEntry("Load time start: "+IntToString(nHour)+":"+IntToString(nMinute)+":"+IntToString(nSecond)+":"+IntToString(nMilli));
            SetLocalInt(oModule, "WOW_LOADING_SYSTEM", 1);
            DelayCommand(0.1, wow_SetUpScoreBoard());
            break;
        }
        case 1:
        {
            SetLocalInt(oModule, "WOW_LOADING_SYSTEM", 2);
            DelayCommand(0.1, wow_SetupForge());
            break;
        }
        case 2:
        {
            SetLocalInt(oModule, "WOW_LOADING_SYSTEM", 3);
            DelayCommand(0.1, wow_SetUpLootableHomes());
            break;
        }
        default:
        {
            WriteTimestampedLogEntry("Load time end: "+IntToString(nHour)+":"+IntToString(nMinute)+":"+IntToString(nSecond)+":"+IntToString(nMilli));
            DeleteLocalInt(oModule, "WOW_LOADING_SYSTEM");
            oTemp = GetFirstPC();

            while(GetIsObjectValid(oTemp))
            {
                if(GetPCPlayerName(oTemp) == "Kyriani Agrivar") SendMessageToPC(oTemp, "All 2DA systems loaded");// Kyriani Agrivar
                oTemp = GetNextPC();
            }
            SendMessageToAllDMs("All 2DA systems loaded");
            break;
        }
    }
}

void wow_SetUpScoreBoard(int nNumber = 0)
{
    object oModule = GetModule();
    if(nNumber == 0) nNumber = 1;
    {
        SetLocalInt(oModule, "nArenaKills" + IntToString(nNumber), GetPersistentInt(oModule, "nArenaKills" + IntToString(nNumber),"ar_dsostats"));
        SetLocalString(oModule, "sArenaKills" + IntToString(nNumber), GetPersistentString(oModule, "sArenaKills" + IntToString(nNumber),"ar_dsostats"));
        SetLocalString(oModule, "sArenaKillsAccount" + IntToString(nNumber), GetPersistentString(oModule, "sArenaKillsAccount" + IntToString(nNumber),"ar_dsostats"));
        SetLocalInt(oModule, "nPlayerKills" + IntToString(nNumber), GetPersistentInt(oModule, "nPlayerKills" + IntToString(nNumber),"ar_dsostats"));
        SetLocalString(oModule, "sPlayerKills" + IntToString(nNumber), GetPersistentString(oModule, "sPlayerKills" + IntToString(nNumber),"ar_dsostats"));
        SetLocalString(oModule, "sPlayerKillsAccount" + IntToString(nNumber), GetPersistentString(oModule, "sPlayerKillsAccount" + IntToString(nNumber),"ar_dsostats"));
    }
    nNumber++;
    if(nNumber <=10) DelayCommand(0.2, wow_SetUpScoreBoard(nNumber));
    else DelayCommand(0.2, wow_Setup());
}

string wow_GetAndReturnColoredText(string sText)
{
    int nRight, nLength;
    int nSub = wow_FindMarker(sText);
    string sLeft, sColor, sNew;
    while(nSub != -1)
    {
        nLength = GetStringLength(sText);
        sNew += GetStringLeft(sText, nSub);
        nRight = nLength - (nSub + 2);
        sText = GetStringRight(sText, nRight);
        nSub = wow_FindMarker(sText);
        if(nSub != -1)
        {
            nLength = GetStringLength(sText);
            sColor = GetStringLeft(sText, nSub);
            nRight = nLength - (nSub + 2);
            sNew += GetTextColor(sColor);
            sText = GetStringRight(sText, nRight);
        }
        nSub = wow_FindMarker(sText);
    }
    if(sNew != "") sNew += sText;
    else sNew = sText;
    return sNew;
}

int wow_FindMarker(string sText)
{
    return FindSubString(sText, "||");
}

int wow_CountMarkers(string sText)
{
    int nSub, nCount, nLength, nRight;
    while(nSub != -1)
    {
        nSub = wow_FindMarker(sText);
        if(nSub != -1)
        {
            nCount++;
            nLength = GetStringLength(sText);
            nRight = nLength - (nSub + 2);
            sText = GetStringRight(sText, nRight);
        }
    }
    return nCount;
}

int wow_FindD(string sText)
{
    return FindSubString(sText, "d");
}

int wow_CountDs(string sText)
{
    int nSub, nCount, nLength, nRight;
    while(nSub != -1)
    {
        nSub = wow_FindD(sText);
        if(nSub != -1)
        {
            nCount++;
            nLength = GetStringLength(sText);
            nRight = nLength - (nSub + 2);
            sText = GetStringRight(sText, nRight);
        }
    }
    return nCount;
}

int wow_RollDice(int nNumber, int nDice)
{
    int nReturn;
    switch(nDice)
    {
        case 2:
        {
            nReturn = d2(nNumber);
            break;
        }
        case 3:
        {
            nReturn = d3(nNumber);
            break;
        }
        case 4:
        {
            nReturn = d4(nNumber);
            break;
        }
        case 6:
        {
            nReturn = d6(nNumber);
            break;
        }
        case 8:
        {
            nReturn = d8(nNumber);
            break;
        }
        case 10:
        {
            nReturn = d10(nNumber);
            break;
        }
        case 12:
        {
            nReturn = d12(nNumber);
            break;
        }
        case 20:
        {
            nReturn = d20(nNumber);
            break;
        }
        case 100:
        {
            nReturn = d100(nNumber);
            break;
        }
    }
    return nReturn;
}

//void main(){}


