//::///////////////////////////////////////////////
//:: Name       ASG Spawnkit User Config File.
//:: FileName   asg_cfg_spawkit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Version 1.3

*/
//:://////////////////////////////////////////////
//:: Created By:    Donny L. Wilbanks
//:: Created On:    8/11/03
//:://////////////////////////////////////////////

void main()
{
    // ***************************
    // *
    // * Automapper
    // *
    // * Automapping can be turned on or off, changing the TRUE or FALSE.
    // * Defualt is TRUE;
    int iAutomapper = TRUE;
    // ***************************
    // *
    // * Area Discription
    // *
    // * This will give a short area discription when the player enters the area
    // * Default is FALSE;
    int iASG_SKIT_ADISCR = FALSE;
    // ***************************
    // *
    // * Global Script Related
    // *
    // * This string is a good place to place scripts that you may wish to have
    // * fire off on OnEnter and OnExit events. by Defualt these have the words
    // * SCRIPT_INVALID, wich tells the spawn kit not to exicute a custom script
    // * replace with your own script name for custom script event. The script
    // * event will exicute at the end of the Spawn Scripts.
    string sOnExit = "SCRIPT_INVALID";
    string sOnEnter = "SCRIPT_INVALID";
    // *******************************
    // *
    // * Save Info
    // *
    SetLocalInt(GetModule(),"ASG_SKIT_ADISCR",iASG_SKIT_ADISCR);
    SetLocalInt(GetModule(),"ASG_SPAWKIT_AUTOMAPPER",iAutomapper);
    SetLocalString(GetModule(),"ASG_SPKIT_ONENTER",sOnEnter);
    SetLocalString(GetModule(),"ASG_SPKIT_ONEXIT",sOnExit);
}
