//::///////////////////////////////////////////////
//:: FileName sc_isfirsttalk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/27/02 11:23:36 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "DydrinaFirstTimeTalked") == 0))
        return FALSE;
    if(GetHitDice(GetPCSpeaker()) > 12)
        return FALSE;

    return TRUE;
}
