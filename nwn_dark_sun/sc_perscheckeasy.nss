//::///////////////////////////////////////////////
//:: FileName sc_perscheckeasy
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/20/2002 12:10:01 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Perform skill checks
    if(!(AutoDC(DC_EASY, SKILL_PERSUADE, GetPCSpeaker())))
        return FALSE;

    return TRUE;
}
