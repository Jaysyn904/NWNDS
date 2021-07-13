//::///////////////////////////////////////////////
//:: FileName at_karenrewnor
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/26/2002 2:12:14 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(),500);

    // Give the speaker the items
    CreateItemOnObject("AR_ITMRNG_KARLEN", GetPCSpeaker(), 1);

}
