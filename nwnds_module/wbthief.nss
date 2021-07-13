//::///////////////////////////////////////////////
//:: FileName wbthief
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/10/02 11:21:45 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "thievesquests") == 1))
        return FALSE;
    object oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "FAC_ITPRNG_THIEF");
    if(GetIsObjectValid(oItemToTake) == TRUE)
        return FALSE;
    return TRUE;
}
