// ka_inc_loothomes
void wow_SetUpLootableHomes();
void wow_SetUpConversation(string sTag, string s2DA, int nRow = 0);
string wow_FindEmptyConversation();
void wow_SetConversationActive(string sConv);
void wow_SetConversationInactive();
int wow_FindBeginningToken();
int wow_GetCurrentPage();
void wow_SetCurrentPage(int nPage);
int wow_GetCount();
void wow_IncreaseCount();
void wow_ClearCount();
int wow_GetRogueLevel();
int wow_GetLineCount();
int wow_GetRootCount();
int wow_GetIsPCLine(int nLine);
void wow_SetUpNextLines(string sVariable, string sText);
int wow_FindAND(string sText);
int wow_FindOR(string sText);
int wow_CountANDs(string sText);
int wow_CountORs(string sText);
int wow_RunLineCheck(int nLine);
void wow_RunActions(int nLine);
int wow_GetAnimation(int nLine);
void wow_RunAnimation(int nLine);
void wow_PlaySound(int nLine);
float wow_GetAnimationTime(int nLine);
void wow_RewardExp(int nLine);
void wow_RewardGold(int nLine);
void wow_RewardItems(int nLine);
int wow_GetRewardNumItems(int nLine);
string wow_GetWaypointTag();
int wow_GetSkill(int nLine);
int wow_GetSkillDC(int nLine);
int wow_GetAttribute(int nLine);
int wow_GetAttributeDC(int nLine);
int wow_GetFailedBefore();
int wow_GetAlreadyLooted();
void wow_SetFailedBefore();
void wow_SetAlreadyLooted();
void wow_RunAction(int nAction, int nLine);
void wow_JumpToWaypoint();
int wow_CountWaypoints(string sWaypoint);
int wow_RunCheck(int nCheck, int nLine);
void wow_ActionsTaken(int nPCLine);
int wow_StartingConditional();
void wow_SetText(int nLine, int nToken);
int wow_SetRoots();
int wow_SetNPCLine();
int wow_GetNextLineCount(int nLine);
int wow_SetPCLine();
void wow_ClearFields();
void wow_OnUsed();
void wow_ReturnToDoor();

// ka_inc_traps

// wow_inc_forge
void wow_SetupForge(int nRecipe = 0);
void wow_SetUpRecipe(int nRecipe, string sTag, string s2DA, int nRow = 0);
void wow_CheckAllRecipes();
int wow_CheckRecipe(int nRecipe);
void wow_CreateRecipe(int nRecipe);
void wow_CreateGold(int nAmount);
int wow_CheckBaseItemType(object oItem);
void wow_Forge();
void wow_DelayedCreateItem(string sResRef, object oTarget, int nStack);

// wow_inc_load_sys
void wow_Setup();
string wow_GetAndReturnColoredText(string sText);
int wow_FindMarker(string sText);
int wow_CountMarkers(string sText);
int wow_FindD(string sText);
int wow_CountDs(string sText);
int wow_RollDice(int nNumber, int nDice);
void wow_SetUpScoreBoard(int nNumber = 0);


// gen_inc_color
string GetRGB(int red = 15,int green = 15,int blue = 15);
string GetTextColor(string sColor = "WHITE");

//void main () {}


