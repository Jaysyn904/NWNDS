//::///////////////////////////////////////////////
//:: FileName sc_liecheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/14/2002 1:21:49 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_CHARISMA) > 11))
		return FALSE;

	// Perform skill checks
	if(!(AutoDC(DC_MEDIUM, SKILL_PERSUADE, GetPCSpeaker())))
		return FALSE;

	return TRUE;
}
