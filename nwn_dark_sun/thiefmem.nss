//::///////////////////////////////////////////////
//:: FileName thiefmem
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/11/02 12:31:39 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "thievesquests") > 4))
		return FALSE;

	return TRUE;
}
