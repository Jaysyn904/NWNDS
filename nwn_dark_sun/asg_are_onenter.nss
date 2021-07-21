//::///////////////////////////////////////////////
//:: Name       Spawn Kit On Area Enter
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The idea here is create a *wrapper* place all of your Area On Enter
    scripts here. This makes it a bit more effecient when attempting to
    update the individual scripts (as I found out trying to update the ACME
    module.

*/
//:://////////////////////////////////////////////
//:: Created By: Donny Wilbanks
//:: Created On: 09/17/04
//:://////////////////////////////////////////////

void main()
{
    ExecuteScript("asg_a_onenter",OBJECT_SELF);
}

