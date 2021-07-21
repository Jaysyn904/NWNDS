
void DeleteStats(object oPlayer);

void main()
{
    object oPC = GetExitingObject();
    if (GetIsDM(oPC)) return;
    // Disabled to use the PRC HP Tacking functions
    /*string sVarName = "HP" + GetLocalString(oPC, "ID");
    int nHP = GetCurrentHitPoints(oPC);
    if (nHP == 0) nHP = -1;
    SetLocalInt(OBJECT_SELF, sVarName, nHP); */
    // Spell Tracking
    ExecuteScript("ar_inc_clearvar", oPC);
    
}


void DeleteStats(object oPlayer)
{
    DeleteLocalInt(oPlayer, "Arena");
    DeleteLocalInt(oPlayer, "Player");
    DeleteLocalInt(oPlayer, "Bounty");
}
