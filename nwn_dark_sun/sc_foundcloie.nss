//::///////////////////////////////////////////////
//:: FileName sc_foundcloie
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 11:32:12 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "Cloie");
if(!GetIsObjectValid(oItemToTake) != 0)
    return FALSE;
if(GetLocalInt(GetPCSpeaker(),"DydrinaFirstTimeTalked") != 1)
    return FALSE;
if(GetHitDice(GetPCSpeaker()) > 12)
    return FALSE;
// else
return TRUE;
}
