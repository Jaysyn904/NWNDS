//::///////////////////////////////////////////////
//:: FileName sc_makecycbridge
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/29/2002 12:27:09 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) > 11))
        return FALSE;

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "nKilledCyclops") == 1))
        return FALSE;

    return TRUE;
}
