//::///////////////////////////////////////////////
//:: FileName at_karenrewbonus
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/22/2002 10:50:31 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(),500);

    // Give the speaker the items
    CreateItemOnObject("AR_HELM_LESTONS", GetPCSpeaker(), 1);

}
