/*
    WOW_<TAG>_R = number of recipes
    WOW_<TAG>_RX = number of ingredients
    WOW_<TAG>_RX_RES = resref
    WOW_<TAG>_RX_INGX = tag of INGX
    WOW_<TAG>_RX_GOLD = Gold
    WOW_<TAG>_RX_VFX = VFX
    WOW_<TAG>_RX_STACK = number to create
*/
#include "wow_inc_load_sys"

void wow_DelayedCreateItem(string sResRef, object oTarget, int nStack)
{
    CreateItemOnObject(sResRef, oTarget, nStack);
}

int wow_CheckBaseItemType(object oItem)
{
    int nReturn;
    int nType = GetBaseItemType(oItem);
    switch(nType)
    {
        // Just add in any types here that will affect the number in the
        // stack created.
        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        case BASE_ITEM_DART:
        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_SHURIKEN:
        {
            nReturn = TRUE;
            break;
        }
        default:
        {
            break;
        }
    }
    return nReturn;
}

void wow_Forge()
{
    if(GetLocalInt(GetModule(), "WOW_LOADING_SYSTEM") > 0) return;
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED) wow_CheckAllRecipes();
}

void wow_CreateGold(int nAmount)
{
    CreateItemOnObject("nw_it_gold001", OBJECT_SELF, nAmount);
}

void wow_CreateRecipe(int nRecipe)
{
    string sBase = "WOW_"+GetTag(OBJECT_SELF)+"_R"+IntToString(nRecipe);
    object oModule = GetModule();
    int nMaxIng = GetLocalInt(oModule, sBase);
    int nGold = GetLocalInt(oModule, sBase+"_GOLD");
    int nNth, nCount, nReturn;
    int nStack = GetLocalInt(oModule, sBase+"_STACK");
    string sTag;
    string sResRef = GetLocalString(oModule, sBase+"_RES");
    object oItem;

    for(nNth = 1; nNth <= nMaxIng; nNth++)
    {
        sTag = GetLocalString(oModule, sBase+"_ING"+IntToString(nNth));
        oItem = GetItemPossessedBy(OBJECT_SELF, sTag);
        if(GetIsObjectValid(oItem))
        {
            if(wow_CheckBaseItemType(oItem) && nStack <= 0) nStack = GetNumStackedItems(oItem);
            DestroyObject(oItem);
        }
    }
    if(GetGold(OBJECT_SELF) == nGold && nGold >= 0) DestroyObject(GetItemPossessedBy(OBJECT_SELF, "NW_IT_GOLD001"));
    else if(nGold >= 0)
    {
        nCount = GetGold(OBJECT_SELF);
        DestroyObject(GetItemPossessedBy(OBJECT_SELF, "NW_IT_GOLD001"));
        DelayCommand(0.2, wow_CreateGold(nCount-nGold));
    }
    if(nStack <= 0) nStack = 1;
    DelayCommand(1.0, wow_DelayedCreateItem(sResRef, OBJECT_SELF, nStack));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(GetLocalInt(oModule, sBase+"_VFX")), OBJECT_SELF);
 }

int wow_CheckRecipe(int nRecipe)
{
    object oItem;
    object oModule = GetModule();
    string sBase = "WOW_"+GetTag(OBJECT_SELF)+"_R"+IntToString(nRecipe);
    int nMaxIng = GetLocalInt(oModule, sBase);
    int nGold = GetLocalInt(oModule, sBase+"_GOLD");
    int nNth, nCount, nReturn;
    string sTag;

    for(nNth = 1; nNth <= nMaxIng; nNth++)
    {
        sTag = GetLocalString(oModule, sBase+"_ING"+IntToString(nNth));
        oItem = GetItemPossessedBy(OBJECT_SELF, sTag);
        if(GetIsObjectValid(oItem)) nCount++;
    }
    if(nCount == nMaxIng && GetGold(OBJECT_SELF) >= nGold) nReturn = TRUE;
    return nReturn;
}

void wow_CheckAllRecipes()
{
    string sTag = GetTag(OBJECT_SELF);
    string sBase = "WOW_"+sTag+"_R";
    object oModule = GetModule();
    int nMax = GetLocalInt(oModule, sBase);
    int nNth, nRun, nRecipe;

    for(nNth = 1; (nNth <= nMax) && (!nRun); nNth++)
    {
        nRun = wow_CheckRecipe(nNth);
        if(nRun) nRecipe = nNth;
    }
    if(nRecipe > 0) wow_CreateRecipe(nRecipe);
}


void wow_SetUpRecipe(int nRecipe, string sTag, string s2DA, int nRow = 0)
{
    string sMaxRows = Get2DAString(s2DA, "RESREF", 0);
    string sMaxIng = Get2DAString(s2DA, "NUMING", 0);
    int nMaxRows = StringToInt(sMaxRows);
    int nMaxIng = StringToInt(sMaxIng);
    int nEnd = nRow + 3;
    string sBase = "WOW_"+sTag+"_R";
    int nNum, nIng, nGold, nVFX, nCount, nStack;
    string sNum, sRow, sIng, sGold, sCount, sStack, sResRef, sVFX, sIng2;
    object oModule = GetModule();
    if(nRow == 0)
    {
        nRow = 1;
        SetLocalInt(oModule, sBase, nMaxRows);
    }

    for(nRow = nRow; (nRow < nEnd) && ((nRow < nMaxRows) || (nRow == nMaxRows)); nRow++)
    {
        sRow = IntToString(nRow);
        sNum = Get2DAString(s2DA, "NUMING", nRow);
        sResRef = Get2DAString(s2DA, "RESREF", nRow);
        sGold = Get2DAString(s2DA, "GOLD", nRow);
        sVFX = Get2DAString(s2DA, "VFX", nRow);
        sStack = Get2DAString(s2DA, "NUMCREATE", nRow);
        nNum = StringToInt(sNum);
        nGold = StringToInt(sGold);
        nVFX = StringToInt(sVFX);
        nStack = StringToInt(sStack);
        SetLocalInt(oModule, sBase+sRow, nNum); // Number of ingredients
        SetLocalString(oModule, sBase+sRow+"_RES", sResRef);
        if(nGold > 0) SetLocalInt(oModule, sBase+sRow+"_GOLD", nGold);
        SetLocalInt(oModule, sBase+sRow+"_VFX", nVFX);
        if(nStack > 0) SetLocalInt(oModule, sBase+sRow+"_STACK", nStack);

        for(nIng = 1; nIng <= nNum; nIng++)
        {
            sIng = "ING"+IntToString(nIng);
            sIng2 = Get2DAString(s2DA, sIng, nRow);
            SetLocalString(oModule, sBase+sRow+"_"+sIng, sIng2);
        }
    }

    if(nRow <= nMaxRows) DelayCommand(1.0, wow_SetUpRecipe(nRecipe, sTag, s2DA, nRow));
    else DelayCommand(1.0, wow_SetupForge(nRecipe));
}

void wow_SetupForge(int nRecipe = 0)
{
    string sMax = Get2DAString("wow_crft_base", "TAG", 0);
    int nMax = StringToInt(sMax);
    nRecipe++;

    if(nRecipe <= nMax)
    {
        string s2DA = Get2DAString("wow_crft_base", "2DA", nRecipe);
        string sTag = Get2DAString("wow_crft_base", "TAG", nRecipe);
        DelayCommand(0.5, wow_SetUpRecipe(nRecipe, sTag, s2DA));
    }
    else DelayCommand(0.5, wow_Setup());
}


