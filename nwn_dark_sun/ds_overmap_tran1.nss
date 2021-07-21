///////////////////////////////////////////////////////////////////////////////
//
// World Map Transtion Placable OnUsed
//
// ds_overmap_trans.nss
//
// DM Heatstroke / 2021-04-12
//
// Teleports PC to waypoint stored in "DESTINATION" local string var.
//
///////////////////////////////////////////////////////////////////////////////

void main()
    {
        object oPC = GetPCSpeaker();
        string sDestination = GetLocalString(OBJECT_SELF, "DESTINATION1");

        if (!GetIsPC(oPC)) return;

        object oTarget;
        location lTarget;

        oTarget = GetWaypointByTag(sDestination);
        lTarget = GetLocation(oTarget);

        //only do the jump if the location is valid.
        //though not flawless, we just check if it is in a valid area.
        //the script will stop if the location isn't valid - meaning that
        //nothing put after the teleport will fire either.
        //the current location won't be stored, either

        if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

        SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

        AssignCommand(oPC, ClearAllActions());

        AssignCommand(oPC, ActionJumpToLocation(lTarget));

    }
