//::///////////////////////////////////////////////
//:: FileName sc_checkarineck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/6/2002 11:24:18 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "AristiphanalesNecklace"))
		return FALSE;

	return TRUE;
}
