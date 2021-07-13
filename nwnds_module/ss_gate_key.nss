
void main()
{
    // Get the PC who is in this conversation.
    object oPC = GetPCSpeaker();

    // If the PC has the item "Silver Spring Key".
    if ( GetItemPossessedBy(oPC, "KEY_SILVERSPRING") != OBJECT_INVALID )
    {
        // Send a message to the player's chat window.
        SendMessageToPC(oPC, "You already have the key.");
    }

    // If the PC does not have the item "Silve Spring Key".
    if ( GetItemPossessedBy(oPC, "KEY_SILVERSPRING") == OBJECT_INVALID )
    {
        // Take 10 gold from the PC.
        TakeGoldFromCreature(10, oPC, TRUE);

        // Give "ss" to the PC.
        CreateItemOnObject("KEY_SILVERSPRING", oPC);
    }
}


