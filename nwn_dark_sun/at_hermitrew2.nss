//::///////////////////////////////////////////////
//:: FileName AT_HermitRew2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2002 1:34:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
  // Give the speaker the items
            int nVeggie = d2();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("AR_WMGST_OASIS", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("AR_WMGST_GFLAME", GetPCSpeaker(), 1);
}
