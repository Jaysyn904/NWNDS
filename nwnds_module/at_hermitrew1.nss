//::///////////////////////////////////////////////
//:: FileName AT_HermitRew1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2002 1:34:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
  // Give the speaker the items
            int nVeggie = d6();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("AR_ITMRNG_INT03", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("AR_ITMRNG_WIS03", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("AR_ITMRNG_CON03", GetPCSpeaker(), 1);
                //% chance
            else if ((nVeggie > 3) && (nVeggie <= 4))
                CreateItemOnObject("AR_ITMRNG_DEX03", GetPCSpeaker(), 1);
             //% chance
            else if ((nVeggie > 4) && (nVeggie <= 5))
                CreateItemOnObject("AR_ITMRNG_STR03", GetPCSpeaker(), 1);
            //% chance
            else if (nVeggie > 5)
                CreateItemOnObject("AR_ITMRNG_CHA03", GetPCSpeaker(), 1);
        }
