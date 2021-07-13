//::///////////////////////////////////////////////
//:: Name       Spawn Kit On Area Exit
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The idea here is create a *wrapper* place all of your Area On Exit
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
    ExecuteScript("asg_a_onexit",OBJECT_SELF);
    {
    float cleanupdelay = 30.0;  //if you change this it alters how long before
    // the area cleans up, if you do change it INCLUDE THE DECIMAL, or it won't
    // work
    if(!GetIsPC(GetExitingObject()) ) {
        return; }
    object oPC = GetExitingObject();
    if (!GetIsPC(oPC))
        return;
    oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (OBJECT_SELF == GetArea(oPC))
            return;
        else oPC = GetNextPC();
    }
    DelayCommand(cleanupdelay, ExecuteScript("areacleanup", OBJECT_SELF));

   {
    // Get the creature who triggered this event.
    object oPC = GetExitingObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Destroy an object (not fully effective until this script ends).
    DestroyObject(GetObjectByTag("SilverSpringKey"));
  }
 }
}
