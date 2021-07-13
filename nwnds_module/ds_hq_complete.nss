// Script by: Nyadarus
// Created:   September 2003
// Used in:   The Hermit Quest
// Purpose:   Used to reward PCs for completing The Hermit Questas well as
//              remove the Obsidian Orb

#include "nw_i0_tool"

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "QST_OOBSORB01");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

RewardPartyXP(1500, oPC, TRUE);

SetLocalInt(oPC, "nHQJob", 4);

}
