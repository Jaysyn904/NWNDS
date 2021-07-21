//::///////////////////////////////////////////////
//:: FileName sc_bheartcheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/20/2002 4:04:33 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QST_BANDITHEART");
if(GetIsObjectValid(oItemToTake) != 0)
        return TRUE;
return FALSE;
}
