//::///////////////////////////////////////////////
//:: TAILOR: right 2 left
//::                     onconv mil_tailor
//:://////////////////////////////////////////////
/*
   check our local string for what we're swapping
   "SYMMETRYTYPE" =
        arms
        legs
        both

*/
//:://////////////////////////////////////////////
//:: Created By: bloodsong
//-- cobbled from lots of milambus's routines
//:://////////////////////////////////////////////



void main()
{
    string sSym = GetLocalString(OBJECT_SELF, "SYMMETRYTYPE");

    int iSourceValue;  //-- read from parts
    object oNew, oCurrent; //-- items we'll iterate through
    object oSource = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);

    //-- step zero: create a duplicate to start modifying.
    oNew = CopyItem(oSource, OBJECT_SELF);

    //-- step one: copy arms
    if (sSym == "arms" || sSym == "both")
    {
        //--A: get #s from one side to the other

       // LEFT Bicep
       iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LBICEP);
       oCurrent = oNew;
       oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RBICEP, iSourceValue, TRUE);
       DestroyObject(oCurrent);

        // LEFT Forearm
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOREARM);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOREARM, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Hand
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LHAND);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RHAND, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Shoulder
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHOULDER);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHOULDER, iSourceValue, TRUE);
        DestroyObject(oCurrent);

    }  //-- end ARMS copying


    if (sSym == "legs" || sSym == "both")
    {
       //-- same thing, for leg parts
        // LEFT Thigh
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LTHIGH);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RTHIGH, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Shin
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LSHIN);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RSHIN, iSourceValue, TRUE);
        DestroyObject(oCurrent);

        // LEFT Foot
        iSourceValue = GetItemAppearance(oSource, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LFOOT);
        oCurrent = oNew;
        oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_RFOOT, iSourceValue, TRUE);
        DestroyObject(oCurrent);

    }  //-- end LEGS



    //-- step last: destroy the original clothing, and put on the new

    DestroyObject(oSource);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oNew, INVENTORY_SLOT_CHEST));

}
