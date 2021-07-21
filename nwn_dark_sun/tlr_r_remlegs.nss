//::///////////////////////////////////////////////
//:: TAILOR: removal: arms
//::                      onconv mil_tailor
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: bloodsong
//-- cobbled from milambus' tailor stuff
//:://////////////////////////////////////////////



void main()
{
      object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
      int iSourceValue = 0;
      object oCurrent, oNew;

      object oSource = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);

        //-- step zero: create a duplicate to start modifying.
        oNew = CopyItem(oSource, OBJECT_SELF);



        // Right Thigh
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LTHIGH, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Shin
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHIN, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Foot
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOOT, iSourceValue, TRUE);
        DestroyObject(oCurrent);


        // LEFT Thigh
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RTHIGH, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Shin
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHIN, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Foot
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOOT, iSourceValue, TRUE);
        DestroyObject(oCurrent);

    //-- step last: destroy the original clothing, and put on the new

    DestroyObject(oSource);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oNew, INVENTORY_SLOT_CHEST));


}
