// Script by: Nyadarus
// Created:   September 2003
// Used in:   The Hermit Quest
// Purpose:   To detemine whether or not the PC has the Obsidian Orb,
//            which is obtained by killing Kimzahn Pyrering, for
//            the purpose of rewarding quest xp.

#include "nw_i0_tool"
int StartingConditional()
{
    if(!HasItem(GetPCSpeaker(), "QST_OOBSORB01"))
        {
        return FALSE;
        }
    else
        {
        return TRUE;
        }
}
