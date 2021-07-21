//
// Spawn Loot
//
// History:
//    --/--/--   Neshke            Created
//    12/03/02   Cereborn          Added DanielleB's merchant-based loot tables
//    12/31/02   Cereborn          Use newly added flags for determining the
//                                 probabilities of 1,2, or 3 item drops from
//                                 merchant-based (LT500-LT999) loot tables.
//                                 Fixed an off-by-one bug in the item choosing
//                                 code for for merchant-based loot tables. The
//                                 code was trying to take items 2 through n+1.
//
int ParseFlagValue(string sName, string sFlag, int nDigits, int nDefault);
int ParseSubFlagValue(string sName, string sFlag, int nDigits, string sSubFlag, int nSubDigits, int nDefault);
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);
void CleanInventory(object oSpawned);
//
//
void LootTable(object oSpawn, object oSpawned, int nLootTable)
{
    // Initialize
    object oItem;
    string sTemplate;
    int nStack;

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Table 00
    if (nLootTable == 0)
    {
        // 40% Chance
        if (d100() <= 40)
            CreateItemOnObject("giantskeletonsku", oSpawned);
    }
    //

    // Table 01
    if (nLootTable == 1)
    {
        // 40% Chance
        if (d100() <= 40)
    CreateItemOnObject("spiderpoisonsack", oSpawned);
    }
    //

    // Table 02
    if (nLootTable == 2)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("airdrakehide", oSpawned);
    }
    //

    // Table 03
    if (nLootTable == 3)
    {
        // 30% Chance
        if (d100(1) <= 30)
        {
            // Created Custom Item with ResRef of ogretooth
            sTemplate = "ogretooth";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 04
    if (nLootTable == 4)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
            // Created Custom Item with ResRef of rampagereye
            sTemplate = "rampagereye";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 05
    if (nLootTable == 5)
    {
        // 90% Chance
        if (d100(1) <= 90)
        {
            // Created Custom Item with ResRef of githkey
            sTemplate = "githkey";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 06
    if (nLootTable == 6)
    {
        // 80% Chance
        if (d100(1) <= 80)
        {
            // Created Custom Item with ResRef of zombiekey
            sTemplate = "zombiekey";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //
    // Table 07
    if (nLootTable == 7)
    {
        // 80% Chance
        if (d100(1) <= 80)
        {
            // Created Custom Item with ResRef of pieceofthegol003
            sTemplate = "pieceofthegol003";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 08
    if (nLootTable == 8)
    {
        // 80% Chance
        if (d100(1) <= 80)
        {
            // Created Custom Item with ResRef of revenantkey
            sTemplate = "revenantkey";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 09
    if (nLootTable == 9)
    {
        // 100% Chance
        if (d100(1) <= 100)
        {
            // Created Custom Item with ResRef of githchiefhead
            sTemplate = "githchiefhead";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 10
    if (nLootTable == 10)
    {
        // 80% Chance
        if (d100(1) <= 80)
        {
            // Created Custom Item with ResRef of secondpieceofthe
            sTemplate = "secondpieceofthe";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 11
    if (nLootTable == 11)
    {
        // 70% Chance
        if (d100(1) <= 70)
        {
            // Created Custom Item with ResRef of jaryxsledger
            sTemplate = "jaryxsledger";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 12
    if (nLootTable == 12)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
            // Created Custom Item with ResRef of brimstone
            sTemplate = "brimstone";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 13
    if (nLootTable == 13)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
            // Created Custom Item with ResRef of icenine
            sTemplate = "icenine";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 14
    if (nLootTable == 14)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
            // Created Custom Item with ResRef of acidcrystal
            sTemplate = "acidcrystal";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 15
    if (nLootTable == 15)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
            // Created Custom Item with ResRef of chargedcrystal
            sTemplate = "chargedcrystal";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

   // Table 16 - Fields/NOOB
    if (nLootTable == 16)
    {
        // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //55% chance
            if(nVeggie <= 40)
                CreateItemOnObject("spinach", oSpawned);
            //40% chance
            if ((nVeggie > 40) && (nVeggie <= 60))
                CreateItemOnObject("garlic", oSpawned);
                //40% chance
            if ((nVeggie > 60) && (nVeggie <= 80))
                CreateItemOnObject("water", oSpawned);
            //20% chance
            if (nVeggie > 80)
                CreateItemOnObject("ginseng", oSpawned);
        }
    }
    //

   // Table 17
    if (nLootTable == 17)
    {
        // 10% Chance
        if (d100(1) <= 10)
        {
            // Created Custom Item with ResRef of shadowsphere
            sTemplate = "shadowsphere";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 18
    if (nLootTable == 18)
    {
        // 15% Chance
        if (d100(1) <= 15)
        {
            // Created Custom Item with ResRef of shadowsphere
            sTemplate = "hen_sha1qt001";
            nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 19
    if (nLootTable == 19)
    {
        // Created Custom Item with ResRef of shadowsphere
        sTemplate = "clockworkamulet";
        nStack = 1;
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 20
    if (nLootTable == 20)
    {
        // Created Custom Item with ResRef of shadowsphere
        sTemplate = "clockworkamul001";
        nStack = 1;

        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 21
    if (nLootTable == 21)
    {
        // Created Custom Item with ResRef of shadowsphere
        sTemplate = "clockworkamul002";
        nStack = 1;
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 22
    if (nLootTable == 22)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "it_msmlmisc025";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }

    // Table 23 for Earth Key
    if (nLootTable == 23)
    {
        // 90% Chance
        if (d100() <= 90)
        CreateItemOnObject("earthkey", oSpawned);
    }
    //

    // Table 24 for Air Key
    if (nLootTable == 24)
    {
        // 90% Chance
        if (d100() <= 90)
        CreateItemOnObject("airkey", oSpawned);
    }
    //

    // Table 25 for Ice Key
    if (nLootTable == 25)
    {
        // 90% Chance
        if (d100() <= 90)
        CreateItemOnObject("icekey", oSpawned);
    }
    //

    // Table 26 for Fire Key
    if (nLootTable == 26)
    {
        // 90% Chance
        if (d100() <= 90)
        CreateItemOnObject("firekey", oSpawned);
    }
    //

    // Table 27 for Low Armor
    if (nLootTable == 27)
    {
        // 5% Chance
        if (d100() <= 5)
        {
            int nArmor = d100();
            //3% chance
            if (nArmor <= 3)
                CreateItemOnObject("aarcl006", oSpawned);
            //3% chance
            else if ((nArmor > 3) && (nArmor <= 6))
                CreateItemOnObject("aarcl007", oSpawned);
            //3% chance
            else if ((nArmor > 6) && (nArmor <= 9))
                CreateItemOnObject("aarcl012", oSpawned);
            //3% chance
            else if ((nArmor > 9) && (nArmor <= 12))
                CreateItemOnObject("aarcl008", oSpawned);
            //3% chance
            else if ((nArmor > 12) && (nArmor <= 15))
                CreateItemOnObject("aarcl009", oSpawned);
            //3% chance
            else if ((nArmor > 15) && (nArmor <= 18))
                CreateItemOnObject("steelbandedmai", oSpawned);
            //3% chance
            else if ((nArmor > 18) && (nArmor <= 21))
                CreateItemOnObject("steelhalfplate", oSpawned);
            //3% chance
            else if ((nArmor > 21) && (nArmor <= 24))
                CreateItemOnObject("steelplatemail", oSpawned);
            //3% chance
            else if ((nArmor > 24) && (nArmor <= 27))
                CreateItemOnObject("aarcl013", oSpawned);
            //3% chance
            else if ((nArmor > 27) && (nArmor <= 30))
                CreateItemOnObject("aarcl003", oSpawned);
            //3% chance
            else if ((nArmor > 30) && (nArmor <= 33))
                CreateItemOnObject("aarcl014", oSpawned);
            //3% chance
            else if ((nArmor > 33) && (nArmor <= 36))
                CreateItemOnObject("aarcl002", oSpawned);
            //3% chance
            else if ((nArmor > 36) && (nArmor <= 39))
                CreateItemOnObject("steelchainshir", oSpawned);
            //3% chance
            else if ((nArmor > 39) && (nArmor <= 42))
                CreateItemOnObject("steelstuddedar", oSpawned);
            //3% chance
            else if ((nArmor > 42) && (nArmor <= 45))
                CreateItemOnObject("aarcl004", oSpawned);
            //3% chance
            else if ((nArmor > 45) && (nArmor <= 48))
                CreateItemOnObject("aarcl010", oSpawned);
            //3% chance
            else if ((nArmor > 48) && (nArmor <= 51))
                CreateItemOnObject("aarcl005", oSpawned);
            //3% chance
            else if ((nArmor > 51) && (nArmor <= 54))
                CreateItemOnObject("steelchainmail", oSpawned);
            //3% chance
            else if ((nArmor > 54) && (nArmor <= 57))
                CreateItemOnObject("arhe005", oSpawned);
            //3% chance
            else if ((nArmor > 57) && (nArmor <= 60))
                CreateItemOnObject("arhe002", oSpawned);
            //3% chance
            else if ((nArmor > 60) && (nArmor <= 63))
                CreateItemOnObject("ironhelmet", oSpawned);
            //3% chance
            else if ((nArmor > 63) && (nArmor <= 66))
                CreateItemOnObject("steelhelmet", oSpawned);
            //3% chance
            else if ((nArmor > 66) && (nArmor <= 69))
                CreateItemOnObject("ashmlw003", oSpawned);
            //3% chance
            else if ((nArmor > 69) && (nArmor <= 72))
                CreateItemOnObject("ashmlw004", oSpawned);
            //3% chance
            else if ((nArmor > 72) && (nArmor <= 75))
                CreateItemOnObject("ashlw002", oSpawned);
            //3% chance
            else if ((nArmor > 75) && (nArmor <= 78))
                CreateItemOnObject("ashmsw003", oSpawned);
            //4% chance
            else if ((nArmor > 78) && (nArmor <= 82))
                CreateItemOnObject("ashmsw004", oSpawned);
            //4% chance
            else if ((nArmor > 82) && (nArmor <= 86))
                CreateItemOnObject("ashsw002", oSpawned);
            //4% chance
            else if ((nArmor > 86) && (nArmor <= 90))
                CreateItemOnObject("ashmto004", oSpawned);
            //4% chance
            else if ((nArmor > 90) && (nArmor <= 94))
                CreateItemOnObject("ashto002", oSpawned);
            //6% chance
            else if (nArmor > 94)
                CreateItemOnObject("ashmto003", oSpawned);
        }
    }

    // Table 28 for Spiders Loot
    if (nLootTable == 28)
    {

        // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 5)
                CreateItemOnObject("cloth008", oSpawned);
            //% chance
            else if ((nVeggie > 5) && (nVeggie <= 15))
                CreateItemOnObject("mcloth008", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 20))
                CreateItemOnObject("robesofthesage", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 25))
                CreateItemOnObject("aarcl008", oSpawned);
            //% chance
            else if ((nVeggie > 25) && (nVeggie <= 40))
                CreateItemOnObject("aarcl009", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 45))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 55))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 55) && (nVeggie <= 65))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 65) && (nVeggie <= 70))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 75) && (nVeggie <= 80))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 80) && (nVeggie <= 85))
                CreateItemOnObject("spelunkershelm", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 90))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if ((nVeggie > 90) && (nVeggie <= 95))
                CreateItemOnObject("darksilkgland", oSpawned);
            //% chance
            else if (nVeggie > 95)
                CreateItemOnObject("darksilkgland", oSpawned);
        }
    }

    // Table 29 for Yinks
    if (nLootTable == 29)
    {

        // 10% Chance
        if (d100() <= 10)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 5)
                CreateItemOnObject("cloth008", oSpawned);
            //% chance
            else if ((nVeggie > 5) && (nVeggie <= 15))
                CreateItemOnObject("mcloth008", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 20))
                CreateItemOnObject("robesofthesage", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 25))
                CreateItemOnObject("aarcl008", oSpawned);
            //% chance
            else if ((nVeggie > 25) && (nVeggie <= 40))
                CreateItemOnObject("aarcl009", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 45))
                CreateItemOnObject("steelbandedmai", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 55))
                CreateItemOnObject("steelhalfplate", oSpawned);
            //% chance
            else if ((nVeggie > 55) && (nVeggie <= 65))
                CreateItemOnObject("steelplatemail", oSpawned);
            //% chance
            else if ((nVeggie > 65) && (nVeggie <= 70))
                CreateItemOnObject("steelchainshir", oSpawned);
            //% chance
            else if ((nVeggie > 75) && (nVeggie <= 80))
                CreateItemOnObject("steelscalemail", oSpawned);
            //% chance
            else if ((nVeggie > 80) && (nVeggie <= 85))
                CreateItemOnObject("spelunkershelm", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 90))
                CreateItemOnObject("towershieldofspe", oSpawned);
            //% chance
            else if (nVeggie > 90)
                CreateItemOnObject("smallshieldofpro", oSpawned);
        }
    }

     // Table 30
    if (nLootTable == 30)
    {

        // 20% Chance
        if (d100(1) <= 20)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "waterdrakehide";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }

    // Table 31
    if (nLootTable == 31)
    {

        // 20% Chance
        if (d100(1) <= 20)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "earthdrakehide";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }

    // Table 32
    // Random Gold for Chests
    if (nLootTable == 32)
    {
        nStack = Random(50) + 1;
        oItem = CreateItemOnObject("nw_it_gold001", oSpawned, nStack);
    }
    //

    // Table 33
    if (nLootTable == 33)
    {
        // 20% Chance
        if (d100(1) <= 20)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "mastyrialsblade";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    //

    // Table 34 for SoT Giants (formerly Tyr Guards)
    if (nLootTable == 34)
    {
        // 10% Chance
        if (d100() <= 10)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("divineshell", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("imbuedhelmet", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("rogueswrap", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("imbuedshield", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("mastersringofstr", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 15))
                CreateItemOnObject("mastersringofcon", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 17))
                CreateItemOnObject("mastersringofwis", oSpawned);
            //% chance
            else if ((nVeggie > 17) && (nVeggie <= 19))
                CreateItemOnObject("sunrunnerring", oSpawned);
            //% chance
            else if ((nVeggie > 19) && (nVeggie <= 21))
                CreateItemOnObject("defilerash", oSpawned);
            //% chance
            else if ((nVeggie > 21) && (nVeggie <= 27))
                CreateItemOnObject("mastersamuletofc", oSpawned);
            //% chance
            else if ((nVeggie > 27) && (nVeggie <= 33))
                CreateItemOnObject("mastersamuletofd", oSpawned);
            //% chance
            else if ((nVeggie > 33) && (nVeggie <= 39))
                CreateItemOnObject("mastersringofcha", oSpawned);
            //% chance
            else if ((nVeggie > 39) && (nVeggie <= 45))
                CreateItemOnObject("mastersamuletofw", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 51))
                CreateItemOnObject("mastersamuletofs", oSpawned);
            //% chance
            else if ((nVeggie > 51) && (nVeggie <= 57))
                CreateItemOnObject("mastersamuletofi", oSpawned);
            //% chance
            else if ((nVeggie > 57) && (nVeggie <= 63))
                CreateItemOnObject("mastersringofdex", oSpawned);
            //% chance
            else if ((nVeggie > 63) && (nVeggie <= 69))
                CreateItemOnObject("mastersringofint", oSpawned);
            //% chance
            else if ((nVeggie > 69) && (nVeggie <= 75))
                CreateItemOnObject("mastersamuletofh", oSpawned);
            //% chance
            else if ((nVeggie > 75) && (nVeggie <= 81))
                CreateItemOnObject("lichsgreedring", oSpawned);
            //% chance
            else if ((nVeggie > 81) && (nVeggie <= 83))
                CreateItemOnObject("zanscord", oSpawned);
            //% chance
            else if ((nVeggie > 83) && (nVeggie <= 85))
                CreateItemOnObject("naturesgift", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 87))
                CreateItemOnObject("forgottenaxe", oSpawned);
                //% chance
            else if ((nVeggie > 87) && (nVeggie <= 89))
                CreateItemOnObject("bladeofthesun", oSpawned);
             //% chance
            else if ((nVeggie > 89) && (nVeggie <= 92))
                CreateItemOnObject("ringofhate", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 95))
                CreateItemOnObject("maskofpain", oSpawned);
            //% chance
            else if ((nVeggie > 97) && (nVeggie <= 99))
                CreateItemOnObject("thedurvishsblade", oSpawned);
            //% chance
            else if (nVeggie > 99)
                CreateItemOnObject("trudshook", oSpawned);
        }
    }
    //

    // Table 35 for Journeyman Key to Spyre Tower 2
    if (nLootTable == 35)
    {
         // 99% Chance
        if (d100() <= 99)
        CreateItemOnObject("spyrekey1", oSpawned);
    }
    //


    // Table 41 for Runes
    if (nLootTable == 41)
    {
        // 100% Chance
        if (d100() <= 50)
        {
            int nVeggie = d100();
            //25% chance
            if(nVeggie <= 25)
                CreateItemOnObject("voidrune", oSpawned);
            //25% chance
            if ((nVeggie > 25) && (nVeggie <= 50))
                CreateItemOnObject("touchrune", oSpawned);
            //25% chance
            if ((nVeggie > 50) && (nVeggie <= 75))
                CreateItemOnObject("selfrune", oSpawned);
            //25% chance
            if (nVeggie > 75)
                CreateItemOnObject("projectionrune", oSpawned);
        }
    }

    // Table 42 for Arrows
    if (nLootTable == 42)
    {

        // 10% Chance
        if (d100() <= 10)
        {
            int nVeggie = d100();
            //20% chance
            if(nVeggie <= 20)
                CreateItemOnObject("MysticArrow", oSpawned, 99);
            //20% chance
            if ((nVeggie > 20) && (nVeggie <= 40))
                CreateItemOnObject("NW_WAMMAR006", oSpawned, 99);
            //20% chance
            if ((nVeggie > 40) && (nVeggie <= 60))
                CreateItemOnObject("HeartSeekerArrow", oSpawned, 99);
            //20% chance
            if ((nVeggie > 60) && (nVeggie <= 80))
                CreateItemOnObject("wammar004", oSpawned, 99);
            //20% chance
            if (nVeggie > 80)
                CreateItemOnObject("ShadowArrow", oSpawned, 99);
        }
                }
          // Table 43 for undead dwarves
    if (nLootTable == 43)
    {
         // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //10% chance
            if(nVeggie <= 10)
                CreateItemOnObject("shroudofdecay", oSpawned);
            //30% chance
            if ((nVeggie > 10) && (nVeggie <= 40))
                CreateItemOnObject("waxgr002", oSpawned);
            //15% chance
            if ((nVeggie > 40) && (nVeggie <= 55))
                CreateItemOnObject("rockstemchopper", oSpawned);
            //30% chance
            if ((nVeggie > 55) && (nVeggie <= 85))
                CreateItemOnObject("steelbattleaxe", oSpawned);
            //15% chance
            if (nVeggie > 85)
                CreateItemOnObject("carrikalofhuevra", oSpawned);

    }
    }

            // Table 44 for large bone drops
    if (nLootTable == 44)
    {
         // 10% Chance
        if (d100() <= 10)
        CreateItemOnObject("x2_it_cmat_bone", oSpawned);
    }


       // Table 45 for FD Hides
    if (nLootTable == 45)
    {


        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("firedrakehide", oSpawned);

    }


    // Table 46 for Dune Reaper Glands
    if (nLootTable == 46)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("gland1", oSpawned);

    }

    // Table 47 for Defiler Ash
    if (nLootTable == 47)
    {
        // 10% Chance
        if (d100() <= 15)
        CreateItemOnObject("defilerash", oSpawned);

    }
    // Table 48 for defiler journeymen scrolls
    if (nLootTable == 48)
    {
        // 15% Chance
        if (d100() <= 15)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 5)
                CreateItemOnObject("x2_it_sparscr101", oSpawned);
            //% chance
            else if ((nVeggie > 5) && (nVeggie <= 10))
                CreateItemOnObject("x2_it_sparscr104", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 15))
                CreateItemOnObject("x2_it_sparscr202", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 20))
                CreateItemOnObject("x2_it_sparscr105", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 25))
                CreateItemOnObject("nw_it_sparscr414", oSpawned);
            //% chance
            else if ((nVeggie > 25) && (nVeggie <= 30))
                CreateItemOnObject("nw_it_sparscr211", oSpawned);
            //% chance
            else if ((nVeggie > 30) && (nVeggie <= 35))
                CreateItemOnObject("nw_it_sparscr206", oSpawned);
            //% chance
            else if ((nVeggie > 35) && (nVeggie <= 40))
                CreateItemOnObject("nw_it_sparscr202", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 45))
                CreateItemOnObject("nw_it_sparscr315", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 50))
                CreateItemOnObject("nw_it_sparscr113", oSpawned);
            //% chance
            else if ((nVeggie > 50) && (nVeggie <= 55))
                CreateItemOnObject("nw_it_sparscr415", oSpawned);
            //% chance
            else if ((nVeggie > 55) && (nVeggie <= 60))
                CreateItemOnObject("nw_it_sparscr102", oSpawned);
            //% chance
            else if ((nVeggie > 60) && (nVeggie <= 65))
                CreateItemOnObject("nw_it_sparscr111", oSpawned);
            //% chance
            else if ((nVeggie > 65) && (nVeggie <= 70))
                CreateItemOnObject("nw_it_sparscr412", oSpawned);
            //% chance
            else if ((nVeggie > 70) && (nVeggie <= 75))
                CreateItemOnObject("nw_it_sparscr218", oSpawned);
                //% chance
            else if ((nVeggie > 75) && (nVeggie <= 80))
                CreateItemOnObject("nw_it_sparscr104", oSpawned);
             //% chance
            else if ((nVeggie > 80) && (nVeggie <= 85))
                CreateItemOnObject("nw_it_sparscr311", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 90))
                CreateItemOnObject("x2_it_sparscr205", oSpawned);
            //% chance
            else if ((nVeggie > 90) && (nVeggie <= 95))
                CreateItemOnObject("x2_it_sparscr201", oSpawned);
            //% chance
            else if (nVeggie > 95)
                CreateItemOnObject("x2_it_sparscr203", oSpawned);
        }
    }
// Table 49
    if (nLootTable == 49)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("magmadrakehide", oSpawned);
    }
    // Table 50
    if (nLootTable == 50)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("sundrakehide", oSpawned);
    }
    // Table 51
    if (nLootTable == 51)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("raindrakehide", oSpawned);
    }
    // Table 52
    if (nLootTable == 52)
    {
        // 20% Chance
        if (d100() <= 20)
        CreateItemOnObject("siltdrakehide", oSpawned);
    }
    // Table 53
    if (nLootTable == 53)
    {
        // 100% Chance
        if (d100() <= 100)
        CreateItemOnObject("mimsitem", oSpawned);
    }

// Table 54 for Ashen Drake
    if (nLootTable == 54)
    {
        // 90% Chance
        if (d100() <= 90)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("robesofliving", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("pyreenforgedplat", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("rogueswrap", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("imbuedshield", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("mastersringofstr", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 15))
                CreateItemOnObject("mastersringofcon", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 17))
                CreateItemOnObject("mastersringofwis", oSpawned);
            //% chance
            else if ((nVeggie > 17) && (nVeggie <= 19))
                CreateItemOnObject("dimensionalblade", oSpawned);
            //% chance
            else if ((nVeggie > 19) && (nVeggie <= 21))
                CreateItemOnObject("frostbite", oSpawned);
            //% chance
            else if ((nVeggie > 21) && (nVeggie <= 27))
                CreateItemOnObject("mastersamuletofc", oSpawned);
            //% chance
            else if ((nVeggie > 27) && (nVeggie <= 33))
                CreateItemOnObject("mastersamuletofd", oSpawned);
            //% chance
            else if ((nVeggie > 33) && (nVeggie <= 39))
                CreateItemOnObject("mastersringofcha", oSpawned);
            //% chance
            else if ((nVeggie > 39) && (nVeggie <= 45))
                CreateItemOnObject("mastersamuletofw", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 51))
                CreateItemOnObject("mastersamuletofs", oSpawned);
            //% chance
            else if ((nVeggie > 51) && (nVeggie <= 57))
                CreateItemOnObject("mastersamuletofi", oSpawned);
            //% chance
            else if ((nVeggie > 57) && (nVeggie <= 63))
                CreateItemOnObject("mastersringofdex", oSpawned);
            //% chance
            else if ((nVeggie > 63) && (nVeggie <= 69))
                CreateItemOnObject("mastersringofint", oSpawned);
            //% chance
            else if ((nVeggie > 69) && (nVeggie <= 75))
                CreateItemOnObject("mastersamuletofh", oSpawned);
            //% chance
            else if ((nVeggie > 75) && (nVeggie <= 81))
                CreateItemOnObject("astralblade", oSpawned);
            //% chance
            else if ((nVeggie > 81) && (nVeggie <= 83))
                CreateItemOnObject("backlash", oSpawned);
            //% chance
            else if ((nVeggie > 83) && (nVeggie <= 85))
                CreateItemOnObject("sureshot", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 87))
                CreateItemOnObject("forgottenaxe", oSpawned);
                //% chance
            else if ((nVeggie > 87) && (nVeggie <= 89))
                CreateItemOnObject("severer", oSpawned);
             //% chance
            else if ((nVeggie > 89) && (nVeggie <= 92))
                CreateItemOnObject("ringofhate", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 95))
                CreateItemOnObject("sunslasher", oSpawned);
            //% chance
            else if ((nVeggie > 97) && (nVeggie <= 99))
                CreateItemOnObject("thedurvishsblade", oSpawned);
            //% chance
            else if (nVeggie > 99)
                CreateItemOnObject("robeofashend", oSpawned);
        }
    }
// Table 55 for Epic Level Foes  VERSION 1
    if (nLootTable == 55)
    {
        // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("iconicamuletofch", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("iconicamuletofst", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("iconicringofdext", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("iconicamuletofwi", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("iconicringofinte", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 12))
                CreateItemOnObject("iconicringofs", oSpawned);
            //% chance
            else if ((nVeggie > 12) && (nVeggie <= 14))
                CreateItemOnObject("iconicringofwisd", oSpawned);
            //% chance
            else if ((nVeggie > 14) && (nVeggie <= 16))
                CreateItemOnObject("iconicamuletofco", oSpawned);
            //% chance
            else if ((nVeggie > 16) && (nVeggie <= 18))
                CreateItemOnObject("iconicamuletofde", oSpawned);
            //% chance
            else if ((nVeggie > 18) && (nVeggie <= 20))
                CreateItemOnObject("iconicamuletofin", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 22))
                CreateItemOnObject("iconicringofchar", oSpawned);
            //% chance
            else if ((nVeggie > 22) && (nVeggie <= 24))
                CreateItemOnObject("iconicringofcons", oSpawned);
            //% chance
            else if ((nVeggie > 24) && (nVeggie <= 26))
                CreateItemOnObject("jingsgarb", oSpawned);
            //% chance
            else if ((nVeggie > 26) && (nVeggie <= 28))
                CreateItemOnObject("rhulthaunmaste", oSpawned);
            //% chance
            else if ((nVeggie > 28) && (nVeggie <= 30))
                CreateItemOnObject("robeofillwill", oSpawned);
            //% chance
            else if ((nVeggie > 30) && (nVeggie <= 32))
                CreateItemOnObject("phandarashelm", oSpawned);
            //% chance
            else if ((nVeggie > 32) && (nVeggie <= 34))
                CreateItemOnObject("beastmasterarm", oSpawned);
            //% chance
            else if ((nVeggie > 34) && (nVeggie <= 36))
                CreateItemOnObject("battleragearmo", oSpawned);
            //% chance
            else if ((nVeggie > 36) && (nVeggie <= 38))
                CreateItemOnObject("forgedshieldof", oSpawned);
            //% chance
            else if ((nVeggie > 38) && (nVeggie <= 40))
                CreateItemOnObject("halfbreedsguardi", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 42))
                CreateItemOnObject("girdleofpower", oSpawned);
            //% chance
            else if ((nVeggie > 42) && (nVeggie <= 44))
                CreateItemOnObject("jandorasgarb", oSpawned);
                //% chance
            else if ((nVeggie > 44) && (nVeggie <= 46))
                CreateItemOnObject("jandorastiara", oSpawned);
             //% chance
            else if ((nVeggie > 46) && (nVeggie <= 48))
                CreateItemOnObject("bracersofwardi", oSpawned);
            //% chance
            else if ((nVeggie > 48) && (nVeggie <= 50))
                CreateItemOnObject("torakswrap", oSpawned);
            //% chance
            else if ((nVeggie > 50) && (nVeggie <= 52))
                CreateItemOnObject("spectralcloak", oSpawned);
            //% chance
            else if ((nVeggie > 52) && (nVeggie <= 54))
                CreateItemOnObject("blindingedgegaun", oSpawned);
            //% chance
            else if ((nVeggie > 54) && (nVeggie <= 56))
                CreateItemOnObject("greaterringofadr", oSpawned);
             //% chance
            else if ((nVeggie > 56) && (nVeggie <= 58))
                CreateItemOnObject("x2_it_sparscr902", oSpawned);
            //% chance
            else if ((nVeggie > 58) && (nVeggie <= 60))
                CreateItemOnObject("x2_it_spdvscr509", oSpawned);
            //% chance
            else if ((nVeggie > 60) && (nVeggie <= 62))
                CreateItemOnObject("meteorforgedpl", oSpawned);
            //% chance
            else if ((nVeggie > 62) && (nVeggie <= 64))
                CreateItemOnObject("scorchedaxeof", oSpawned);
            //% chance
            else if ((nVeggie > 64) && (nVeggie <= 66))
                CreateItemOnObject("giftoftheelem", oSpawned);
            //% chance
            else if ((nVeggie > 66) && (nVeggie <= 68))
                CreateItemOnObject("ragnarok", oSpawned);
            //% chance
            else if ((nVeggie > 68) && (nVeggie <= 70))
                CreateItemOnObject("ginosbackstabb", oSpawned);
            //% chance
            else if ((nVeggie > 70) && (nVeggie <= 72))
                CreateItemOnObject("shimmeringblade", oSpawned);
            //% chance
            else if ((nVeggie > 72) && (nVeggie <= 74))
                CreateItemOnObject("thecleavelander", oSpawned);
            //% chance
            else if ((nVeggie > 74) && (nVeggie <= 76))
                CreateItemOnObject("lifesapper", oSpawned);
            //% chance
            else if ((nVeggie > 76) && (nVeggie <= 78))
                CreateItemOnObject("heartpiercer", oSpawned);
            //% chance
            else if ((nVeggie > 78) && (nVeggie <= 80))
                CreateItemOnObject("thewifebeater", oSpawned);
            //% chance
            else if ((nVeggie > 80) && (nVeggie <= 82))
                CreateItemOnObject("theeclipse", oSpawned);
            //% chance
            else if ((nVeggie > 82) && (nVeggie <= 84))
                CreateItemOnObject("justlshammer", oSpawned);
            //% chance
            else if ((nVeggie > 84) && (nVeggie <= 86))
                CreateItemOnObject("sunstaff", oSpawned);
            //% chance
            else if ((nVeggie > 86) && (nVeggie <= 88))
                CreateItemOnObject("destinysedge", oSpawned);
            //% chance
            else if ((nVeggie > 88) && (nVeggie <= 90))
                CreateItemOnObject("theicyheart", oSpawned);
            //% chance
            else if ((nVeggie > 90) && (nVeggie <= 92))
                CreateItemOnObject("theoldballandcha", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 94))
                CreateItemOnObject("theharvester", oSpawned);
            //% chance
            else if ((nVeggie > 94) && (nVeggie <= 96))
                CreateItemOnObject("soulsharvest", oSpawned);
            //% chance
            else if ((nVeggie > 96) && (nVeggie <= 98))
                CreateItemOnObject("ds_a8_gorgoth001", oSpawned);
            //% chance
            else if (nVeggie > 98)
                CreateItemOnObject("ds_h0_gorgoth001", oSpawned);
        }
        }
// Table 56 for Epic Level Foes  VERSION 2
    if (nLootTable == 56)
    {
        // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("dregothsrage", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("iconicamuletofst", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("iconicringofdext", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("iconicamuletofwi", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("iconicringofinte", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 12))
                CreateItemOnObject("iconicringofs", oSpawned);
            //% chance
            else if ((nVeggie > 12) && (nVeggie <= 14))
                CreateItemOnObject("iconicringofwisd", oSpawned);
            //% chance
            else if ((nVeggie > 14) && (nVeggie <= 16))
                CreateItemOnObject("iconicamuletofco", oSpawned);
            //% chance
            else if ((nVeggie > 16) && (nVeggie <= 18))
                CreateItemOnObject("iconicamuletofde", oSpawned);
            //% chance
            else if ((nVeggie > 18) && (nVeggie <= 20))
                CreateItemOnObject("iconicamuletofin", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 22))
                CreateItemOnObject("iconicringofchar", oSpawned);
            //% chance
            else if ((nVeggie > 22) && (nVeggie <= 24))
                CreateItemOnObject("iconicringofcons", oSpawned);
            //% chance
            else if ((nVeggie > 24) && (nVeggie <= 26))
                CreateItemOnObject("lalorsspine", oSpawned);
            //% chance
            else if ((nVeggie > 26) && (nVeggie <= 28))
                CreateItemOnObject("shininggythka", oSpawned);
            //% chance
            else if ((nVeggie > 28) && (nVeggie <= 30))
                CreateItemOnObject("devestation", oSpawned);
            //% chance
            else if ((nVeggie > 30) && (nVeggie <= 32))
                CreateItemOnObject("drakebonegythk", oSpawned);
            //% chance
            else if ((nVeggie > 32) && (nVeggie <= 34))
                CreateItemOnObject("robesofthewis", oSpawned);
            //% chance
            else if ((nVeggie > 34) && (nVeggie <= 36))
                CreateItemOnObject("embraceofthespir", oSpawned);
            //% chance
            else if ((nVeggie > 36) && (nVeggie <= 38))
                CreateItemOnObject("meteorforgedpl", oSpawned);
            //% chance
            else if ((nVeggie > 38) && (nVeggie <= 40))
                CreateItemOnObject("meteorforgedhe", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 42))
                CreateItemOnObject("meteorforgedarmo", oSpawned);
            //% chance
            else if ((nVeggie > 42) && (nVeggie <= 44))
                CreateItemOnObject("meteorforgedchai", oSpawned);
                //% chance
            else if ((nVeggie > 44) && (nVeggie <= 46))
                CreateItemOnObject("imbuedagafarilar", oSpawned);
             //% chance
            else if ((nVeggie > 46) && (nVeggie <= 48))
                CreateItemOnObject("imbuedagafarisma", oSpawned);
            //% chance
            else if ((nVeggie > 48) && (nVeggie <= 50))
                CreateItemOnObject("imbuedagafarishi", oSpawned);
            //% chance
            else if ((nVeggie > 50) && (nVeggie <= 52))
                CreateItemOnObject("guardianofthe", oSpawned);
            //% chance
            else if ((nVeggie > 52) && (nVeggie <= 54))
                CreateItemOnObject("blindingedgegaun", oSpawned);
            //% chance
            else if ((nVeggie > 54) && (nVeggie <= 56))
                CreateItemOnObject("heartofland", oSpawned);
             //% chance
            else if ((nVeggie > 56) && (nVeggie <= 58))
                CreateItemOnObject("x2_it_sparscr902", oSpawned);
            //% chance
            else if ((nVeggie > 58) && (nVeggie <= 60))
                CreateItemOnObject("x2_it_spdvscr509", oSpawned);
            //% chance
            else if ((nVeggie > 60) && (nVeggie <= 62))
                CreateItemOnObject("psitana", oSpawned);
            //% chance
            else if ((nVeggie > 62) && (nVeggie <= 64))
                CreateItemOnObject("messengerofraj", oSpawned);
            //% chance
            else if ((nVeggie > 64) && (nVeggie <= 66))
                CreateItemOnObject("retscutter", oSpawned);
            //% chance
            else if ((nVeggie > 66) && (nVeggie <= 68))
                CreateItemOnObject("solarflare", oSpawned);
            //% chance
            else if ((nVeggie > 68) && (nVeggie <= 70))
                CreateItemOnObject("lalisbliss", oSpawned);
            //% chance
            else if ((nVeggie > 70) && (nVeggie <= 72))
                CreateItemOnObject("shimmeringblade", oSpawned);
            //% chance
            else if ((nVeggie > 72) && (nVeggie <= 74))
                CreateItemOnObject("thecleavelander", oSpawned);
            //% chance
            else if ((nVeggie > 74) && (nVeggie <= 76))
                CreateItemOnObject("lifesapper", oSpawned);
            //% chance
            else if ((nVeggie > 76) && (nVeggie <= 78))
                CreateItemOnObject("heartpiercer", oSpawned);
            //% chance
            else if ((nVeggie > 78) && (nVeggie <= 80))
                CreateItemOnObject("thewifebeater", oSpawned);
            //% chance
            else if ((nVeggie > 80) && (nVeggie <= 82))
                CreateItemOnObject("theeclipse", oSpawned);
            //% chance
            else if ((nVeggie > 82) && (nVeggie <= 84))
                CreateItemOnObject("justlshammer", oSpawned);
            //% chance
            else if ((nVeggie > 84) && (nVeggie <= 86))
                CreateItemOnObject("sunstaff", oSpawned);
            //% chance
            else if ((nVeggie > 86) && (nVeggie <= 88))
                CreateItemOnObject("destinysedge", oSpawned);
            //% chance
            else if ((nVeggie > 88) && (nVeggie <= 90))
                CreateItemOnObject("theicyheart", oSpawned);
            //% chance
            else if ((nVeggie > 90) && (nVeggie <= 92))
                CreateItemOnObject("dregothsrage", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 94))
                CreateItemOnObject("theharvester", oSpawned);
            //% chance
            else if ((nVeggie > 94) && (nVeggie <= 96))
                CreateItemOnObject("gauntletsoffai", oSpawned);
            //% chance
            else if ((nVeggie > 96) && (nVeggie <= 98))
                CreateItemOnObject("blindingedgegaun", oSpawned);
            //% chance
            else if (nVeggie > 98)
                CreateItemOnObject("greaterringofadr", oSpawned);
        }


    // Table 57
    if (nLootTable == 57)
    {

        // 3% Chance
        if (d100(1) <= 6)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "farrauksreaper";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    // Table 58
    if (nLootTable == 58)
    {

        // 2% Chance
        if (d100(1) <= 4)
        {
        // Created Custom Item with ResRef of garlic
        sTemplate = "imbuedobsidai";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }

        }
        // Table 56 for Epic Level Foes  New Rares
    if (nLootTable == 59)
    {
        // 5% Chance
        if (d100() <= 5)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("dregothsrage", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("iconicamuletofst", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("iconicringofdext", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("iconicamuletofwi", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("iconicringofinte", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 12))
                CreateItemOnObject("iconicringofs", oSpawned);
            //% chance
            else if ((nVeggie > 12) && (nVeggie <= 14))
                CreateItemOnObject("iconicringofwisd", oSpawned);
            //% chance
            else if ((nVeggie > 14) && (nVeggie <= 16))
                CreateItemOnObject("iconicamuletofco", oSpawned);
            //% chance
            else if ((nVeggie > 16) && (nVeggie <= 18))
                CreateItemOnObject("iconicamuletofde", oSpawned);
            //% chance
            else if ((nVeggie > 18) && (nVeggie <= 20))
                CreateItemOnObject("iconicamuletofin", oSpawned);
            //% chance
            else if ((nVeggie > 20) && (nVeggie <= 22))
                CreateItemOnObject("iconicringofchar", oSpawned);
            //% chance
            else if ((nVeggie > 22) && (nVeggie <= 24))
                CreateItemOnObject("iconicringofcons", oSpawned);
            //% chance
            else if ((nVeggie > 24) && (nVeggie <= 26))
                CreateItemOnObject("lalorsspine", oSpawned);
            //% chance
            else if ((nVeggie > 26) && (nVeggie <= 28))
                CreateItemOnObject("shininggythka", oSpawned);
            //% chance
            else if ((nVeggie > 28) && (nVeggie <= 30))
                CreateItemOnObject("devestation", oSpawned);
            //% chance
            else if ((nVeggie > 30) && (nVeggie <= 32))
                CreateItemOnObject("drakebonegythk", oSpawned);
            //% chance
            else if ((nVeggie > 32) && (nVeggie <= 34))
                CreateItemOnObject("robesofthewis", oSpawned);
            //% chance
            else if ((nVeggie > 34) && (nVeggie <= 36))
                CreateItemOnObject("embraceofthespir", oSpawned);
            //% chance
            else if ((nVeggie > 36) && (nVeggie <= 38))
                CreateItemOnObject("meteorforgedpl", oSpawned);
            //% chance
            else if ((nVeggie > 38) && (nVeggie <= 40))
                CreateItemOnObject("meteorforgedhe", oSpawned);
            //% chance
            else if ((nVeggie > 40) && (nVeggie <= 42))
                CreateItemOnObject("meteorforgedarmo", oSpawned);
            //% chance
            else if ((nVeggie > 42) && (nVeggie <= 44))
                CreateItemOnObject("meteorforgedchai", oSpawned);
                //% chance
            else if ((nVeggie > 44) && (nVeggie <= 46))
                CreateItemOnObject("imbuedagafarilar", oSpawned);
             //% chance
            else if ((nVeggie > 46) && (nVeggie <= 48))
                CreateItemOnObject("imbuedagafarisma", oSpawned);
            //% chance
            else if ((nVeggie > 48) && (nVeggie <= 50))
                CreateItemOnObject("imbuedagafarishi", oSpawned);
            //% chance
            else if ((nVeggie > 50) && (nVeggie <= 52))
                CreateItemOnObject("guardianofthe", oSpawned);
            //% chance
            else if ((nVeggie > 52) && (nVeggie <= 54))
                CreateItemOnObject("blindingedgegaun", oSpawned);
            //% chance
            else if ((nVeggie > 54) && (nVeggie <= 56))
                CreateItemOnObject("heartofland", oSpawned);
             //% chance
            else if ((nVeggie > 56) && (nVeggie <= 58))
                CreateItemOnObject("x2_it_sparscr902", oSpawned);
            //% chance
            else if ((nVeggie > 58) && (nVeggie <= 60))
                CreateItemOnObject("x2_it_spdvscr509", oSpawned);
            //% chance
            else if ((nVeggie > 60) && (nVeggie <= 62))
                CreateItemOnObject("psitana", oSpawned);
            //% chance
            else if ((nVeggie > 62) && (nVeggie <= 64))
                CreateItemOnObject("messengerofraj", oSpawned);
            //% chance
            else if ((nVeggie > 64) && (nVeggie <= 66))
                CreateItemOnObject("retscutter", oSpawned);
            //% chance
            else if ((nVeggie > 66) && (nVeggie <= 68))
                CreateItemOnObject("solarflare", oSpawned);
            //% chance
            else if ((nVeggie > 68) && (nVeggie <= 70))
                CreateItemOnObject("lalisbliss", oSpawned);
            //% chance
            else if ((nVeggie > 70) && (nVeggie <= 72))
                CreateItemOnObject("shimmeringblade", oSpawned);
            //% chance
            else if ((nVeggie > 72) && (nVeggie <= 74))
                CreateItemOnObject("thecleavelander", oSpawned);
            //% chance
            else if ((nVeggie > 74) && (nVeggie <= 76))
                CreateItemOnObject("lifesapper", oSpawned);
            //% chance
            else if ((nVeggie > 76) && (nVeggie <= 78))
                CreateItemOnObject("heartpiercer", oSpawned);
            //% chance
            else if ((nVeggie > 78) && (nVeggie <= 80))
                CreateItemOnObject("thewifebeater", oSpawned);
            //% chance
            else if ((nVeggie > 80) && (nVeggie <= 82))
                CreateItemOnObject("theeclipse", oSpawned);
            //% chance
            else if ((nVeggie > 82) && (nVeggie <= 84))
                CreateItemOnObject("justlshammer", oSpawned);
            //% chance
            else if ((nVeggie > 84) && (nVeggie <= 86))
                CreateItemOnObject("sunstaff", oSpawned);
            //% chance
            else if ((nVeggie > 86) && (nVeggie <= 88))
                CreateItemOnObject("destinysedge", oSpawned);
            //% chance
            else if ((nVeggie > 88) && (nVeggie <= 90))
                CreateItemOnObject("theicyheart", oSpawned);
            //% chance
            else if ((nVeggie > 90) && (nVeggie <= 92))
                CreateItemOnObject("dregothsrage", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 94))
                CreateItemOnObject("theharvester", oSpawned);
            //% chance
            else if ((nVeggie > 94) && (nVeggie <= 96))
                CreateItemOnObject("gauntletsoffai", oSpawned);
            //% chance
            else if ((nVeggie > 96) && (nVeggie <= 98))
                CreateItemOnObject("blindingedgegaun", oSpawned);
            //% chance
            else if (nVeggie > 98)
                CreateItemOnObject("greaterringofadr", oSpawned);
        }
        // Table 60

  if (nLootTable == 60)
    {
        // 90% Chance
        if (d100() <= 90)
        {
            int nVeggie = d100();
            //% chance
            if (nVeggie <= 2)
                CreateItemOnObject("robesofliving", oSpawned);
            //% chance
            else if ((nVeggie > 2) && (nVeggie <= 4))
                CreateItemOnObject("pyreenforgedplat", oSpawned);
            //% chance
            else if ((nVeggie > 4) && (nVeggie <= 6))
                CreateItemOnObject("rogueswrap", oSpawned);
            //% chance
            else if ((nVeggie > 6) && (nVeggie <= 8))
                CreateItemOnObject("imbuedshield", oSpawned);
            //% chance
            else if ((nVeggie > 8) && (nVeggie <= 10))
                CreateItemOnObject("mastersringofstr", oSpawned);
            //% chance
            else if ((nVeggie > 10) && (nVeggie <= 15))
                CreateItemOnObject("mastersringofcon", oSpawned);
            //% chance
            else if ((nVeggie > 15) && (nVeggie <= 17))
                CreateItemOnObject("mastersringofwis", oSpawned);
            //% chance
            else if ((nVeggie > 17) && (nVeggie <= 19))
                CreateItemOnObject("dimensionalblade", oSpawned);
            //% chance
            else if ((nVeggie > 19) && (nVeggie <= 21))
                CreateItemOnObject("frostbite", oSpawned);
            //% chance
            else if ((nVeggie > 21) && (nVeggie <= 27))
                CreateItemOnObject("mastersamuletofc", oSpawned);
            //% chance
            else if ((nVeggie > 27) && (nVeggie <= 33))
                CreateItemOnObject("mastersamuletofd", oSpawned);
            //% chance
            else if ((nVeggie > 33) && (nVeggie <= 39))
                CreateItemOnObject("mastersringofcha", oSpawned);
            //% chance
            else if ((nVeggie > 39) && (nVeggie <= 45))
                CreateItemOnObject("mastersamuletofw", oSpawned);
            //% chance
            else if ((nVeggie > 45) && (nVeggie <= 51))
                CreateItemOnObject("mastersamuletofs", oSpawned);
            //% chance
            else if ((nVeggie > 51) && (nVeggie <= 57))
                CreateItemOnObject("mastersamuletofi", oSpawned);
            //% chance
            else if ((nVeggie > 57) && (nVeggie <= 63))
                CreateItemOnObject("mastersringofdex", oSpawned);
            //% chance
            else if ((nVeggie > 63) && (nVeggie <= 69))
                CreateItemOnObject("mastersringofint", oSpawned);
            //% chance
            else if ((nVeggie > 69) && (nVeggie <= 75))
                CreateItemOnObject("mastersamuletofh", oSpawned);
            //% chance
            else if ((nVeggie > 75) && (nVeggie <= 81))
                CreateItemOnObject("astralblade", oSpawned);
            //% chance
            else if ((nVeggie > 81) && (nVeggie <= 83))
                CreateItemOnObject("backlash", oSpawned);
            //% chance
            else if ((nVeggie > 83) && (nVeggie <= 85))
                CreateItemOnObject("sureshot", oSpawned);
            //% chance
            else if ((nVeggie > 85) && (nVeggie <= 87))
                CreateItemOnObject("forgottenaxe", oSpawned);
                //% chance
            else if ((nVeggie > 87) && (nVeggie <= 89))
                CreateItemOnObject("severer", oSpawned);
             //% chance
            else if ((nVeggie > 89) && (nVeggie <= 92))
                CreateItemOnObject("ringofhate", oSpawned);
            //% chance
            else if ((nVeggie > 92) && (nVeggie <= 95))
                CreateItemOnObject("sunslasher", oSpawned);
            //% chance
            else if ((nVeggie > 97) && (nVeggie <= 99))
                CreateItemOnObject("thedurvishsblade", oSpawned);
            //% chance
            else if (nVeggie > 99)
                CreateItemOnObject("robeofashend", oSpawned);
        }
    // Table 61
    if (nLootTable == 61)
    {
        // 15% Chance
        if (d100(1) <= 15)
        {
        // Drops VA Key
        sTemplate = "vakey";
        nStack = 1;
        }
        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
    }
    }
//   if ((nVeggie > 44) && (nVeggie < 91)){
//     sTemplate = "garlic";
//    //
//        // 20% Chance
//        if (d100(1) < 20)
//        {
//        // Created Custom Item with ResRef of garlic
//        sTemplate = "voidrune";
//        nStack = 1;
//        }
//        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
//    }
//    if (nLootTable == 42)
//    {
//
//        // 20% Chance
//    if (d100(1) < 20)
//        {
//        // Created Custom Item with ResRef of garlic
//        sTemplate = "touchrune";
//        nStack = 1;
//        }
//    }
//    if (nLootTable == 43)
//    {
//
//        // 20% Chance
//        if (d100(1) < 20)
//        {
//        // Created Custom Item with ResRef of garlic
//        sTemplate = "projectionrune";
//        nStack = 1;
//        }
//        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
//    }
//    if (nLootTable == 44)
//    {
//
//        // 20% Chance
//    if (d100(1) < 20)
//        {
//        // Created Custom Item with ResRef of garlic
//        sTemplate = "selfrune";
//        nStack = 1;
//        }
//        oItem = CreateItemOnObject(sTemplate, oSpawned, nStack);
//    }


// -------------------------------------------
// Only Make Modifications Between These Lines
}}
//void main () {}
