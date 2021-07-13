//::///////////////////////////////////////////////
//:: Name: OnPerc_Martosa
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Martosa the Thug's On Perception script
*/
//:://////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: January 19 2012
//:://////////////////////////////////////////////

// Necromancy  101 /////////
#include "_inc_battlecry_"
////////////////////////////


void main()
{
    ExecuteScript("prc_npc_percep", OBJECT_SELF);
    ExecuteScript("nw_c2_default2", OBJECT_SELF);
    ActionSpeakString("An intruder!  Get'em boys!");

    // Necromancy 101 ///
    DoBattleCry();
    /////////////////////
}
