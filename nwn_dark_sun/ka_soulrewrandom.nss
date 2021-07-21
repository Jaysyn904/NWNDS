//::///////////////////////////////////////////////
//:: Filename KA_SoulRewRandom
/*
      Quest:  Lost Souls

      Rewards the PC with 1500 XP & a random
      magical item
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Kyriani Agriviar
//:: Created On: 10/10/2002 3:49:43 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
// Give the speaker some XP
    RewardPartyXP(1500, GetPCSpeaker());
  // Give the speaker the items
            int nVeggie = d6();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("AR_ITMCLK_TRAVIS", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("AR_ITMRNG_NIGHTF", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("AR_ITPRNG_RAGE", GetPCSpeaker(), 1);
                //% chance
            else if ((nVeggie > 3) && (nVeggie <= 4))
                CreateItemOnObject("AR_ITPNCK_HOCEAN", GetPCSpeaker(), 1);
             //% chance
            else if ((nVeggie > 4) && (nVeggie <= 5))
                CreateItemOnObject("AR_ITMNCK_GALIAN", GetPCSpeaker(), 1);
            //% chance
            else if (nVeggie > 5)
                CreateItemOnObject("AR_ITMBLT_UNDYIN", GetPCSpeaker(), 1);
        }
