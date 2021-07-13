//::///////////////////////////////////////////////
//:: FileName hs_bluff_med
//:://////////////////////////////////////////////

#include "nw_i0_tool"

int StartingConditional()
{

    // Perform skill checks
    if(!(AutoDC(DC_MEDIUM, SKILL_BLUFF, GetPCSpeaker())))
        return FALSE;

    return TRUE;
}
