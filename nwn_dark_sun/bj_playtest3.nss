//::///////////////////////////////////////////////
//:: FileName bj_playtest3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/29/2002 2:59:22 PM
//:://////////////////////////////////////////////
void main()
{
    // Set the variables
    //Clear the old variables in order to be able to start a new game
    SetLocalInt(OBJECT_SELF, "nPlayingBlackJack", 0);

    SetLocalInt(OBJECT_SELF, "nMaxPlayers", 0);
    SetLocalInt(OBJECT_SELF, "nNumPlayers", 0);

    //make sure all PCs have their game variable marked to off
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC,"nGameOn",0);
        oPC = GetNextPC();
    }

    //Move dealer to stand and await the next PC who wants to play.
    AssignCommand(OBJECT_SELF,ActionMoveToObject(GetWaypointByTag("WP_BlackJack")));

}
