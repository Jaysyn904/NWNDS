void main()
{
  // Get the creature who triggered this event.
    object oPC = GetExitingObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Destroy an object (not fully effective until this script ends).
    DestroyObject(GetObjectByTag("SilverSpringKey"));
}
