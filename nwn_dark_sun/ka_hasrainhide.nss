//::///////////////////////////////////////////////
//:: FileName ka_hasrainhide
/*
    
    Detects the presence of a rain drake hide
    
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
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "crft_rain_dr_hd");
if(GetIsObjectValid(oItemToTake) != 0)
    return TRUE;
// else
return FALSE;
}