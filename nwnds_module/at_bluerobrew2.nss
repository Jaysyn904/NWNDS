//::///////////////////////////////////////////////
//:: FileName at_bluerobrew2
//:://////////////////////////////////////////////
//::///////////////////////////////////////////////
//:: Takes the Halfling Leader's Ear from the PC
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/25/02 8:39:07 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
void main()
{

object oPC = GetPCSpeaker();
object oItem;

if (GetItemPossessedBy(oPC, "di_RedEar")!= OBJECT_INVALID)
   {
   oItem = GetItemPossessedBy(oPC, "di_RedEar");

   if (GetIsObjectValid(oItem))
      DestroyObject(oItem);

   RewardPartyGP(1000, oPC, FALSE);
   RewardPartyXP(2000, GetPCSpeaker());

   }
else
   {
   AssignCommand(GetObjectByTag("TemplarMaddox"), ActionSpeakString("I must have the ear as proof"));

   }

}

