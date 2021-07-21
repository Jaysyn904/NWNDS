//::///////////////////////////////////////////////
//:: Name: OnPerc_Sarrick
//:: Copyright (c) 2012 Athas Reborn
//:://////////////////////////////////////////////
/*
    Sarrick the Theif's On Perception script
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
    ActionSpeakString("Lookie what we've got here.  Take them out!");

    // Necromancy 101 ///
    DoBattleCry();
    /////////////////////
}
