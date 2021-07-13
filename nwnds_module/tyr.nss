
void main()
{
    int nHench;
    object oHench;
    object oTarget;

    // Get the PC who is in this conversation.
    object oPC = GetPCSpeaker();

    // Find the location to which to teleport.
    oTarget = GetWaypointByTag("tyr_wp1");

    // Teleport the PC.
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, JumpToObject(oTarget));

    // Also teleport associates.
    oHench = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    AssignCommand(oHench, ClearAllActions());
    AssignCommand(oHench, JumpToObject(oTarget));
    oHench = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    AssignCommand(oHench, ClearAllActions());
    AssignCommand(oHench, JumpToObject(oTarget));
    oHench = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    AssignCommand(oHench, ClearAllActions());
    AssignCommand(oHench, JumpToObject(oTarget));
    oHench = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    AssignCommand(oHench, ClearAllActions());
    AssignCommand(oHench, JumpToObject(oTarget));

    // Support for multiple henchmen (includes horses).
    nHench = 1;
    oHench = GetHenchman(oPC, 1);
    while ( oHench != OBJECT_INVALID )
    {
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oHench, JumpToObject(oTarget));
        // Next henchman.
        oHench = GetHenchman(oPC, ++nHench);
    }
}

