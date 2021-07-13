//::///////////////////////////////////////////////
//:: FileName hs_kreel_reward1
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
            int nVeggie = d6();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("iconicringofinte", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("iconicringofwisd", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("iconicringofcons", GetPCSpeaker(), 1);
                //% chance
            else if ((nVeggie > 3) && (nVeggie <= 4))
                CreateItemOnObject("iconicringofdext", GetPCSpeaker(), 1);
             //% chance
            else if ((nVeggie > 4) && (nVeggie <= 5))
                CreateItemOnObject("iconicringofs", GetPCSpeaker(), 1);
            //% chance
            else if (nVeggie > 5)
                CreateItemOnObject("iconicringofchar", GetPCSpeaker(), 1);
        }}
