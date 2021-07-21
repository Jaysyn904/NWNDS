//::///////////////////////////////////////////////
//:: FileName bj_playtest2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/2002 2:55:42 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables to see if the dealer is playing a game currently
    if(!(GetLocalInt(OBJECT_SELF, "nPlayingBlackJack") == 1))
        return FALSE;

    return TRUE;
}
