//::///////////////////////////////////////////////
//:: FileName sc_va1check
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/30/2002 12:41:17 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "VA") == 1))
		return FALSE;

	return TRUE;
}
