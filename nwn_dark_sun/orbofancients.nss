//::///////////////////////////////////////////////
//:: FileName orbofancients
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/9/02 6:37:25 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "OrboftheAncients"))
		return FALSE;

	return TRUE;
}
