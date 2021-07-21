/* areacleanup script
checks the area that it was called for for the presence of pc's,
if there aren't any then it systematically cleans up the area
of extra encounters and loot
*/
void debug(string dstring)
{
    int isdebug = 0;
    if (isdebug == 1)
        SendMessageToPC(GetFirstPC(), dstring);
}



void TrashObject(object oObject)
{
    debug(GetTag(oObject) + " is in trashobject");
    if (GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE) {
        object oItem = GetFirstItemInInventory(oObject);
        while (GetIsObjectValid(oItem))
        {
            debug(GetTag(oItem) + " is in trashobject");
            TrashObject(oItem);
           oItem = GetNextItemInInventory(oObject);
        }
    }
    else
        debug(GetTag(oObject) + " failed to pass as inventory type placeable is getting destroyed");
    AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE, FALSE));
    DestroyObject(oObject);
}

void main()
{
    object oPC;
    oPC = GetFirstPC();
    object tPC = oPC;
    debug("We're starting area cleanup");
    while (oPC != OBJECT_INVALID)
    {
        if (OBJECT_SELF == GetArea(oPC))
            return;
        else oPC = GetNextPC();
    }
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while (oObject != OBJECT_INVALID)
    {
        debug(GetTag(oObject));
        if (GetIsEncounterCreature(oObject) && FindSubString(GetTag(oObject), "_BOSS") > -1)
            DestroyObject(oObject);
        int iObjectType = GetObjectType(oObject);
        switch (iObjectType) {
        case OBJECT_TYPE_PLACEABLE:
            if (GetTag(oObject) != "BodyBag") {
                break; }
        case OBJECT_TYPE_ITEM:
            TrashObject(oObject); }
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }
}
