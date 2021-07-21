string LocationToString(location lLocation)
{
    object oArea        = GetAreaFromLocation(lLocation);
    vector vPosition    = GetPositionFromLocation(lLocation);
    float  fOrientation = GetFacingFromLocation(lLocation);
    return "#AREA#"        + GetTag(oArea) +
           "#POSITION_X#"  + FloatToString(vPosition.x)  +
           "#POSITION_Y#"  + FloatToString(vPosition.y)  +
           "#POSITION_Z#"  + FloatToString(vPosition.z)  +
           "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";
}
void main()
{
    location lTarget;

    // Get the creature who triggered this event.
    object oPC = GetLastUsedBy();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Find the location to which to teleport.
    lTarget = GetLocalLocation(oPC, "ls_stored_loc");
    // Verify that the location is valid before attempting to teleport.
    // (The script will stop here if no location was previously stored.)
    if ( GetAreaFromLocation(lTarget) == OBJECT_INVALID )
        return;

    // Teleport the PC.
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, JumpToLocation(lTarget));
}

