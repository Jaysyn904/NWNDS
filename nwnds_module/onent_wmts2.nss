#include "spawn_functions"
#include "tgdc_explore_inc"
#include "ar_db_main"


void main()
{
    object oEntering = GetEnteringObject();
    string sTag = GetTag(oEntering);

    SetObjectVisualTransform(oEntering, OBJECT_VISUAL_TRANSFORM_SCALE, 0.5f);

    //NC:EDIT
    //added to enable defiling aura on NPC's
    //7-3-06
    object oArea = GetArea(oEntering);
    SetLocalInt(oArea, "X2_L_WILD_MAGIC", 1);
    //NC:EDIT

    //NC:EDIT
    // added arsx area index to area
    SetLocalInt(oArea,ARSX_AREA_INDEX,ARSX_IndexArea(oArea));

    //Heatstroke's Edit
    //Added code to enable player exploration
    PlayerExplore(oEntering, 0);

    // Spawn_OnAreaEnter() can take three arguments - the name of the heartbeat
    // script to execute, the heartbeat duration, and a delay for the first
    // heartbeat.  They default to spawn_sample_hb, 6.0, and 0.0 respectively; as
    // if it were called like:
    Spawn_OnAreaEnter( "spawn_sample_hb", 6.0, 0.0 );

}

