#include "spawn_main"

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        int nPCCount = GetLocalInt(OBJECT_SELF, "PCIsInArea");
        SetLocalInt(OBJECT_SELF, "PCIsInArea", nPCCount - 1);
        nPCCount--;
        if (nPCCount < 1)
        {
            int iObjectType;
            object oItem = GetFirstObjectInArea();
            while (GetIsObjectValid(oItem))
            {
                iObjectType = GetObjectType(oItem);
                switch(iObjectType)
                {
                    case OBJECT_TYPE_PLACEABLE: {
                                                    if (GetTag(oItem) == "Body Bag")
                                                        DestroyObject(oItem);
                                                    break;
                                                }
                    case OBJECT_TYPE_ITEM:      {
                                                    DestroyObject(oItem);
                                                    break;
                                                }
                }
                oItem = GetNextObjectInArea();
            }
            Spawn();
        }
    }
}
