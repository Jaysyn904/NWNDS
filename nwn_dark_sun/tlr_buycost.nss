//::///////////////////////////////////////////////
//:: Tailoring - Buy Cost
//:: tlr_buycost.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//-- bloodsong base cost and xer for adjusting price ranges
//:://////////////////////////////////////////////
int StartingConditional()
{
    int BaseCost = 0; //-- change to raise prices
    float BaseMultiplyer = 2.0; //-- milamber's default


    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
    int iCost = BaseCost + FloatToInt((IntToFloat(GetGoldPieceValue(oItem)) * BaseMultiplyer));
    int iAC = GetItemACValue(oItem);

    string sOut = "Cost: " + IntToString(iCost) + " gold.\n";
    sOut += "AC: " + IntToString(iAC) + "\n";
    sOut += "(Note: Armor feats my be required to wear this.)\n";
    sOut += "\nDo you wish to continue with the purchase?";

    SetCustomToken(9876, sOut);
    //-- this is called to check if the pc has the money to buy
    SetLocalInt(OBJECT_SELF, "CURRENTPRICE", iCost);

    return TRUE;
}
