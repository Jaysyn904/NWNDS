#include "dante_db"
#include "aps_include"

void wow_BountyBoardChange(object oPlayer);
void wow_SetBountyBoardRanking(object oBoard, string sPlayer, string sAccount, int nRank, int nCount, int nIncreaseMax = FALSE);
int wow_GetCurrentBountyRank(object oBountyBoard, int nBountyCount);
object wow_GetBountyObject();
object wow_GetPlayerKiller(object oDead);
void wow_SpamServer(string sMessage);
int wow_BountySC();
void wow_ClearBountyVariables();
void wow_SetBountyPlayers();
void wow_SetBountyTokens();
int wow_GetIsBountyPlayerValid();
void wow_TurnPage(int nForward = TRUE);
void wow_AcceptBounty();
void wow_SetChoice(int nChoice);

void wow_ClearBountyVariables()
{
    int nMax = GetLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS");
    int nNth;
    DeleteLocalInt(OBJECT_SELF, "COUNT");
    DeleteLocalInt(OBJECT_SELF, "PAGE");
    DeleteLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS");
    DeleteLocalInt(OBJECT_SELF, "BOUNTIES_SET");
    DeleteLocalInt(OBJECT_SELF, "CHOICE");

    for(nNth = 1; nNth <= nMax; nNth++)
    {
        DeleteLocalString(OBJECT_SELF, "BOUNTY_PLAYER_TEXT_"+IntToString(nNth));
        DeleteLocalString(OBJECT_SELF, "BOUNTY_PLAYER_VARIABLE_"+IntToString(nNth));
    }
}

int wow_BountySC()
{
    int nReturn;
    int nCount = GetLocalInt(OBJECT_SELF, "COUNT");
    int nPage = GetLocalInt(OBJECT_SELF, "PAGE");

    switch(nCount)
    {
        case 0:
        {
            wow_SetBountyPlayers();
            wow_SetBountyTokens();
            nReturn = TRUE;
            break;
        }
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        {
            nReturn = wow_GetIsBountyPlayerValid();
            break;
        }
        case 11:
        {
            if(GetLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS") > ((nPage + 1) * 10)) nReturn = TRUE;
            break;
        }
        case 12:
        {
            if(nPage > 0) nReturn = TRUE;
            break;
        }
    }
    nCount++;
    if(nCount == 13) DeleteLocalInt(OBJECT_SELF, "COUNT");
    else SetLocalInt(OBJECT_SELF, "COUNT", nCount);
    return nReturn;
}

void wow_SetChoice(int nChoice)
{
    SetLocalInt(OBJECT_SELF, "CHOICE", nChoice);
}

void wow_AcceptBounty()
{
    int nPage = GetLocalInt(OBJECT_SELF, "PAGE");
    int nChoice = GetLocalInt(OBJECT_SELF, "CHOICE");
    string sChoice = GetLocalString(OBJECT_SELF, "BOUNTY_PLAYER_VARIABLE_"+IntToString((nPage * 10) + nChoice));
    SetLocalInt(GetPCSpeaker(), "WOW_BOUNTY_"+sChoice, TRUE);
}

void wow_TurnPage(int nForward = TRUE)
{
    int nPage = GetLocalInt(OBJECT_SELF, "PAGE");
    if(nForward) nPage++;
    else nPage--;
    SetLocalInt(OBJECT_SELF, "PAGE", nPage);
}

void wow_SetBountyPlayers()
{
    if(!GetLocalInt(OBJECT_SELF, "BOUNTIES_SET"))
    {
        SetLocalInt(OBJECT_SELF, "BOUNTIES_SET", TRUE);
        int nCount;
        object oPC = GetFirstPC();
        object oSpeaker = GetPCSpeaker();

        while(GetIsObjectValid(oPC))
        {
            if(GetLocalInt(oPC, "Bounty") > 0 && oPC != oSpeaker)
            {
                nCount++;
                SetLocalString(OBJECT_SELF, "BOUNTY_PLAYER_VARIABLE_"+IntToString(nCount), GetCampaignVariableName(oPC));
                SetLocalString(OBJECT_SELF, "BOUNTY_PLAYER_TEXT_"+IntToString(nCount), GetName(oPC)+", Level: "+IntToString(GetHitDice(oPC))+", Bounty: "+IntToString(GetLocalInt(oPC, "Bounty")));
            }
            oPC = GetNextPC();
        }
        SetLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS", nCount);
    }
}
void wow_SetBountyTokens()
{
    int nMax = GetLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS");
    int nPage = GetLocalInt(OBJECT_SELF, "PAGE");
    int nNth;
    int nToken = 5300;

    for(nNth = 1; nNth <= 10; nNth++)
    {
        if(((nPage * 10) + nNth) <= nMax)
        {
            SetCustomToken((nToken + nNth), GetLocalString(OBJECT_SELF, "BOUNTY_PLAYER_TEXT_"+IntToString((nPage * 10) + nNth)));
        }
    }
}

int wow_GetIsBountyPlayerValid()
{
    int nMax = GetLocalInt(OBJECT_SELF, "BOUNTY_PLAYERS");
    int nPage = GetLocalInt(OBJECT_SELF, "PAGE");
    int nCount = GetLocalInt(OBJECT_SELF, "COUNT");
    int nCurrent = (nPage * 10) + nCurrent;
    if(nCurrent <= nMax) return TRUE;
    else return FALSE;
}

void wow_SpamServer(string sMessage)
{
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC, sMessage);
        oPC = GetNextPC();
    }
}

object wow_GetPlayerKiller(object oDead)
{
    ExecuteScript("wow_playerkiller", oDead);
    object oKiller = GetLocalObject(oDead, "WOW_BOUNTY_BOARD_KILLER");
    object oActor = GetLocalObject(oDead, "WOW_BOUNTY_BOARD_ACTOR");
    DeleteLocalObject(oDead, "WOW_BOUNTY_BOARD_KILLER");
    DeleteLocalObject(oDead, "WOW_BOUNTY_BOARD_ACTOR");
    object oReturn = OBJECT_INVALID;
    int nKillerType = GetObjectType(oKiller);
    int nActorType = GetObjectType(oActor);

    if(GetIsObjectValid(oKiller))
    {
        if(!GetIsPC(oKiller))
        {
            switch(nKillerType)
            {
                case OBJECT_TYPE_AREA_OF_EFFECT:
                {
                    oKiller = GetAreaOfEffectCreator(oKiller);
                    break;
                }
                case OBJECT_TYPE_CREATURE:
                {
                    oKiller = GetMaster(oKiller);
                    break;
                }
                case OBJECT_TYPE_DOOR:
                case OBJECT_TYPE_PLACEABLE:
                case OBJECT_TYPE_TRIGGER:
                {
                    oKiller = GetTrapCreator(oKiller);
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
    }
    if(GetIsObjectValid(oActor))
    {
        if(!GetIsPC(oActor))
        {
            switch(nActorType)
            {
                case OBJECT_TYPE_AREA_OF_EFFECT:
                {
                    oActor = GetAreaOfEffectCreator(oActor);
                    break;
                }
                case OBJECT_TYPE_CREATURE:
                {
                    oActor = GetMaster(oActor);
                    break;
                }
                case OBJECT_TYPE_DOOR:
                case OBJECT_TYPE_PLACEABLE:
                case OBJECT_TYPE_TRIGGER:
                {
                    oActor = GetTrapCreator(oActor);
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
    }
    if(GetIsPC(oKiller) && !GetIsDM(oKiller) && !GetIsDMPossessed(oKiller)) oReturn = oKiller;
    else if(GetIsPC(oActor) && !GetIsDM(oActor) && !GetIsDMPossessed(oActor)) oReturn = oActor;
    else oReturn = GetLastKiller();
    return oReturn;
}

object wow_GetBountyObject()
{
    object oReturn = GetWaypointByTag("WOW_BOUNTY_WP");
    if(!GetIsObjectValid(oReturn))
    {
        SendMessageToPC(GetFirstPC(), "Bounty object not valid");
        oReturn = CreateObject(OBJECT_TYPE_WAYPOINT, "nw_waypoint001", GetStartingLocation(), FALSE, "WOW_BOUNTY_WP");
        int nMax = GetPersistentInt(GetModule(), "WOW_BOUNTY_MAX","ar_dsostats");
        int nNth;
        SetLocalInt(oReturn, "WOW_BOUNTY_MAX", nMax);

        for(nNth = 1; nNth <= nMax; nNth++)
        {
            SetLocalInt(oReturn, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_COUNT", GetPersistentInt(GetModule(), "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_COUNT","ar_dsostats"));
            SetLocalString(oReturn, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_PLAYER", GetPersistentString(GetModule(), "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_PLAYER","ar_dsostats"));
            SetLocalString(oReturn, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_ACCOUNT", GetPersistentString(GetModule(), "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_ACCOUNT","ar_dsostats"));
        }
    }
    else SendMessageToPC(GetFirstPC(), "Bounty object valid");
    return oReturn;
}

int wow_GetCurrentBountyRank(object oBountyBoard, int nBountyCount)
{
    int nMax = GetLocalInt(oBountyBoard, "WOW_BOUNTY_MAX");
    int nRank, nNth;
    for(nNth = 1; nNth <= nMax; nNth++)
    {
        if(!nRank)
        {
            if(nBountyCount > GetLocalInt(oBountyBoard, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_COUNT")) nRank = nNth;
        }
    }
    if(!nRank) nRank = nMax + 1;
    return nRank;
}

void wow_SetBountyBoardRanking(object oBoard, string sPlayer, string sAccount, int nRank, int nCount, int nIncreaseMax = FALSE)
{
    string sRank = IntToString(nRank);
    SetLocalInt(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_COUNT", nCount);
    SetLocalString(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_PLAYER", sPlayer);
    SetLocalString(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_ACCOUNT", sAccount);

    SetPersistentInt(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_COUNT", nCount,0,"ar_dsostats");
    SetPersistentString(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_PLAYER", sPlayer,0,"ar_dsostats");
    SetPersistentString(oBoard, "WOW_BOUNTY_RANK_"+sRank+"_ACCOUNT", sAccount,0,"ar_dsostats");

    if(nIncreaseMax)
    {
        int nMax = GetLocalInt(oBoard, "WOW_BOUNTY_MAX");
        nMax++;
        SetLocalInt(oBoard, "WOW_BOUNTY_MAX", nMax);
        SetPersistentInt(oBoard,"WOW_BOUNTY_MAX", nMax,0,"ar_dsostats");
        //SetCampaignInt("DSOStats", "WOW_BOUNTY_MAX", nMax);
    }
}

void wow_BountyBoardChange(object oPlayer)
{
    object oBoard = wow_GetBountyObject();
    int nMax = GetLocalInt(oBoard, "WOW_BOUNTY_MAX");
    int nPlayerCount = GetLocalInt(oPlayer, "WOW_BOUNTIES_COLLECTED");
    int nRank = wow_GetCurrentBountyRank(oBoard, nPlayerCount);
    int nNth, nCurrentCount, nNextCount, nFound;
    string sCurrentName, sNextName, sCurrentAccount, sNextAccount;
    string sPlayerAccount = GetStringUpperCase(GetPCPlayerName(oPlayer));
    string sPlayerName = GetName(oPlayer);
    sCurrentAccount = sPlayerAccount;
    sCurrentName = sPlayerName;
    nCurrentCount = nPlayerCount;

    if(nRank <= nMax)
    {
        for(nNth = nRank; nNth <= nMax; nNth++)
        {
            // Get the next lower rank
            nNextCount = GetLocalInt(oBoard, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_COUNT");
            sNextName = GetLocalString(oBoard, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_PLAYER");
            sNextAccount = GetLocalString(oBoard, "WOW_BOUNTY_RANK_"+IntToString(nNth)+"_ACCOUNT");

            if(nFound)
            {
                nCurrentCount = nNextCount;
                sCurrentName = sNextName;
                sCurrentAccount = sNextAccount;
                wow_SetBountyBoardRanking(oBoard, sCurrentName, sCurrentAccount, nNth, nCurrentCount);
            }
            else
            {
                wow_SetBountyBoardRanking(oBoard, sCurrentName, sCurrentAccount, nNth, nCurrentCount);
                nCurrentCount = nNextCount;
                sCurrentName = sNextName;
                sCurrentAccount = sNextAccount;
            }
            // If this is the player's old standing do???
            if(sPlayerName == sCurrentName && sPlayerAccount == sCurrentAccount)
            {
                // Set the variable to show this account has been found
                nFound = TRUE;
            }
        }
    }
    // New person on the board
    else
    {
        wow_SetBountyBoardRanking(oBoard, sPlayerName, sPlayerAccount, nNth, nPlayerCount, TRUE);
    }
}

