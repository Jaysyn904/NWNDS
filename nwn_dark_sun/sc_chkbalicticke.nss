//::///////////////////////////////////////////////
//:: FileName sc_chkbalicticke
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/17/2002 11:40:52 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!CheckPartyForItem(GetPCSpeaker(), "BalicIslandTicket"))
		return FALSE;

	return TRUE;
}
