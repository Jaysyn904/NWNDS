//::///////////////////////////////////////////////
//:: zep_demi_bone_hb
//:: Legacy OnHeartbeat event for the CEP demilich
//:: Pile of Bones placeable (found under the custom
//:: placeables: "Dungeons->Tombs, Grave Markers ->
//:: Pile of Bones").
//:://////////////////////////////////////////////
/*
    This script is no longer needed for demiliches,
    but is retained for backwards-compatibility, and
    in case someone is interested in changing the
    perception range of demilich placeables.
*/
//:://////////////////////////////////////////////
//:: Created by: Loki Hakanin
//:: Created on: April 21, 2004
//:://////////////////////////////////////////////
//:: Modified by: The Krit
//:: Modified on: May 10, 2007
//:://////////////////////////////////////////////


#include "zep_inc_demi"


void main()
{
    // Find the distance to the nearest enemy.
    float fDistance =  GetDistanceToObject(
            GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY,
                               OBJECT_SELF, 1, CREATURE_TYPE_IS_ALIVE, TRUE));

    // Is the nearest enemy within perception range?
    if ( 0.0 <= fDistance  &&  fDistance <= ZEP_DEMI_PERC_RANGE )
    {
        // Respawn the demilich.
        ZEPDemilichFromBones(OBJECT_SELF, GetLocalString(OBJECT_SELF, ZEP_DEMI_LOCAL_RESREF), TRUE);
        // Destroy the placeables.
        object oDust = GetLocalObject(OBJECT_SELF, ZEP_DEMI_LOCAL_AMBIENT);
        if ( oDust != OBJECT_INVALID )
            DestroyObject(oDust);
        else
            // Probably a legacy placeable. Destroy nearest dust cloud.
            DestroyObject(GetNearestObjectByTag("zep_demi_dust"));
        DestroyObject(OBJECT_SELF);
    }
}

