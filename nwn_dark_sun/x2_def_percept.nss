//::///////////////////////////////////////////////
//:: Name x2_def_percept
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Perception script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

// Necromancy  101 /////////
#include "_inc_battlecry_"
////////////////////////////


void main()
{
    ExecuteScript("prc_npc_percep", OBJECT_SELF);
    ExecuteScript("nw_c2_default2", OBJECT_SELF);

    // Necromancy 101 ///
    DoBattleCry();
    /////////////////////
}
