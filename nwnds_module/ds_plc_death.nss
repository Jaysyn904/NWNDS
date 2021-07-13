//::////////////////////////////////////////////////////////////////////////////
//:: Name Faction Placeables/s v1
//:: FileName ds_plc_death
//:: Copyright (c) 2009 Athas Reborn
//::////////////////////////////////////////////////////////////////////////////
/*
    Makes placables faction dislike oKiller
*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: DM Heatstroke
//:: Created On: 5th October, 2009
//:: Event Used: OnDeath event of a placable
//::////////////////////////////////////////////////////////////////////////////

#include "x2_inc_compon"

// -----------------------------------------------------------------------------
//  CONSTANTS - Settings below
// -----------------------------------------------------------------------------

const int   DO_CRAFT_DROP         = TRUE;  // Drop default Bioware crafting item?

// -----------------------------------------------------------------------------
//  PROTOTYPES
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//  FUNCTIONS
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//  MAIN
// -----------------------------------------------------------------------------


void main()
    {
        object oSelf = OBJECT_SELF;
        object oKiller = GetLastKiller();

        if (!GetIsPC(oKiller)) return;

        while (GetIsObjectValid(GetMaster(oKiller)))
            {
                oKiller=GetMaster(oKiller);
            }

        if(GetIsObjectValid(oKiller))
            {
                AdjustReputation(oKiller, OBJECT_SELF, -5);
                AdjustAlignment (oKiller, ALIGNMENT_CHAOTIC, 5);
            }

        if(DO_CRAFT_DROP)
            craft_drop_placeable();
    }

