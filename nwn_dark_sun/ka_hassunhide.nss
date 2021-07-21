//::///////////////////////////////////////////////
//:: FileName ka_hassunhide
/*
    
    Detects the presence of a sun drake hide
    
*/    
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Kiriani Agriviar
//:: Created On: 
//:://////////////////////////////////////////////


#include "nw_i0_tool"

int StartingConditional()
{
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "crft_sun_dr_hd");
if(GetIsObjectValid(oItemToTake) != 0)
    return TRUE;
// else
return FALSE;
}


