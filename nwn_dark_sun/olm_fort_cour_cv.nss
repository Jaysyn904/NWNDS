/*
 *  Script generated by LS Script Generator, v.TK.0
 *
 *  For download info, please visit:
 *  http://nwvault.ign.com/View.php?view=Other.Detail&id=1502
 */
// Put this script OnClick of a placeable.


void main()
{
    // Get the creature who triggered this event.
    object oPC = GetPlaceableLastClickedBy();

    // Have us strike up a conversation with the PC.
    ActionStartConversation(oPC, "olm_fort_cour", TRUE, FALSE);
}

