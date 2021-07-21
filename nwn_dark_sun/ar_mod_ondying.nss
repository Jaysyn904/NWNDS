//::///////////////////////////////////////////////
//:: Dying Script
//:: NW_O0_DEATH.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the default behavior
    that occurs when a player is dying.
    DEFAULT CAMPAIGN: player dies automatically
*/
//:://////////////////////////////////////////////
//:: Created By: Brent Knowles
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////


void main()
{
    object oPlayer = GetLastPlayerDying();
    string sMessage;
    switch (d10())
    {
        case 1: sMessage = "I am gravely wounded."; break;
        case 2: sMessage = "Need assistance."; break;
        case 3: sMessage = "Water..."; break;
        case 4: sMessage = "Ugh...Ahhh...Gah..."; break;
        case 5: sMessage = "Help."; break;
        case 6: sMessage = "Medic."; break;
        case 7: sMessage = "Wow I suck!"; break;
        case 8: sMessage = "Mmm... this sand is delicious."; break;
        case 9: sMessage = "I always wanted to spend more time on my back."; break;
        case 10: sMessage = "Wait... I lagged!"; break;
    }

    AssignCommand(oPlayer, ClearAllActions());
    AssignCommand(oPlayer, SpeakString(sMessage));

    if (GetTag(GetArea(oPlayer)) != "TyrSSArena")
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHitPointChangeWhenDying(-1.0), oPlayer, 0.0f);
    else
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oPlayer);
}
