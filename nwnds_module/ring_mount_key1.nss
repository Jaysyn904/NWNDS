int StartingConditional()
{
    // Get the PC who is involved in this conversation
    object oPC = GetPCSpeaker();

    // Check a local variable.
    if ( GetLocalInt(oPC, "ring_mount_pass") != 1 )
        return FALSE;

    // If we make it this far, we have passed all tests.
    return TRUE;
}

