string LocationToString(location lLocation)
{
    object oArea        = GetAreaFromLocation(lLocation);
    vector vPosition    = GetPositionFromLocation(lLocation);
    float  fOrientation = GetFacingFromLocation(lLocation);
    return "#AREA#"        + GetTag(oArea) +
           "#POSITION_X#"  + FloatToString(vPosition.x)  +
           "#POSITION_Y#"  + FloatToString(vPosition.y)  +
           "#POSITION_Z#"  + FloatToString(vPosition.z)  +
           "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";
}
void main()
{
    object oPartyMember, oArea, oTarget;
    object oPC = GetExitingObject();

    if (oPC != GetFactionLeader(oPC))    // <- only the party leader can trigger
        return;

    int bGoing;
    // Only fire for (real) PCs.
    if (!GetIsPC(oPC) || GetIsDM(oPC) || GetIsDMPossessed(oPC))
        return;

    if (GetIsDawn() || GetIsDay())
        bGoing = (Random(100) <= 5);
    else
        bGoing = (Random(100) <= 10);

    if (bGoing)
    {
        oArea = GetArea(oPC);
        oPartyMember = GetFirstFactionMember(oPC, TRUE);    // <-- Change to TRUE
        location lStart = GetLocation(oPC);

        if (d100() <= 15)
            oTarget = GetWaypointByTag("DS_DESCENC_2");
        else
            oTarget = GetWaypointByTag("DS_DESCENC_1");

        location lTarget = GetLocation(oTarget);

        while (GetIsObjectValid(oPartyMember))
        {
            if (GetArea(oPartyMember) == oArea && GetDistanceBetween(oPC, oPartyMember) <= 30.0)  // <- change to whatever distance you want in meters
            {
                // SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));  // <-- change this line to
                SetLocalLocation(oPartyMember, "ls_stored_loc", lStart);  // <-- use saved location because if the oPC has already jumped,
                                                                          // it'll use the PC's new location in the encounter area
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(lTarget));
            }

            oPartyMember = GetNextFactionMember(oPC, TRUE);   // <-- change to TRUE
        }
    }
 }
