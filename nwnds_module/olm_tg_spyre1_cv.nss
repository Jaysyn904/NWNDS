void main()
{
    // Get the creature who triggered this event.
    object oPC = GetPlaceableLastClickedBy();

    // Have us strike up a conversation with the PC.
    ActionStartConversation(oPC, "olm_tg_spyre1", TRUE, FALSE);
}

