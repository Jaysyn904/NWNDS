// the use script for the game control system.

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    int iSeperator = FindSubString(sTag, "_");
    string sWhite = GetSubString(sTag,0, iSeperator);
    string sBlack = GetSubString(sTag,iSeperator+1, 10);

    SetCustomToken(300, sWhite);
    SetCustomToken(301, sBlack);

    object oPC = GetLastUsedBy();
    if (GetIsObjectValid(oPC) == FALSE)
    {
        SpeakString("Used by invalid object.");
        return;
    }
    BeginConversation("chess_main", oPC);
}
