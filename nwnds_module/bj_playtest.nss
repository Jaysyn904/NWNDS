//::///////////////////////////////////////////////
//:: FileName bj_playtest
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/2002 2:54:00 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables to see if the Dealer is playing black jack currently.
    if(!(GetLocalInt(OBJECT_SELF, "nPlayingBlackJack") != 1))
        return FALSE;

    return TRUE;
}
