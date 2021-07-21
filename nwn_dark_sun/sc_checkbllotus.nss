//::///////////////////////////////////////////////
//:: FileName sc_checkbllotus
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/30/2002 2:49:25 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "bluelotus"))
		return FALSE;

	return TRUE;
}
