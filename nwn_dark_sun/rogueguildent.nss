//::///////////////////////////////////////////////
//:: FileName rogueguildent
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/10/02 9:51:35 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's class
	int iPassed = 0;
	if(GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker()) >= 3)
		iPassed = 1;
	if(iPassed == 0)
		return FALSE;

	return TRUE;
}
