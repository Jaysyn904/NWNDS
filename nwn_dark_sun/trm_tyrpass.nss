// Put this script OnEnter.


void main()
{
    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Have us strike up a conversation with the PC.
    ActionStartConversation(oPC, "trm_tyrpass", TRUE, FALSE);
}
