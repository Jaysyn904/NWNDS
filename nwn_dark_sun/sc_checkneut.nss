//::///////////////////////////////////////////////
//:: FileName sc_checkneut
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/17/2002 4:00:39 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's alignment
	if(GetAlignmentGoodEvil(GetPCSpeaker()) != ALIGNMENT_NEUTRAL)
		return FALSE;

	return TRUE;
}
