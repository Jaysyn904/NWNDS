//::///////////////////////////////////////////////
//:: FileName sc_chkgotrugxp
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/24/2002 11:04:18 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nGotRugXP") == 1))
		return FALSE;

	return TRUE;
}
