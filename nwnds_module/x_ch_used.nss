#include "chess_include"

void main()
{
    object oPC = GetLastUsedBy();
    if (GetIsObjectValid(oPC) == FALSE)
    {
        SpeakString("Used by invalid object.");
        return;
    }

    object oArea = GetArea(OBJECT_SELF);

    string sSide = GetSideFromTag(GetTag(OBJECT_SELF));

    if (GetLocalInt(oArea, "LockCircles") == 1)
    {
        string sLocked = GetLocalString(oArea, sSide + "User");
        if ( sLocked == "")
        {
            SetLocalString(oArea, sSide + "User", GetName(oPC));
            SpeakString("Setting " + GetName(oPC) + " as the " + sSide + " player.");
        } else if (sLocked != GetName(oPC)) {
            SpeakString("This circle is locked so that only " + sLocked + " may use it.");
            return;
        }
    } else {
        SetLocalString(oArea, sSide + "User", GetName(oPC));
    }

    if (GetLocalString(oArea, "Summoned " + sSide) == "")
    {
        ExecuteScript("x_ch_summon", OBJECT_SELF);
        SpeakString("Summoning Army...");
        return;
    }

    SetupCustomChessTokens(GetSideFromTag(GetTag(OBJECT_SELF)));
    BeginConversation("chess_control", oPC);
}


