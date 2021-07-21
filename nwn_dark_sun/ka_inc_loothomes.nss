/*
Checks:                                         Actions:
        1 = Skill                                           1 = Jump to a waypoint
        2 = Attrib                                          2 = Play Animation
        3 = failed before                                   3 = Play Sound
        4 = already looted                                  4 = Set failed to loot
        5 = Rogue of at least X levels                      5 = Set looted
        6 = Hasn't looted yet                               6 = Give gold
        7 = Hasn't failed yet                               7 = Give exp
                                                            8 = Give item(s)






ka_lootablehomes

int WOW_<TAG>_ROOTS                         // The number of root nodes for this conversation
int WOW_<TAG>_LINES                         // The number of lines in this conversation
int WOW_<TAG>_ROGUE_LEVEL                   // This is the level of rogue needed to access this door.
string WOW_<TAG>_WAYPOINT                   // The waypoint to jump to if this is a door
int WOW_<TAG>_ROOT#_LINE                    // Points to the line number of this root
int WOW_<TAG>_LINE#_PC                      // This tells if this line is a PC line (option) or not
int WOW_<TAG>_LINE#_NEXT                    // This is the total number of next lines for this node
int WOW_<TAG>_LINE#_NEXT#                   // The number(s) of the possible next lines
string WOW_<TAG>_LINE#_CHECK                // Which type of check(s) to run as a StartingConditional, supports AND (&&) and OR (||)
int WOW_<TAG>_LINE#_SKILL                   // Which skill comes into play (see skills.2da for the numbers)
int WOW_<TAG>_LINE#_SKILLDC                 // The DC which to roll the skill against
int WOW_<TAG>_LINE#_ATTRIB                  // Which attribute comes into play (see iprp_abilities for the numbers)
int WOW_<TAG>_LINE#_ATTRIBDC                // The DC which to roll the attribute against
string WOW_<TAG>_LINE#_ACTIONS              // Which actions to run as an ActionsTaken
int WOW_<TAG>_LINE#_ANIMATION               // Which animations to play
float WOW_<TAG>_LINE#_ANIMATION_DURATION    // The duration to play the animation for
string WOW_<TAG>_LINE#_SOUND                // Which sound to play
string WOW_<TAG>_LINE#_REWARD_EXP           // The amount of exp to reward to the player
string WOW_<TAG>_LINE#_REWARD_GOLD          // The amount of gold to reward to the player
string WOW_<TAG>_LINE#_REWARD_ITEMS         // The items to reward to the player
string WOW_<TAG>_LINE#_NUM_ITEMS            // The number of items to reward the player with
string WOW_<TAG>_LINE#_TEXT                 // The text that appears in the conversation

*/
#include "ka_inc_traps"

void wow_ReturnToDoor()
{
    object oPC = GetClickingObject();
    location lLoc = GetLocalLocation(oPC, "WOW_LOOTABLE_RETURN_POINT");
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, JumpToLocation(lLoc));
}

int wow_StartingConditional()
{
    int nReturn;
    int nCount = wow_GetCount();
    int nPage = wow_GetCurrentPage();
    int nToken = wow_FindBeginningToken();

    switch(nCount)
    {
        case 0:
        {
            if(nPage == 0) nReturn = wow_SetRoots();
            else nReturn = wow_SetNPCLine();
            wow_IncreaseCount();
            break;
        }
        default:
        {
            nReturn = wow_SetPCLine();
            break;
        }
    }
    return nReturn;
}

void wow_OnUsed()
{
    if(GetLocalInt(GetModule(), "WOW_LOADING_SYSTEM") > 0) return;
    string sConv = wow_FindEmptyConversation();
    wow_SetConversationActive(sConv);
    object oPC;
    if(GetObjectType(OBJECT_SELF) == OBJECT_TYPE_DOOR) oPC = GetClickingObject();
    else oPC = GetLastUsedBy();
    ActionStartConversation(oPC, sConv, TRUE, FALSE);
}

void wow_ClearFields()
{
    wow_ClearCount();
    wow_SetCurrentPage(0);
    wow_SetConversationInactive();
}

int wow_GetNextLineCount(int nLine)
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_NEXT");
}

int wow_SetPCLine()
{
    int nReturn;
    int nPage = wow_GetCurrentPage();
    int nCount = wow_GetCount();
    int nNext = wow_GetNextLineCount(nPage);

    if(nCount <= nNext)
    {
        int nLine = GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nPage)+"_NEXT"+IntToString(nCount));
        nReturn = wow_RunLineCheck(nLine);
        if(nReturn)
        {
            int nToken = wow_FindBeginningToken() + nCount;
            wow_SetText(nLine, nToken);
        }
    }
    wow_IncreaseCount();
    if(wow_GetCount() == 10) wow_ClearCount();
    return nReturn;
}

int wow_SetNPCLine()
{
    int nReturn;
    int nPage = wow_GetCurrentPage();
    int nCount = wow_GetNextLineCount(nPage);

    if(nCount == 0) nReturn = FALSE;
    else
    {
        int nNth;
        int nToken = wow_FindBeginningToken();
        int nLine;
        object oModule = GetModule();

        while(nNth <= nCount && !nReturn)
        {
            nNth++;
            nLine = GetLocalInt(oModule, "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nPage)+"_NEXT"+IntToString(nNth));
            nReturn = wow_RunLineCheck(nLine);
            if(nReturn)
            {
                wow_SetText(nLine, nToken);
                wow_SetCurrentPage(nLine);
            }
        }
    }
    return nReturn;
}

int wow_SetRoots()
{
    object oModule = GetModule();
    int nRoots = wow_GetRootCount();
    int nToken = wow_FindBeginningToken();
    int nCount, nCheck, nLine;

    while(nCount < nRoots && !nCheck)
    {
        nCount++;
        nLine = GetLocalInt(oModule, "WOW_"+GetTag(OBJECT_SELF)+"_ROOT"+IntToString(nCount)+"_LINE");
        nCheck = wow_RunLineCheck(nLine);
        if(nCheck)
        {
            wow_SetText(nLine, nToken);
            wow_SetCurrentPage(nLine);
        }
    }
    return TRUE;
}

void wow_SetText(int nLine, int nToken)
{
    string sText = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_TEXT");
    sText = wow_GetAndReturnColoredText(sText);
    SetCustomToken(nToken, sText);
}

void wow_ActionsTaken(int nPCLine)
{
    int nPage = wow_GetCurrentPage();
    int nLine = GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nPage)+"_NEXT"+IntToString(nPCLine));
    if(nPCLine == 0) nLine = nPage;
    wow_RunActions(nLine);
}

int wow_RunCheck(int nCheck, int nLine)
{
    object oPC = GetPCSpeaker();
    int nReturn = FALSE;

    switch(nCheck)
    {
        case 0:
        {
            nReturn = TRUE;
            break;
        }
        case 1:
        {
            if((GetSkillRank(wow_GetSkill(nLine), oPC) + d20()) >= wow_GetSkillDC(nLine)) nReturn = TRUE;
            break;
        }
        case 2:
        {
            if((GetAbilityModifier(wow_GetAttribute(nLine), oPC) + d20()) >= wow_GetAttributeDC(nLine)) nReturn = TRUE;
            break;
        }
        case 3:
        {
            nReturn = wow_GetFailedBefore();
            break;
        }
        case 4:
        {
            nReturn = wow_GetAlreadyLooted();
            break;
        }
        case 5:
        {
            if(GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= wow_GetRogueLevel()) nReturn = TRUE;
            break;
        }
        case 6:
        {
            nReturn = !wow_GetAlreadyLooted();
            break;
        }
        case 7:
        {
            nReturn = !wow_GetFailedBefore();
            break;
        }
    }
    return nReturn;
}

int wow_CountWaypoints(string sWaypoint)
{
    int nCount;
    object oWP = GetObjectByTag(sWaypoint, nCount);
    while(GetIsObjectValid(oWP))
    {
        nCount++;
        oWP = GetObjectByTag(sWaypoint, nCount);
    }
    return nCount;
}

void wow_JumpToWaypoint()
{
    object oModule = GetModule();
    object oPC = GetPCSpeaker();
    string sWP = GetLocalString(oModule, "WOW_"+GetTag(OBJECT_SELF)+"_WAYPOINT");
    int nCount = wow_CountWaypoints(sWP);
    object oWP;

    if(nCount == 1)
    {
        oWP = GetWaypointByTag(sWP);
    }
    else
    {
        int nWP = GetLocalInt(oModule, "WOW_"+GetName(oPC)+sWP);
        if(nWP > nCount) nWP = 0;
        oWP = GetObjectByTag(sWP, nWP);
        SetLocalInt(oModule, "WOW_"+GetName(oPC)+sWP, (nWP + 1));
    }
    if(GetIsObjectValid(oWP))
    {
        SetLocalLocation(oPC, "WOW_LOOTABLE_RETURN_POINT", GetLocation(oPC));
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, JumpToObject(oWP));
    }
}

void wow_RunAction(int nAction, int nLine)
{
    switch(nAction)
    {
        case 1:
        {
            wow_JumpToWaypoint();
            break;
        }
        case 2:
        {
            wow_RunAnimation(nLine);
            break;
        }
        case 3:
        {
            wow_PlaySound(nLine);
            break;
        }
        case 4:
        {
            wow_SetFailedBefore();
            break;
        }
        case 5:
        {
            wow_SetAlreadyLooted();
            break;
        }
        case 6:
        {
            wow_RewardGold(nLine);
            break;
        }
        case 7:
        {
            wow_RewardExp(nLine);
            break;
        }
        case 8:
        {
            wow_RewardItems(nLine);
            break;
        }
    }
}

int wow_GetFailedBefore()
{
    return GetLocalInt(OBJECT_SELF, GetName(GetPCSpeaker())+"FAILED");
}

int wow_GetAlreadyLooted()
{
    return GetLocalInt(OBJECT_SELF, GetName(GetPCSpeaker())+"LOOTED");
}

void wow_SetFailedBefore()
{
    SetLocalInt(OBJECT_SELF, GetName(GetPCSpeaker())+"FAILED", TRUE);
}

void wow_SetAlreadyLooted()
{
    SetLocalInt(OBJECT_SELF, GetName(GetPCSpeaker())+"LOOTED", TRUE);
}

int wow_GetSkill(int nLine)
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_SKILL");
}

int wow_GetSkillDC(int nLine)
{
    string sDC = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_SKILLDC");
    int nDC;

    if(wow_CountDs(sDC) > 0)
    {
        int nLength = GetStringLength(sDC);
        int nSub = wow_FindD(sDC);
        string sNum = GetStringLeft(sDC, nSub);
        string sDice = GetStringRight(sDC, (nLength - (nSub + 1)));
        nDC = wow_RollDice(StringToInt(sNum), StringToInt(sDice));
    }
    else nDC = StringToInt(sDC);
    return nDC;
}

int wow_GetAttribute(int nLine)
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_ATTRIB");
}

int wow_GetAttributeDC(int nLine)
{
    string sDC = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_ATTRIBDC");
    int nDC;

    if(wow_CountDs(sDC) > 0)
    {
        int nLength = GetStringLength(sDC);
        int nSub = wow_FindD(sDC);
        string sNum = GetStringLeft(sDC, nSub);
        string sDice = GetStringRight(sDC, (nLength - (nSub + 1)));
        nDC = wow_RollDice(StringToInt(sNum), StringToInt(sDice));
    }
    else nDC = StringToInt(sDC);
    return nDC;
}

string wow_GetWaypointTag()
{
    return GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_WAYPOINT");
}

void wow_RewardExp(int nLine)
{
    string sExp = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_REWARD_EXP");
    int nExp;

    if(wow_CountDs(sExp) > 0)
    {
        int nLength = GetStringLength(sExp);
        int nSub = wow_FindD(sExp);
        string sNum = GetStringLeft(sExp, nSub);
        string sDice = GetStringRight(sExp, (nLength - (nSub + 1)));
        nExp = wow_RollDice(StringToInt(sNum), StringToInt(sDice));
    }
    else nExp = StringToInt(sExp);
    GiveXPToCreature(GetPCSpeaker(), nExp);

}

void wow_RewardGold(int nLine)
{
    string sGold = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_REWARD_GOLD");
    int nGold;

    if(wow_CountDs(sGold) > 0)
    {
        int nLength = GetStringLength(sGold);
        int nSub = wow_FindD(sGold);
        string sNum = GetStringLeft(sGold, nSub);
        string sDice = GetStringRight(sGold, (nLength - (nSub + 1)));
        nGold = wow_RollDice(StringToInt(sNum), StringToInt(sDice));
    }
    else nGold = StringToInt(sGold);
    GiveGoldToCreature(GetPCSpeaker(), nGold);
}

int wow_GetRewardNumItems(int nLine)
{
    string sItems = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_NUM_ITEMS");
    int nItems;

    if(wow_CountDs(sItems) > 0)
    {
        int nLength = GetStringLength(sItems);
        int nSub = wow_FindD(sItems);
        string sNum = GetStringLeft(sItems, nSub);
        string sDice = GetStringRight(sItems, (nLength - (nSub + 1)));
        nItems = wow_RollDice(StringToInt(sNum), StringToInt(sDice));
    }
    else nItems = StringToInt(sItems);
    return nItems;
}

void wow_RewardItems(int nLine)
{
    string sItems = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_REWARD_ITEMS");
    int nReward = wow_GetRewardNumItems(nLine);
    int nCount = wow_CountMarkers(sItems);

    if(nCount == 0)
    {
        for(nCount = 1; nCount <= nReward; nCount++)
        {
            CreateItemOnObject(sItems, GetPCSpeaker());
        }
    }
    else
    {
        string sChosen;
        int nSub, nGiven, nChosen, nLength, nRight, nNth;
        nCount++;
        while(nGiven != nReward)
        {
            nChosen = Random(nCount) + 1;

            if(nChosen == 1)
            {
                nSub = wow_FindMarker(sItems);
                sChosen = GetStringLeft(sItems, nSub);
            }
            else
            {
                sChosen = sItems;
                for(nNth = 1; nNth <= nChosen; nNth++)
                {
                    nSub = wow_FindMarker(sChosen);
                    nLength = GetStringLength(sChosen);
                    nRight = nLength - (nSub + 2);
                    sChosen = GetStringRight(sChosen, nRight);
                }
                nSub = wow_FindMarker(sChosen);
                if(nSub != -1) sChosen = GetStringLeft(sChosen, nSub);
            }
            nGiven++;
            CreateItemOnObject(sChosen, GetPCSpeaker());
        }
    }
}

void wow_PlaySound(int nLine)
{
    string sSound = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_SOUND");
    if(sSound != "") PlaySound(sSound);
}

float wow_GetAnimationTime(int nLine)
{
    return GetLocalFloat(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_ANIMATION_DURATION");
}

void wow_RunAnimation(int nLine)
{
    object oTarget;
    int nAnimation = wow_GetAnimation(nLine);
    if(nAnimation < 200) oTarget = GetPCSpeaker();
    else oTarget = OBJECT_SELF;

    float fDuration = wow_GetAnimationTime(nLine);
    AssignCommand(oTarget, PlayAnimation(nAnimation, 1.0, fDuration));
}

int wow_GetAnimation(int nLine)
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_ANIMATION");
}

void wow_RunActions(int nLine)
{
    string sText = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_ACTIONS");
    wow_SetCurrentPage(nLine);

    if(sText == "") return;

    int nCount = wow_CountMarkers(sText);
    int nRight, nLength;
    int nSub = wow_FindMarker(sText);
    string sLeft;
    while(nSub != -1)
    {
        nLength = GetStringLength(sText);
        sLeft = GetStringLeft(sText, nSub);
        wow_RunAction(StringToInt(sLeft), nLine);
        nRight = nLength - (nSub + 2);
        sText = GetStringRight(sText, nRight);
        nSub = wow_FindMarker(sText);
    }
    wow_RunAction(StringToInt(sText), nLine);
}

int wow_RunLineCheck(int nLine)
{
    string sCheck = GetLocalString(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_CHECK");
    string sTemp;
    int nTotal = wow_CountANDs(sCheck) + wow_CountORs(sCheck);
    int nAnd = wow_FindAND(sCheck);
    int nOr = wow_FindOR(sCheck);
    int nSub, nCheck, nNth, nLength, nRight;

    if(!nTotal) nCheck = wow_RunCheck(StringToInt(sCheck), nLine);
    else
    {
        if(nAnd != -1 && (nOr == -1 || nAnd < nOr)) nSub = nAnd;
        else if(nOr != -1 && (nAnd == -1 || nOr < nAnd)) nSub = nOr;
        else nSub = -1;
        nTotal++;
        for(nNth = 1; nNth <= nTotal; nNth++)
        {
            nLength = GetStringLength(sCheck);
            if(nNth == 1)
            {
                sTemp = GetStringLeft(sCheck, nSub);
                nCheck = wow_RunCheck(StringToInt(sTemp), nLine);
                nRight = nLength - nSub;
                sCheck = GetStringRight(sCheck, nRight);
            }
            else
            {
                if(nAnd == 0)
                {
                    nRight = nLength - 3;
                    sCheck = GetStringRight(sCheck, nRight);
                    nLength = GetStringLength(sCheck);
                }
                else
                {
                    nRight = nLength - 2;
                    sCheck = GetStringRight(sCheck, nRight);
                    nLength = GetStringLength(sCheck);
                }
                nAnd = wow_FindAND(sCheck);
                nOr = wow_FindOR(sCheck);
                if(nAnd != -1 && (nOr == -1 || nAnd < nOr)) nSub = nAnd;
                else if(nOr != -1 && (nAnd == -1 || nOr < nAnd)) nSub = nOr;
                else nSub = -1;
                if(nSub != -1)
                {
                    sTemp = GetStringLeft(sCheck, nSub);
                    nRight = nLength - nSub;
                    sCheck = GetStringRight(sCheck, nRight);
                }
                else sTemp = sCheck;
                if(nAnd == 0) nCheck = (nCheck && wow_RunCheck(StringToInt(sTemp), nLine));
                else nCheck = (nCheck || wow_RunCheck(StringToInt(sTemp), nLine));
            }
            nAnd = wow_FindAND(sCheck);
            nOr = wow_FindOR(sCheck);
            if(nAnd != -1 && (nOr == -1 || nAnd < nOr)) nSub = nAnd;
            else if(nOr != -1 && (nAnd == -1 || nOr < nAnd)) nSub = nOr;
            else nSub = -1;
        }
    }
    return nCheck;
}

int wow_CountANDs(string sText)
{
    int nSub, nCount, nLength, nRight;
    while(nSub != -1)
    {
        nSub = wow_FindAND(sText);
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

int wow_CountORs(string sText)
{
    int nSub, nCount, nLength, nRight;
    while(nSub != -1)
    {
        nSub = wow_FindOR(sText);
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

int wow_FindAND(string sText)
{
    return FindSubString(sText, "AND");
}

int wow_FindOR(string sText)
{
    return FindSubString(sText, "OR");
}


void wow_SetUpNextLines(string sVariable, string sText)
{
    int nCount = wow_CountMarkers(sText);
    object oModule = GetModule();

    if(nCount == 0)
    {
        SetLocalInt(oModule, sVariable+"1", StringToInt(sText));
        SetLocalInt(oModule, sVariable, 1);
    }
    else
    {
        int nNth, nTemp, nLength, nRight, nLine;
        string sTemp;
        int nSub = wow_FindMarker(sText);

        while(nSub != -1)
        {
            nLine++;
            nLength = GetStringLength(sText);
            sTemp = GetStringLeft(sText, nSub);
            nTemp = StringToInt(sTemp);
            SetLocalInt(oModule, sVariable+IntToString(nLine), nTemp);
            nRight = nLength - (nSub + 2);
            sText = GetStringRight(sText, nRight);
            nSub = wow_FindMarker(sText);
            if(nSub == -1)
            {
                nLine++;
                nTemp = StringToInt(sText);
                SetLocalInt(oModule, sVariable+IntToString(nLine), nTemp);
                SetLocalInt(oModule, sVariable, nLine);
            }
        }
    }
}

int wow_GetIsPCLine(int nLine)
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINE"+IntToString(nLine)+"_PC");
}

int wow_GetRootCount()
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_ROOTS");
}

int wow_GetLineCount()
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_LINES");
}

int wow_GetRogueLevel()
{
    return GetLocalInt(GetModule(), "WOW_"+GetTag(OBJECT_SELF)+"_ROGUE_LEVEL");
}

int wow_GetCount()
{
    return GetLocalInt(OBJECT_SELF, "WOW_COUNTER");
}

void wow_IncreaseCount()
{
    SetLocalInt(OBJECT_SELF, "WOW_COUNTER", (wow_GetCount() + 1));
}

void wow_ClearCount()
{
    DeleteLocalInt(OBJECT_SELF, "WOW_COUNTER");
}

int wow_GetCurrentPage()
{
    return GetLocalInt(OBJECT_SELF, "WOW_PAGE");
}

void wow_SetCurrentPage(int nPage)
{
    SetLocalInt(OBJECT_SELF, "WOW_PAGE", nPage);
}

int wow_FindBeginningToken()
{
    string sConv = GetLocalString(OBJECT_SELF, "WOW_CONVERSATION");
    sConv = GetStringRight(sConv, 2);
    int nConv = StringToInt(sConv);
    int nReturn;

    switch(nConv)
    {
        case 1: nReturn = 51000; break;
        case 2: nReturn = 51010; break;
        case 3: nReturn = 51020; break;
        case 4: nReturn = 51030; break;
        case 5: nReturn = 51040; break;
        default: break;
    }
    return nReturn;
}

void wow_SetConversationInactive()
{
    string sConv = GetLocalString(OBJECT_SELF, "WOW_CONVERSATION");
    DeleteLocalInt(GetModule(), sConv);
    DeleteLocalString(OBJECT_SELF, "WOW_CONVERSATION");
}

void wow_SetConversationActive(string sConv)
{
    SetLocalInt(GetModule(), sConv, TRUE);
    SetLocalString(OBJECT_SELF, "WOW_CONVERSATION", sConv);
}

string wow_FindEmptyConversation()
{
    string sReturn;
    string sConv = "ka_loot_home_0";
    int nBreak = FALSE;
    int nNth;
    object oModule = GetModule();
    for(nNth = 1; (nNth <= 5) && (!nBreak); nNth++)
    {
        if(!GetLocalInt(oModule, sConv+IntToString(nNth)))
        {
            nBreak = TRUE;
            sReturn = sConv+IntToString(nNth);
        }
    }
    return sReturn;
}

void wow_SetUpConversation(string sTag, string s2DA, int nRow = 0)
{
    string sMax = Get2DAString(s2DA, "ROOT_NODE", 0);
    int nMax = StringToInt(sMax);
    if(nRow == 0) nRow++;
    if(nRow > nMax)
    {
        DelayCommand(0.5, wow_SetUpLootableHomes());
    }
    else
    {
        string sTemp, sUse, sRow, sBase;
        int nStop = nRow + 3;
        object oModule = GetModule();
        int nRoot = GetLocalInt(oModule, "WOW_"+sTag+"_ROOTS");
        int nTemp;
        sTemp = Get2DAString(s2DA, "PC", 0);
        SetLocalInt(oModule, "WOW_"+sTag+"_LINES", nMax);
        if(sTemp != "")
        {
            int nRogue = StringToInt(sTemp);
            SetLocalInt(oModule, "WOW_"+sTag+"_ROGUE_LEVEL", nRogue);
        }
        sTemp = Get2DAString(s2DA, "NEXT_NODE", 0);
        if(sTemp != "") SetLocalString(oModule, "WOW_"+sTag+"_WAYPOINT", sTemp);

        for(nRow = nRow; (nRow < nStop) && ((nRow < nMax) || (nRow == nMax)); nRow++)
        {
            sRow = IntToString(nRow);
            sUse = "WOW_"+sTag+"_LINE"+sRow+"_";
            sTemp = Get2DAString(s2DA, "ROOT_NODE", nRow);
            if(sTemp != "")
            {
                nTemp = StringToInt(sTemp);
                sBase = "WOW_"+sTag+"_ROOT"+sTemp+"_";
                SetLocalInt(oModule, sBase+"LINE", nRow);
                nRoot++;
                SetLocalInt(oModule, "WOW_"+sTag+"_ROOTS", nRoot);
            }
            sTemp = Get2DAString(s2DA, "PC", nRow);
            if(sTemp != "") SetLocalInt(oModule, sUse+"PC", TRUE);
            sTemp = Get2DAString(s2DA, "NEXT_NODE", nRow);
            if(sTemp != "") wow_SetUpNextLines(sUse+"NEXT", sTemp);
            sTemp = Get2DAString(s2DA, "CHECK", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"CHECK", sTemp);
            sTemp = Get2DAString(s2DA, "SKILL", nRow);
            if(sTemp != "") SetLocalInt(oModule, sUse+"SKILL", StringToInt(sTemp));
            sTemp = Get2DAString(s2DA, "SKILL_DC", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"SKILLDC", sTemp);
            sTemp = Get2DAString(s2DA, "ATTRIB", nRow);
            if(sTemp != "") SetLocalInt(oModule, sUse+"ATTRIB", StringToInt(sTemp));
            sTemp = Get2DAString(s2DA, "ATTRIB_DC", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"ATTRIBDC", sTemp);
            sTemp = Get2DAString(s2DA, "ACTIONS", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"ACTIONS", sTemp);
            sTemp = Get2DAString(s2DA, "ANIMATION", nRow);
            if(sTemp != "") SetLocalInt(oModule, sUse+"ANIMATION", StringToInt(sTemp));
            sTemp = Get2DAString(s2DA, "DURATION", nRow);
            if(sTemp != "") SetLocalFloat(oModule, sUse+"ANIMATION_DURATION", StringToFloat(sTemp));
            sTemp = Get2DAString(s2DA, "SOUND", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"SOUND", sTemp);
            sTemp = Get2DAString(s2DA, "REWARD_EXP", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"REWARD_EXP", sTemp);
            sTemp = Get2DAString(s2DA, "REWARD_GOLD", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"REWARD_GOLD", sTemp);
            sTemp = Get2DAString(s2DA, "REWARD_ITEMS", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"REWARD_ITEMS", sTemp);
            sTemp = Get2DAString(s2DA, "NUM_ITEMS", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"NUM_ITEMS", sTemp);
            sTemp = Get2DAString(s2DA, "TEXT", nRow);
            if(sTemp != "") SetLocalString(oModule, sUse+"TEXT", sTemp);
        }
        if(nRow <= nMax) DelayCommand(1.0, wow_SetUpConversation(sTag, s2DA, nRow));
        else DelayCommand(1.0, wow_SetUpLootableHomes());
    }
}

void wow_SetUpLootableHomes()
{
    string sMax = Get2DAString("ka_lootablehomes", "TAG", 0);
    int nMax = StringToInt(sMax);
    object oModule = GetModule();
    int nRow = GetLocalInt(oModule, "WOW_CONVERSATION_LOADING");
    nRow++;

    if(nRow > nMax)
    {
        DeleteLocalInt(oModule, "WOW_CONVERSATION_LOADING");
        DelayCommand(0.5, wow_Setup());
    }
    else
    {
        SetLocalInt(oModule, "WOW_CONVERSATION_LOADING", nRow);
        string sTag = Get2DAString("ka_lootablehomes", "TAG", nRow);
        string s2DA = Get2DAString("ka_lootablehomes", "2DA", nRow);
//        SetLocalString(oModule, "WOW_CONVERSATION"+IntToString(nRow), sTag);
        if(sTag != "" && s2DA != "") DelayCommand(0.5, wow_SetUpConversation(sTag, s2DA));
        else DelayCommand(0.5, wow_SetUpLootableHomes());
    }
}

//void main () {}
