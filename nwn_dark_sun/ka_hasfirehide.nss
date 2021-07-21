//::///////////////////////////////////////////////
//:: FileName ka_hasfirehide
/*
    
    Detects the presence of a fire drake hide
    
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
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "crft_fire_dr_hd");
if(GetIsObjectValid(oItemToTake) != 0)
    return TRUE;
// else
return FALSE;
}


