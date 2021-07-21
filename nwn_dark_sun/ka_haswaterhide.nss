//::///////////////////////////////////////////////
//:: FileName ka_haswaterhide
/*
    
    Detects the presence of a water drake hide
    
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
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "crft_water_dr_hd");
if(GetIsObjectValid(oItemToTake) != 0)
    return TRUE;
// else
return FALSE;
}


