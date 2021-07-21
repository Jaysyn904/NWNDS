//::///////////////////////////////////////////////
//:: FileName sc_tookkeythenst
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/29/2002 6:43:50 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nTookCharKey") == 1))
        return FALSE;
    if(!(GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRY" + "jt_thecircle") == 1))
        return FALSE;

    return TRUE;
}
