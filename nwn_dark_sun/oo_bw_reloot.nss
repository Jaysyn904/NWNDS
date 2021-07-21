// create loot for random encounter areas,
// mostly healing potions, kits, etc.
//
// -Brian Watson

void main()
{
    int nTreas = GetLocalInt(OBJECT_SELF, "nTreasure");

    if (nTreas == 0)
    {
        // set default var's
        int nHD = 1;
        int nStack = 1;
        string sBP;
        int nItem;

        // determine who opened this container
        object oOpener = GetLastOpenedBy();
        if (!GetIsObjectValid(oOpener))
        {
            oOpener = GetLastKiller();
        }
        if (GetIsObjectValid(oOpener))
        {
            nHD = GetHitDice(oOpener);
        }

        // randomize level for variable item generation (-9 to +9 HD)
        int nLevelAdj = (d10(2) - 11);
        int nModHD = nHD + nLevelAdj;

        // determine stack size
        nStack = (d6() - 3);
        if (nStack < 1) nStack = 1;   // 1 to 3, with 1 most likely

        // determine random treasure
        int nRandom = d100();
        if (nRandom <= 40)  // 40% chance of healing kit
        {
            if (nModHD < 5)
            {
                sBP = "nw_it_medkit001"; // +1
            }
            else if (nModHD < 15)
            {
                sBP = "nw_it_medkit002"; // +3
            }
            else if (nModHD < 25)
            {
                sBP = "nw_it_medkit003"; // +6
            }
            else
            {
                sBP = "nw_it_medkit004"; // +10
            }
        }
        else if (nRandom <= 80) // 40% chance of healing potion
        {
            if (nModHD < 0)
            {
                sBP = "nw_it_mpotion001"; // cure light
            }
            else if (nModHD < 10)
            {
                sBP = "nw_it_mpotion020"; // cure moderate
            }
            else if (nModHD < 20)
            {
                sBP = "nw_it_mpotion002"; // cure serious
            }
            else
            {
                sBP = "nw_it_mpotion003"; // cure critical
            }
        }
        else if (nRandom <= 90) // 10% chance of ANY standard potion
        {
            nItem = (d20() + d6() - 1); // # from 1-25 determines potion
            if (nItem < 24)
            {
                if  (nItem < 10)
                {
                    sBP = ("nw_it_mpotion00" + IntToString(nItem));
                }
                else
                {
                    sBP = ("nw_it_mpotion0" + IntToString(nItem));
                }
            }
            else if (nItem == 24)
            {
                sBP = "x2_it_mpotion001";
            }
            else if (nItem == 25)
            {
                sBP = "x2_it_mpotion002";
            }
            else
            {
                sBP = "nw_it_mpotion002"; // default to cure serious wounds
            }
        }
        else                    // 10% chance of flask/grenade weapon
        {
            if (nModHD <= 20) // smaller reward
            {
                nItem = d8();
                if (nItem == 8) nItem = 5; // no item 8

                sBP = ("x1_wmgrenade00" + IntToString(nItem));
            }
            else              // a bomb!
            {
                nRandom = d10();
                if (nRandom < 6) // 50% chance of
                {
                    sBP = "x2_it_acidbomb";  // acid bomb
                }
                else             // 50% chance of
                {
                    sBP = "x2_it_firebomb";  // fire bomb
                }
            }
        }

        if (sBP != "") // valid blueprint determined
        {
            CreateItemOnObject(sBP, OBJECT_SELF, nStack);

            // don't do this again
            SetLocalInt(OBJECT_SELF, "nTreasure", 1);
        }
    }
}
