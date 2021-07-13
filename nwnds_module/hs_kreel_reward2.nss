//::///////////////////////////////////////////////
//:: FileName hs_kreel_reward2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/7/2002 1:34:28 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetFirstItemInInventory(oPC);

while (GetIsObjectValid(oItem))
   {
   if (GetTag(oItem)=="MatthaisEar") DestroyObject(oItem);

   oItem = GetNextItemInInventory(oPC);
   }

{
  // Give the speaker the items
            int nVeggie = d12();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("thescorcher", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("heartofdarkness", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("thedoomsword", GetPCSpeaker(), 1);
                //% chance
            else if ((nVeggie > 3) && (nVeggie <= 4))
                CreateItemOnObject("enforcer", GetPCSpeaker(), 1);
             //% chance
            else if ((nVeggie > 4) && (nVeggie <= 5))
                CreateItemOnObject("shiveringedge", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 5) && (nVeggie <= 6))
                CreateItemOnObject("clawofdregoth", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 7))
                CreateItemOnObject("daslechoblade", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 7) && (nVeggie <= 8))
                CreateItemOnObject("liarsblade", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 9))
                CreateItemOnObject("deadlandsrapier", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 9) && (nVeggie <= 10))
                CreateItemOnObject("shadowsedge", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 11))
                CreateItemOnObject("barbedboneblade", GetPCSpeaker(), 1);
            //% chance
            else if (nVeggie > 11)
                CreateItemOnObject("touchoftheblack", GetPCSpeaker(), 1);
        }}
