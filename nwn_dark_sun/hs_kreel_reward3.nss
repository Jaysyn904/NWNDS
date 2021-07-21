//::///////////////////////////////////////////////
//:: FileName hs_kreel_reward3
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
            int nVeggie = d4();
            //% chance
            if ((nVeggie > 0) && (nVeggie <= 1))
                CreateItemOnObject("spectralcloak", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 1) && (nVeggie <= 2))
                CreateItemOnObject("githskincloak", GetPCSpeaker(), 1);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 3))
                CreateItemOnObject("torakswrap", GetPCSpeaker(), 1);
            //% chance
            else if (nVeggie > 3)
                CreateItemOnObject("travisscloak", GetPCSpeaker(), 1);
        }}
