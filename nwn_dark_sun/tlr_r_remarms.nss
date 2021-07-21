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


       // Right Bicep
       oCurrent = oNew;
       oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LBICEP, iSourceValue, TRUE);
       DestroyObject(oCurrent);

        // Right Forearm
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOREARM, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Hand
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LHAND, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // Right Shoulder
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHOULDER, iSourceValue, TRUE);
        DestroyObject(oCurrent);

       // LEFT Bicep
       oCurrent = oNew;
       oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RBICEP, iSourceValue, TRUE);
       DestroyObject(oCurrent);

        // LEFT Forearm
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOREARM, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Hand
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RHAND, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Shoulder
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHOULDER, iSourceValue, TRUE);
        DestroyObject(oCurrent);


    //-- step last: destroy the original clothing, and put on the new

    DestroyObject(oSource);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oNew, INVENTORY_SLOT_CHEST));


}
