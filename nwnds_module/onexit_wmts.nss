#include "spawn_main"

void CleanUpArea()
{
    if(GetLocalInt(OBJECT_SELF, SPAWN_PCS_IN_AREA) == 0)
    {
        object oItem = GetFirstObjectInArea();
        int iObjectType;
        while (GetIsObjectValid(oItem))
        {
            iObjectType = GetObjectType(oItem);
            switch(iObjectType)
            {
                case OBJECT_TYPE_PLACEABLE:
                    if (GetTag(oItem) == "Body Bag")
                    DestroyObject(oItem);
                    break;
                case OBJECT_TYPE_ITEM:
                    DestroyObject(oItem);
                    break;
            }
            oItem = GetNextObjectInArea();
        }
    }
}

void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC)) return;

    SetObjectVisualTransform(oPC, OBJECT_VISUAL_TRANSFORM_SCALE, 1.0f);

    Spawn_OnAreaExit();
    if(GetLocalInt(OBJECT_SELF, SPAWN_PCS_IN_AREA) == 0) DelayCommand(300.0, CleanUpArea());
    //NC:EDIT
    //Added to enable Defiling Aura for NPC's
    object oEntering = GetExitingObject();
    SetLocalInt(GetArea(oEntering), "X2_L_WILD_MAGIC", 0);
}

