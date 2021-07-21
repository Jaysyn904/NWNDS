//::///////////////////////////////////////////////
//:: FileName sc_haslongbow
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/1/02 2:42:07 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "NW_WBWLN001");
if(GetIsObjectValid(oItemToTake) != 0)
        return TRUE;
return FALSE;

}
