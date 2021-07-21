#include "nw_i0_tool"

int StartingConditional()
{
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "helmurik");
if(GetIsObjectValid(oItemToTake) != 0)
    return TRUE;
// else
return FALSE;
}
