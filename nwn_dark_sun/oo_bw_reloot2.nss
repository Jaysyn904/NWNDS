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

        // detemine random treasure item
        int nRandom = d100();   // 10% chance of nothing
        if (nRandom <= 40)  // 40% chance of gold
        {
            sBP = "nw_it_gold001";

            int nGoldHD = nModHD;
            if (nGoldHD < 1) nGoldHD = 1;

            nStack = d20(nGoldHD); // 1-20 gp per modified character level
        }
        else if (nRandom <= 70)  // 30% chance of gems
        {
            int nRandGem;
            int nRandType = d3(); // 1-3

            if (nModHD < 6)     // common gems
            {
                if      (nRandType == 1) nRandGem = d4();  // 1-4
                else if (nRandType == 2) nRandGem = 7;
                else                     nRandGem = (13 + d2());  // 14-15

                nStack = (d6(2) - 4); // common, 1-8 gems instead
            }
            else if (nModHD < 15)    // rare
            {
                if      (nRandType == 1) nRandGem = 10;
                else if (nRandType == 2) nRandGem = 11;
                else                     nRandGem = 13;

                nStack = (d6() - 3); // rare, 1-3 (66% chance of 1)
            }
            else if (nModHD < 23)
            {
                if      (nRandType == 1) nRandGem = 5;
                else if (nRandType == 2) nRandGem = 8;
                else                     nRandGem = 9;

                nStack = (d6() - 4); // rare, 1-2 (83% chance of 1)
            }
            else
            {
                if      (nRandType == 1) nRandGem = 6;
                else if (nRandType == 2) nRandGem = 12;
                else                     nRandGem = 5;
            }

            string sBaseBP = "nw_it_gem00";
            if (nRandGem > 9)
            {
                sBaseBP = "nw_it_gem0";
            }
            sBP = (sBaseBP + IntToString(nRandGem));
        }
        else if (nRandom <= 90)  // 20% chance of jewelry
        {
            nStack = (d6() - 3);

            if (nModHD < 3)
            {
                sBP = "nw_it_mring021"; // copper ring
            }
            else if (nModHD < 8)
            {
                sBP = "nw_it_mneck020"; // copper necklace
            }
            else if (nModHD < 13)
            {
                sBP = "nw_it_mring022"; // silver ring
            }
            else if (nModHD < 18)
            {
                sBP = "nw_it_mneck021"; // silver necklace

            }
            else if (nModHD < 23)
            {
                sBP = "nw_it_mring023"; // gold ring
            }
            else
            {
                sBP = "nw_it_mneck022"; // gold necklace
            }
        }

        if (sBP != "") // valid blueprint determined, create treasure
        {
            if (nStack < 1) nStack = 1;

            CreateItemOnObject(sBP, OBJECT_SELF, nStack);
        }

        // determine random healing item
        nRandom = d100();    // 10% chance of nothing
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

        if (sBP != "") // valid blueprint determined, create healing item
        {
            // determine stack size for healing/potion item
            nStack = (d6() - 3);
            if (nStack < 1) nStack = 1;   // 1 to 3, with 1 most likely (66%)

            CreateItemOnObject(sBP, OBJECT_SELF, nStack);
        }

        // don't do this again
        SetLocalInt(OBJECT_SELF, "nTreasure", 1);
    }
}
