//::///////////////////////////////////////////////
//:: FileName sc_chktakedonati
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/11/2002 2:08:17 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nTakeDonations") == 1))
		return FALSE;

	return TRUE;
}
