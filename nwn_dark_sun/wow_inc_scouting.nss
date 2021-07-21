/*
const int X2_ITEM_EVENT_ACTIVATE = 0;
const int X2_ITEM_EVENT_EQUIP = 1;
const int X2_ITEM_EVENT_UNEQUIP = 2;
const int X2_ITEM_EVENT_ONHITCAST = 3;
const int X2_ITEM_EVENT_ACQUIRE = 4;
const int X2_ITEM_EVENT_UNACQUIRE = 5;
const int X2_ITEM_EVENT_SPELLCAST_AT = 6;
*/
#include "yr_inc_effects"
#include "x2_inc_switches"
const int WOW_ITEM_EVENT_ONACTIVATE     = 1;
const int WOW_ITEM_EVENT_ONEQUIP        = 2;
const int WOW_ITEM_EVENT_ONUNEQUIP      = 4;
const int WOW_ITEM_EVENT_ONACQUIRE      = 8;
const int WOW_ITEM_EVENT_ONUNACQUIRE    = 16;
const int WOW_ITEM_EVENT_ONHITCAST      = 32;

// Returns TRUE if oPC currently has nEvent loaded
int wow_CheckForModuleItemEvent(object oPC, int nEvent);
void wow_SetModuleItemEvent(object oPC, int nEvent);
int wow_GetModuleItemEvent(object oPC);
void wow_DeleteModuleItemEvent(object oPC, int nEvent);
int wow_CheckModuleEventForScoutingSystem(int nSpell = FALSE);
int wow_GetIsPlayerScouting(object oPC);
void wow_SetPlayerScouting(object oPC);
void wow_DeletePlayerScouting(object oPC);
int wow_GetIsScoutingItem(object oItem);
int wow_GetAppearanceFromRace(object oPC);
int wow_CheckForModuleItemEventOverride(object oPC, int nModuleEvent);
int wow_TurnModuleEventToItemEvent(int nModuleEvent);
void wow_RestoreItemsAcquiredDuringScouting(object oPC, object oOwner, object oItem, int nStack);
void wow_RetrieveItemDroppedWhileScouting(object oPC, object oItem);
void wow_StartScouting(object oPC);
void wow_CloneScouter(object oPC);
void wow_SetScoutingClone(object oPC, object oClone);
object wow_GetScoutingClone(object oPC);
void wow_DeleteScoutingClone(object oPC);
void wow_ReturnToBody(object oPC);
int wow_GetSlotByItem(object oPC, object oItem);
void wow_MonitorHealth(object oPC);
void wow_AdjustHitPoints(object oPC, object oClone);


// void main(){}


void wow_AdjustHitPoints(object oPC, object oClone)
{
    int nCHP = GetCurrentHitPoints(oClone);
    int nPHP = GetCurrentHitPoints(oPC);
    if(nCHP != nPHP)
    {
        effect eEffect;

        if(nCHP > nPHP) eEffect = EffectHeal((nCHP - nPHP));
        else eEffect = EffectDamage((nPHP - nCHP));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
    }
}

void wow_MonitorHealth(object oPC)
{
    if(wow_GetIsPlayerScouting(oPC))
    {
        if(GetIsInCombat(oPC))
        {
            FloatingTextStringOnCreature("You cannot engage in combat while you are scouting.", oPC);
            wow_ReturnToBody(oPC);
        }
        else
        {
            object oClone = wow_GetScoutingClone(oPC);
            if(GetIsInCombat(oClone))
            {
                FloatingTextStringOnCreature("Your body is under attack!", oPC);
            }
            else
            {
                int nPHP = GetCurrentHitPoints(oPC);
                int nCHP = GetCurrentHitPoints(oClone);
                if(nPHP > nCHP) FloatingTextStringOnCreature("Your body is under attack!", oPC);
                else if(nCHP > nPHP)
                {
                    FloatingTextStringOnCreature("You cannot engage in combat while you are scouting.", oPC);
                    wow_ReturnToBody(oPC);
                }
            }
            DelayCommand(1.0, wow_MonitorHealth(oPC));
        }
    }
}

int wow_GetSlotByItem(object oPC, object oItem)
{
    int nType = GetBaseItemType(oItem);
    int nReturn = -1;
    switch(nType)
    {
        // weapons
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DART:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHURIKEN:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_WHIP:
        {
            if(!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))) nReturn = INVENTORY_SLOT_RIGHTHAND;
            else if(!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC))) nReturn = INVENTORY_SLOT_LEFTHAND;
            break;
        }
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_TOWERSHIELD:
        {
            nReturn = INVENTORY_SLOT_LEFTHAND;
            break;
        }
        case BASE_ITEM_ARMOR:
        {
            nReturn = INVENTORY_SLOT_CHEST;
            break;
        }
        case BASE_ITEM_HELMET:
        {
            nReturn = INVENTORY_SLOT_HEAD;
            break;
        }
        case BASE_ITEM_AMULET:
        {
            nReturn = INVENTORY_SLOT_NECK;
            break;
        }
        case BASE_ITEM_ARROW:
        {
            nReturn = INVENTORY_SLOT_ARROWS;
            break;
        }
        case BASE_ITEM_BELT:
        {
            nReturn = INVENTORY_SLOT_BELT;
            break;
        }
        case BASE_ITEM_BOLT:
        {
            nReturn = INVENTORY_SLOT_BOLTS;
            break;
        }
        case BASE_ITEM_BOOTS:
        {
            nReturn = INVENTORY_SLOT_BOOTS;
            break;
        }
        case BASE_ITEM_BULLET:
        {
            nReturn = INVENTORY_SLOT_BULLETS;
            break;
        }
        case BASE_ITEM_RING:
        {
            if(!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC))) nReturn = INVENTORY_SLOT_RIGHTRING;
            else if(!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC))) nReturn = INVENTORY_SLOT_LEFTRING;
            break;
        }
        case BASE_ITEM_CLOAK:
        {
            nReturn = INVENTORY_SLOT_CLOAK;
            break;
        }
        case BASE_ITEM_GLOVES:
        case BASE_ITEM_BRACER:
        {
            nReturn = INVENTORY_SLOT_ARMS;
            break;
        }
    }
    return nReturn;
}

void wow_ReturnToBody(object oPC)
{
    object oClone = wow_GetScoutingClone(oPC);
    location lClone = GetLocation(oClone);
    location lPC = GetLocation(oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oClone);
    effect eVis = EffectVisualEffect(459);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lClone);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lPC);
    SetCreatureAppearanceType(oPC, wow_GetAppearanceFromRace(oPC));
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, JumpToLocation(lClone));
    wow_AdjustHitPoints(oPC, oClone);
    wow_DeletePlayerScouting(oPC);
}

void wow_SetScoutingClone(object oPC, object oClone)
{
    SetLocalObject(oPC, "WOW_SCOUTING_CLONE", oClone);
    AssignCommand(oClone, SetIsDestroyable(FALSE, FALSE, FALSE));
}

object wow_GetScoutingClone(object oPC)
{
    return GetLocalObject(oPC, "WOW_SCOUTING_CLONE");
}

void wow_DeleteScoutingClone(object oPC)
{
    object oClone = wow_GetScoutingClone(oPC);
    AssignCommand(oClone, SetIsDestroyable(TRUE, FALSE, FALSE));
    DeleteLocalObject(oPC, "WOW_SCOUTING_CLONE");
    DestroyObject(oClone, 0.1);
}

void wow_CloneScouter(object oPC)
{
    vector vPos = GetPosition(oPC);
    float fFacing = GetFacing(oPC);
    vPos = vPos + 1.0 * AngleToVector(fFacing);
    fFacing += 180.0;
    if(fFacing > 359.9) fFacing -= 360.0;
    else if(fFacing < 0.0) fFacing += 360.0;
    location lClone = GetLocation(oPC);
    location lPC = Location(GetArea(oPC), vPos, fFacing);
    object oClone = CopyObject(oPC, lClone);
    BootPC(oClone);
    AssignCommand(oPC, JumpToLocation(lPC));
    wow_SetScoutingClone(oPC, oClone);
    RemoveLocalEffect(oPC, "WOW_SCOUTING_GHOST_EFFECT");
    effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_IMPROVED);
    effect eVis = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    SetLocalEffect(oPC, eInvis, "WOW_SCOUTING_INVISIBILITY_EFFECT");
    SetLocalEffect(oPC, eVis, "WOW_SCOUTING__INVISIBILITY_VFX_EFFECT");
    SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_WILL_O_WISP);
}

void wow_StartScouting(object oPC)
{
    wow_SetPlayerScouting(oPC);
    effect eVis = EffectVisualEffect(459);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oPC));
    effect eGhost =EffectCutsceneGhost();
    SetLocalEffect(oPC, eGhost, "WOW_SCOUTING_GHOST_EFFECT");
    AssignCommand(oPC, ClearAllActions(TRUE));
    DelayCommand(0.1, wow_CloneScouter(oPC));
    DelayCommand(1.0, wow_MonitorHealth(oPC));
}

void wow_RetrieveItemDroppedWhileScouting(object oPC, object oItem)
{
    object oOwner = GetItemPossessor(oItem);
    int nStack = GetItemStackSize(oItem);
    if(GetIsObjectValid(oOwner))
    {
        if(nStack == 1)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionTakeItem(oItem, oOwner));
        }
        else
        {
            object oTemp;
            string sTag;
            int nCount, nFound;
            CreateItemOnObject(GetResRef(oItem), oPC, nStack);
            oTemp = GetFirstItemInInventory(oOwner);
            sTag = GetTag(oItem);
            while(GetIsObjectValid(oTemp) && !nFound)
            {
                if(sTag == GetTag(oTemp))
                {
                    nCount = GetItemStackSize(oTemp);
                    if(nCount > nStack)
                    {
                        nFound = TRUE;
                        SetItemStackSize(oTemp, (nCount - nStack));
                    }
                    else if(nCount == nStack)
                    {
                        nFound = TRUE;
                        DestroyObject(oTemp);
                    }
                    else
                    {
                        DestroyObject(oTemp, 0.1);
                        nStack -= nCount;
                    }
                }
                oTemp = GetNextItemInInventory(oOwner);
            }

        }
    }
    else
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionPickUpItem(oItem));
    }
}

void wow_RestoreItemsAcquiredDuringScouting(object oPC, object oOwner, object oItem, int nStack)
{
    string sMessage, sTag;
    object oTemp;
    int nNth, nFound, nCount;
    if(GetIsObjectValid(oItem)) // Its not gold
    {
        sMessage = "You cannot acquire any items while you are scouting.";
        if(GetIsObjectValid(oOwner)) // It was gotten from someone/something
        {
            if(nStack == 1)
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oPC, ActionGiveItem(oItem, oOwner));
            }
            else
            {
                CreateItemOnObject(GetResRef(oItem), oOwner, nStack);
                oTemp = GetFirstItemInInventory(oPC);
                sTag = GetTag(oItem);
                while(GetIsObjectValid(oTemp) && !nFound)
                {
                    if(sTag == GetTag(oTemp))
                    {
                        nCount = GetItemStackSize(oTemp);
                        if(nCount > nStack)
                        {
                            nFound = TRUE;
                            SetItemStackSize(oTemp, (nCount - nStack));
                        }
                        else if(nCount == nStack)
                        {
                            nFound = TRUE;
                            DestroyObject(oTemp);
                        }
                        else
                        {
                            DestroyObject(oTemp);
                            nStack -= nCount;
                        }
                    }
                    oTemp = GetNextItemInInventory(oPC);
                }
            }
        }
        else
        {
            if(nStack == 1)
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oPC, ActionPutDownItem(oItem));
            }
            else
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
                vector vPos = GetPosition(oPC);
                vPos = vPos + 1.0 * AngleToVector(GetFacing(oPC));
                location lLoc = Location(GetArea(oPC), vPos, 0.0);
                oTemp = CreateObject(OBJECT_TYPE_ITEM, GetResRef(oItem), lLoc);
                SetItemStackSize(oTemp, nStack);
                oTemp = GetFirstItemInInventory(oPC);
                sTag = GetTag(oItem);
                while(GetIsObjectValid(oTemp) && !nFound)
                {
                    if(sTag == GetTag(oTemp))
                    {
                        nCount = GetItemStackSize(oTemp);
                        if(nCount > nStack)
                        {
                            nFound = TRUE;
                            SetItemStackSize(oTemp, (nCount - nStack));
                        }
                        else if(nCount == nStack)
                        {
                            nFound = TRUE;
                            DestroyObject(oTemp);
                        }
                        else
                        {
                            DestroyObject(oTemp);
                            nStack -= nCount;
                        }
                    }
                    oTemp = GetNextItemInInventory(oPC);
                }
            }
        }
    }
    else // it's gold
    {
        sMessage = "You cannot acquire any gold while scouting.";
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, TakeGoldFromCreature(nStack, oPC, TRUE));
        if(GetIsObjectValid(oOwner))
        {
            GiveGoldToCreature(oOwner, nStack);
        }
        else
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
            vector vPos = GetPosition(oPC);
            vPos = vPos + 1.0 * AngleToVector(GetFacing(oPC));
            location lLoc = Location(GetArea(oPC), vPos, 0.0);
            oTemp = CreateObject(OBJECT_TYPE_ITEM, "nw_it_gold001", lLoc);
            SetItemStackSize(oTemp, nStack);
        }
    }
    FloatingTextStringOnCreature(sMessage, oPC);
}

int wow_TurnModuleEventToItemEvent(int nModuleEvent)
{
    int nReturn;
    switch(nModuleEvent)
    {
        case X2_ITEM_EVENT_ACTIVATE:
        {
            nReturn = WOW_ITEM_EVENT_ONACTIVATE;
            break;
        }
        case X2_ITEM_EVENT_EQUIP:
        {
            nReturn = WOW_ITEM_EVENT_ONEQUIP;
            break;
        }
        case X2_ITEM_EVENT_UNEQUIP:
        {
            nReturn = WOW_ITEM_EVENT_ONUNEQUIP;
            break;
        }
        case X2_ITEM_EVENT_ONHITCAST:
        {
            nReturn = WOW_ITEM_EVENT_ONHITCAST;
            break;
        }
        case X2_ITEM_EVENT_ACQUIRE:
        {
            nReturn = WOW_ITEM_EVENT_ONACQUIRE;
            break;
        }
        case X2_ITEM_EVENT_UNACQUIRE:
        {
            nReturn = WOW_ITEM_EVENT_ONUNACQUIRE;
            break;
        }
    }
    return nReturn;
}

int wow_CheckForModuleItemEventOverride(object oPC, int nModuleEvent)
{
    int nEvent = wow_GetModuleItemEvent(oPC);
    nModuleEvent = wow_TurnModuleEventToItemEvent(nModuleEvent);
    return (nEvent & nModuleEvent);
}

int wow_GetAppearanceFromRace(object oPC)
{
    int nReturn = -1;
    int nRace = GetRacialType(oPC);
    switch(nRace)
    {
        case RACIAL_TYPE_DWARF:
        {
            nReturn = APPEARANCE_TYPE_DWARF;
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            nReturn = APPEARANCE_TYPE_ELF;
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            nReturn = APPEARANCE_TYPE_GNOME;
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            nReturn = APPEARANCE_TYPE_HALF_ELF;
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            nReturn = APPEARANCE_TYPE_HALFLING;
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            nReturn = APPEARANCE_TYPE_HALF_ORC;
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            nReturn = APPEARANCE_TYPE_HUMAN;
            break;
        }
    }
    if(nReturn == -1) nReturn = GetAppearanceType(oPC);
    return nReturn;
}

int wow_GetIsScoutingItem(object oItem)
{
    int nEvent = GetUserDefinedItemEventNumber();
    int nReturn = FALSE;
    string sTag = GetTag(oItem);
    switch(nEvent)
    {
        case X2_ITEM_EVENT_ACTIVATE:
        {
            if(sTag == "WOW_SCOUTING_ITEM") nReturn = TRUE;
            break;
        }
        case X2_ITEM_EVENT_EQUIP:
        {
            if(sTag == "WOW_SCOUTING_BITE" || sTag == "WOW_SCOUTING_CLAW" || sTag == "WOW_SCOUTING_CARMOR") nReturn = TRUE;
            break;
        }
        case X2_ITEM_EVENT_UNEQUIP:
        {
            if(sTag == "WOW_SCOUTING_BITE" || sTag == "WOW_SCOUTING_CLAW" || sTag == "WOW_SCOUTING_CARMOR") nReturn = TRUE;
            break;
        }
        case X2_ITEM_EVENT_ONHITCAST:
        {
            if(sTag == "WOW_SCOUTING_BITE" || sTag == "WOW_SCOUTING_CLAW" || sTag == "WOW_SCOUTING_CARMOR") nReturn = TRUE;
            break;
        }
        case X2_ITEM_EVENT_ACQUIRE:
        {
            if(sTag == "WOW_SCOUTING_BITE" || sTag == "WOW_SCOUTING_CLAW" || sTag == "WOW_SCOUTING_CARMOR") nReturn = TRUE;
            break;
        }
        case X2_ITEM_EVENT_UNACQUIRE:
        {
            if(sTag == "WOW_SCOUTING_BITE" || sTag == "WOW_SCOUTING_CLAW" || sTag == "WOW_SCOUTING_CARMOR") nReturn = TRUE;
            break;
        }
    }
    return nReturn;
}

int wow_GetIsPlayerScouting(object oPC)
{
    return GetLocalInt(oPC, "WOW_SCOUTING_SYSTEM");
}

void wow_SetPlayerScouting(object oPC)
{
    SetLocalInt(oPC, "WOW_SCOUTING_SYSTEM", TRUE);
}

void wow_DeletePlayerScouting(object oPC)
{
    DeleteLocalInt(oPC, "WOW_SCOUTING_SYSTEM");
    wow_DeleteScoutingClone(oPC);
    DeleteLocalInt(oPC, "WOW_MODULE_ITEM_EVENT");
    RemoveLocalEffect(oPC, "WOW_SCOUTING_INVISIBILITY_EFFECT");
    RemoveLocalEffect(oPC, "WOW_SCOUTING__INVISIBILITY_VFX_EFFECT");
}

int wow_CheckForModuleItemEvent(object oPC, int nEvent)
{
    return (wow_GetModuleItemEvent(oPC) & nEvent);
}

void wow_SetModuleItemEvent(object oPC, int nEvent)
{
    if(!wow_CheckForModuleItemEvent(oPC, nEvent))
    {
        int nCurrent = wow_GetModuleItemEvent(oPC);
        nCurrent = nCurrent | nEvent;
        SetLocalInt(oPC, "WOW_MODULE_ITEM_EVENT", nCurrent);
    }
}

int wow_GetModuleItemEvent(object oPC)
{
    return GetLocalInt(oPC, "WOW_MODULE_ITEM_EVENT");
}

void wow_DeleteModuleItemEvent(object oPC, int nEvent)
{
    if(wow_CheckForModuleItemEvent(oPC, nEvent))
    {
        int nCurrent = wow_GetModuleItemEvent(oPC);
        SetLocalInt(oPC, "WOW_MODULE_ITEM_EVENT", (nCurrent - nEvent));
    }
}

int wow_CheckModuleEventForScoutingSystem(int nSpell = FALSE)
{
    object oPC;
    int nReturn = FALSE;
    int nEvent = GetUserDefinedItemEventNumber();
    int nTemp;

    if(nSpell)
    {
        oPC = OBJECT_SELF;
        if(wow_GetIsPlayerScouting(oPC))
        {
            FloatingTextStringOnCreature("You cannot cast a spell while scouting.", oPC);
            nReturn = TRUE;
        }
    }
    else
    {
        object oItem, oTemp;
        int nStack;
        string sMessage;
        switch(nEvent)
        {
            case X2_ITEM_EVENT_ONHITCAST:
            {
                oPC = OBJECT_SELF;
                if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    FloatingTextStringOnCreature("You cannot engage in combat while you are scouting.", oPC);
                    wow_ReturnToBody(oPC);
                }
                break;
            }
            case X2_ITEM_EVENT_ACTIVATE:
            {
                oPC   = GetItemActivator();
                oItem = GetItemActivated();
                if(wow_GetIsScoutingItem(oItem))
                {
                    nReturn = TRUE;
                    if(wow_GetIsPlayerScouting(oPC)) wow_ReturnToBody(oPC);
                    else wow_StartScouting(oPC);
                }
                else if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    FloatingTextStringOnCreature("You cannot activate an item while scouting.", oPC);
                }
                break;
            }
            case X2_ITEM_EVENT_EQUIP:
            {
                oPC = GetPCItemLastEquippedBy();
                oItem = GetPCItemLastEquipped();
                if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    if(!wow_CheckForModuleItemEventOverride(oPC, nEvent))
                    {
                        FloatingTextStringOnCreature("You cannot equip any items while scouting.", oPC);
                        AssignCommand(oPC, ClearAllActions(TRUE));
                        AssignCommand(oPC, ActionDoCommand(wow_SetModuleItemEvent(oPC, WOW_ITEM_EVENT_ONUNEQUIP)));
                        AssignCommand(oPC, ActionUnequipItem(oItem));
                    }
                    else
                    {
                        wow_DeleteModuleItemEvent(oPC, WOW_ITEM_EVENT_ONEQUIP);
                    }
                }
                break;
            }
            case X2_ITEM_EVENT_UNEQUIP:
            {
                oPC    = GetPCItemLastUnequippedBy();
                oItem  = GetPCItemLastUnequipped();
                if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    if(!wow_CheckForModuleItemEventOverride(oPC, nEvent))
                    {
                        nTemp = wow_GetSlotByItem(oPC, oItem);
                        if(nTemp != -1)
                        {
                            FloatingTextStringOnCreature("You cannot unequip any items while scouting.", oPC);
                            AssignCommand(oPC, ClearAllActions(TRUE));
                            AssignCommand(oPC, ActionDoCommand(wow_SetModuleItemEvent(oPC, WOW_ITEM_EVENT_ONEQUIP)));
                            AssignCommand(oPC, ActionEquipItem(oItem, nTemp));
                        }
                    }
                    else
                    {
                        wow_DeleteModuleItemEvent(oPC, WOW_ITEM_EVENT_ONUNEQUIP);
                    }
                }
                break;
            }
            case X2_ITEM_EVENT_ACQUIRE:
            {
                oPC = GetModuleItemAcquiredBy();
                oItem  = GetModuleItemAcquired();
                nStack = GetModuleItemAcquiredStackSize();
                oTemp = GetModuleItemAcquiredFrom();
                if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    if(!wow_CheckForModuleItemEventOverride(oPC, nEvent))
                    {
                        wow_SetModuleItemEvent(oPC, WOW_ITEM_EVENT_ONUNACQUIRE);
                        wow_RestoreItemsAcquiredDuringScouting(oPC, oTemp, oItem, nStack);
                    }
                    else
                    {
                        wow_DeleteModuleItemEvent(oPC, WOW_ITEM_EVENT_ONACQUIRE);
                    }
                }
                break;
            }
            case X2_ITEM_EVENT_UNACQUIRE:
            {
                oPC = GetModuleItemLostBy();
                oItem  = GetModuleItemLost();
                if(wow_GetIsPlayerScouting(oPC))
                {
                    nReturn = TRUE;
                    if(!wow_CheckForModuleItemEventOverride(oPC, nEvent))
                    {
                        FloatingTextStringOnCreature("You cannot unacquire items while scouting.", oPC);
                        wow_SetModuleItemEvent(oPC, WOW_ITEM_EVENT_ONACQUIRE);
                        wow_RetrieveItemDroppedWhileScouting(oPC, oItem);
                    }
                    else
                    {
                        wow_DeleteModuleItemEvent(oPC, WOW_ITEM_EVENT_ONUNACQUIRE);
                    }
                }
                break;
            }
        }
    }
    return nReturn;
}
