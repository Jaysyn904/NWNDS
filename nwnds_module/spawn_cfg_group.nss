//
// Spawn Groups
//
//
// nChildrenSpawned
// : Number of Total Children ever Spawned
//
// nSpawnCount
// : Number of Children currently Alive
//
// nSpawnNumber
// : Number of Children to Maintain at Spawn
//
// nRandomWalk
// : Walking Randomly? TRUE/FALSE
//
// nPlaceable
// : Spawning Placeables? TRUE/FALSE
//
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
//
//
string SpawnGroup(object oSpawn, string sTemplate)
{
    // Initialize
    string sRetTemplate;

    // Initialize Values
    int nSpawnNumber = GetLocalInt(oSpawn, "f_SpawnNumber");
    int nRandomWalk = GetLocalInt(oSpawn, "f_RandomWalk");
    int nPlaceable = GetLocalInt(oSpawn, "f_Placeable");
    int nChildrenSpawned = GetLocalInt(oSpawn, "ChildrenSpawned");
    int nSpawnCount = GetLocalInt(oSpawn, "SpawnCount");

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // gw_halfling
    if (sTemplate == "gw_halfling")
    {
        switch(d4(1))
        {
            case 1:
            sRetTemplate = "halflingraider";
            break;
            case 2:
            sRetTemplate = "halflingraide001";
            break;
            case 3:
            sRetTemplate = "halflingraide001";
            break;
            case 4:
            sRetTemplate = "halflingraide002";
            break;
        }
    }
    //

    // gw_mul
    if (sTemplate == "gw_mul")
    {
        switch(d4(1))
        {
            case 1:
            sRetTemplate = "renegademul";
            break;
            case 2:
            sRetTemplate = "renegademul001";
            break;
            case 3:
            sRetTemplate = "renegademul";
            break;
            case 4:
            sRetTemplate = "renegademul";
            break;
        }
    }
    //

    // ashengiants
    if (sTemplate == "ashengiants")
    {
        switch(d4(1))
        {
            case 1:
            sRetTemplate = "gntfrost001";
            break;
            case 2:
            sRetTemplate = "gntfrost001";
            break;
            case 3:
            sRetTemplate = "gntfrost001";
            break;
            case 4:
            sRetTemplate = "gntfrost002";
            break;
        }
    }
    //

    // cr_militia
    if (sTemplate == "cr_militia")
    {
        switch(d2(1))
        {
            case 1:
            sRetTemplate = "cr_militia_m";
            break;
            case 2:
            sRetTemplate = "cr_militia_f";
            break;
        }
    }
    //

    // pg_guard
    if (sTemplate == "pg_guard")
    {
        switch(d2(1))
        {
            case 1:
            sRetTemplate = "pg_guard_m";
            break;
            case 2:
            sRetTemplate = "pg_guard_f";
            break;
        }
    }
    //

    // Goblins
    if (sTemplate == "goblins_low")
    {
        if (d2(1) == 1)
        {
            sRetTemplate = "NW_GOBLINA";
        }
        else
        {
            sRetTemplate = "NW_GOBLINB";
        }
    }
    //

    // undead
    if (sTemplate == "undead")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "skelchief001";
            break;
            case 2:
            sRetTemplate = "skelmage001";
            break;
            case 3:
            sRetTemplate = "skelpriest001";
            break;
            case 4:
            sRetTemplate = "skeletonwarrior";
            break;
            case 5:
            sRetTemplate = "ds_undead_fael";
            break;
            case 6:
            sRetTemplate = "plagueblight";
            break;
        }
    }
    //

    // Great Spyre
    if (sTemplate == "greatspyre")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "dagoron";
            break;
            case 2:
            sRetTemplate = "dagoron";
            break;
            case 3:
            sRetTemplate = "hafling";
            break;
            case 4:
            sRetTemplate = "ds_strine001";
            break;
            case 5:
            sRetTemplate = "ds_strine001";
            break;
            case 6:
            sRetTemplate = "wilddog001";
            break;
        }
    }
    //

    // dune bandits
    if (sTemplate == "dunebandits")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "banditdog002";
            break;
            case 2:
            sRetTemplate = "dbandit003";
            break;
            case 3:
            sRetTemplate = "dbandit003";
            break;
            case 4:
            sRetTemplate = "dbandit004";
            break;
            case 5:
            sRetTemplate = "dbandit004";
            break;
            case 6:
            sRetTemplate = "dbandit002";
            break;
        }
    }
    //

    // field bandits
    if (sTemplate == "fieldbandits")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "bandit";
            break;
            case 2:
            sRetTemplate = "bandit";
            break;
            case 3:
            sRetTemplate = "hafling";
            break;
            case 4:
            sRetTemplate = "hafling";
            break;
            case 5:
            sRetTemplate = "bandit";
            break;
            case 6:
            sRetTemplate = "psibandit";
            break;
        }
    }
    //

    // ashenundead
    if (sTemplate == "ashenundead")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "mumfight001";
            break;
            case 2:
            sRetTemplate = "mumfight001";
            break;
            case 3:
            sRetTemplate = "mummyboss001";
            break;
            case 4:
            sRetTemplate = "mummyboss001";
            break;
            case 5:
            sRetTemplate = "mumfight001";
            break;
            case 6:
            sRetTemplate = "mumfight001";
            break;
        }
    }
    //

    // Santukas and Abominations
    if (sTemplate == "santukasgp")
    {
        switch(d6(1))
        {
            case 1:
            sRetTemplate = "greatsantukas001";
            break;
            case 2:
            sRetTemplate = "santukas001";
            break;
            case 3:
            sRetTemplate = "santukas001";
            break;
            case 4:
            sRetTemplate = "santukas001";
            break;
            case 5:
            sRetTemplate = "abomination002";
            break;
            case 6:
            sRetTemplate = "abomination002";
            break;
        }
    }
    //

    // Pirates and Boss
    if (sTemplate == "pirates")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "cygnus");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "pirate";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "cygnus";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Cult Leader and cultists
    if (sTemplate == "cultists")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "cultleader");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "cultist";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "cultleader";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Termites and King
    if (sTemplate == "termites")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "termiteking001");

            // Check if Boss is Alive
            if (oBoss != OBJECT_INVALID && GetIsDead(oBoss) == FALSE)
            {
                // He's alive, spawn a Peon to keep him Company
                sRetTemplate = "termitesoldie001";
            }
            else
            {
                // He's dead, Deactivate Camp!
                SetLocalInt(oSpawn, "SpawnDeactivated", TRUE);
            }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "termiteking001";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

    // Dark Spiders and Queen
    if (sTemplate == "darkspiders")
    {
        int nIsBossSpawned = GetLocalInt(oSpawn, "IsBossSpawned");
        if (nIsBossSpawned == TRUE)
        {
            // Find the Boss
            object oBoss = GetChildByTag(oSpawn, "darkspiderque002");

            // Check if Boss is Alive
           if (d2(1) == 1)
           {
            sRetTemplate = "darkspider001";
           }
           else
           {
            sRetTemplate = "darkpsionspid001";
           }
        }
        else
        {
            // No Boss, so Let's Spawn Him
            sRetTemplate = "darkspiderque001";
            SetLocalInt(oSpawn, "IsBossSpawned", TRUE);
        }
    }
    //

// Scaled encounter - Altaruk Guards
    if (sTemplate == "alt_guards")
    {
        // Initialize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);
        // Cycle through PCs in Area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
            oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs > 0)
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }
        else
        {
            nAveragePCLevel = 3;
        }
        // Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            // Spawn Something with CR 1
            case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
                sRetTemplate = "ar_altguard_001";
            break;
            //
            // Spawn Something with CR 10
            case 10: case 11: case 12: case 13: case 14: case 15: case 16: case 17: case 18: case 19:
                sRetTemplate = "ar_altguard_002";
            break;
            //
            // Spawn Something with CR 20
            case 20: case 21: case 22: case 23: case 24: case 25: case 26: case 27: case 28: case 29:
                sRetTemplate = "ar_altguard_003";
            break;
            //
            // Spawn Something with CR 30
            case 30: case 31: case 32: case 33: case 34: case 35: case 36: case 37: case 38: case 39:
                sRetTemplate = "ar_altguard_004";
            break;
            //
            // Whatever. I have no idea why this doesn't work right.
            case 40:
                sRetTemplate = "ar_altguard_004";
            break;
            //
    }

    }
    // Scaled encounter - Coldfire Primals
    if (sTemplate == "cfd_primals")
    {
        // Initialize Variables
        int nTotalPCs;
        int nTotalPCLevel;
        int nAveragePCLevel;
        object oArea = GetArea(OBJECT_SELF);
        // Cycle through PCs in Area
        object oPC = GetFirstObjectInArea(oArea);
        while (oPC != OBJECT_INVALID)
        {
            if (GetIsPC(oPC) == TRUE)
            {
                nTotalPCs++;
                nTotalPCLevel = nTotalPCLevel + GetHitDice(oPC);
            }
            oPC = GetNextObjectInArea(oArea);
        }
        if (nTotalPCs > 0)
        {
            nAveragePCLevel = nTotalPCLevel / nTotalPCs;
        }
        else
        {
            nAveragePCLevel = 3;
        }
        // Select a Creature to Spawn
        switch (nAveragePCLevel)
        {
            // Spawn Yintak Berserker
            case 3: case 5: case 7: case 9: case 11: case 13: case 15: case 17: case 19: case 21: case 23:
            case 25: case 27: case 29: case 31: case 33:
                sRetTemplate = "yintakberserk001";
            break;
            // Spawn Fire Yintak
            case 4: case 6: case 8: case 10: case 12: case 14: case 16: case 18: case 20: case 22: case 24:
            case 26: case 28: case 30: case 32: case 34:
                sRetTemplate = "fireyintak001";
            break;
            // Spawn Primal Water Elemental
            case 36: case 38: case 40:
                sRetTemplate = "primalwaterele";
            break;
            //
            // Spawn Primal Earth Elemental
            case 35: case 37: case 39:
                sRetTemplate = "primalearthele";
            break;
            //
        }

    }
    // SS_Creature_Spawn
   if (sTemplate == "SS_CREATURE_SPAWN")
   {
        switch(d100(1))
       {
       case 1:
       sRetTemplate = "ar_gith_001";
       break;
       case 2:
       sRetTemplate = "ar_gith_001";
       break;
       case 3:
       sRetTemplate = "ar_gith_001";
       break;
       case 4:
       sRetTemplate = "ar_gith_002";
       break;
       case 5:
       sRetTemplate = "ar_gith_003";
       break;
       case 6:
       sRetTemplate = "athyena001";
       break;
       case 7:
       sRetTemplate = "athyena001";
       break;
       case 8:
       sRetTemplate = "ds_ztal001";
       break;
       case 9:
       sRetTemplate = "ds_ztal002";
       break;
       case 10:
       sRetTemplate = "kestrekel001";
       break;
       case 11:
       sRetTemplate = "kestrekel001";
       break;
       case 12:
       sRetTemplate = "zep_scorp003";
       break;
       case 13:
       sRetTemplate = "zep_scorp003";
       break;
       case 14:
       sRetTemplate = "desertviper_001";
       break;
       case 15:
       sRetTemplate = "desertviper_001";
       break;
       case 16:
       sRetTemplate = "jankx001";
       break;
       case 17:
       sRetTemplate = "jankx001";
       break;
       case 18:
       sRetTemplate = "skeletongiant001";
       break;
       case 19:
       sRetTemplate = "sitak001";
       break;
       case 20:
       sRetTemplate = "sitak001";
       break;
       case 21:
       sRetTemplate = "skeletonhuman001";
       break;
       case 22:
       sRetTemplate = "zhackal001";
       break;
       case 23:
       sRetTemplate = "zhackal001";
       break;
       case 24:
       sRetTemplate = "skeletonhuman001";
       break;
       case 25:
       sRetTemplate = "skeletonhuman002";
       break;
       case 26:
       sRetTemplate = "skeletonhuman002";
       break;
       case 27:
       sRetTemplate = "zep_skelpir3";
       break;
       case 28:
       sRetTemplate = "zombie002";
       break;
       case 29:
       sRetTemplate = "zombie002";
       break;
       case 30:
       sRetTemplate = "zombie001";
       break;
       case 31:
       sRetTemplate = "ds_kivit001";
       break;
       case 32:
       sRetTemplate = "ar_cheetah001";
       break;
       case 33:
       sRetTemplate = "zep_cougar";
       break;
       case 34:
       sRetTemplate = "ar_gith_001";
       break;
       case 35:
       sRetTemplate = "ar_gith_001";
       break;
       case 36:
       sRetTemplate = "ar_gith_001";
       break;
       case 37:
       sRetTemplate = "ar_gith_002";
       break;
       case 38:
       sRetTemplate = "ar_gith_003";
       break;
       case 39:
       sRetTemplate = "athyena001";
       break;
       case 40:
       sRetTemplate = "athyena001";
       break;
       case 41:
       sRetTemplate = "ds_ztal001";
       break;
       case 42:
       sRetTemplate = "ds_ztal002";
       break;
       case 43:
       sRetTemplate = "kestrekel001";
       break;
       case 44:
       sRetTemplate = "kestrekel001";
       break;
       case 45:
       sRetTemplate = "zep_scorp003";
       break;
       case 46:
       sRetTemplate = "zep_scorp003";
       break;
       case 47:
       sRetTemplate = "desertviper_001";
       break;
       case 48:
       sRetTemplate = "desertviper_001";
       break;
       case 49:
       sRetTemplate = "ds_jankx001";
       break;
       case 50:
       sRetTemplate = "ds_jankx001";
       break;
       case 51:
       sRetTemplate = "skeletongiant001";
       break;
       case 52:
       sRetTemplate = "sitak001";
       break;
       case 53:
       sRetTemplate = "sitak001";
       break;
       case 54:
       sRetTemplate = "skeletonhuman001";
       break;
       case 55:
       sRetTemplate = "zhackal001";
       break;
       case 56:
       sRetTemplate = "zhackal001";
       break;
       case 57:
       sRetTemplate = "skeletonhuman001";
       break;
       case 58:
       sRetTemplate = "skeletonhuman002";
       break;
       case 59:
       sRetTemplate = "skeletonhuman002";
       break;
       case 60:
       sRetTemplate = "zep_skelpir3";
       break;
       case 61:
       sRetTemplate = "zombie002";
       break;
       case 62:
       sRetTemplate = "zombie002";
       break;
       case 63:
       sRetTemplate = "zombie001";
       break;
       case 64:
       sRetTemplate = "ds_kivit001";
       break;
       case 65:
       sRetTemplate = "ar_cheetah001";
       break;
       case 66:
       sRetTemplate = "zep_cougar";
       break;
       case 67:
       sRetTemplate = "ar_gith_001";
       break;
       case 68:
       sRetTemplate = "ar_gith_001";
       break;
       case 69:
       sRetTemplate = "ar_gith_001";
       break;
       case 70:
       sRetTemplate = "ar_gith_002";
       break;
       case 71:
       sRetTemplate = "ar_gith_003";
       break;
       case 72:
       sRetTemplate = "athyena001";
       break;
       case 73:
       sRetTemplate = "athyena001";
       break;
       case 74:
       sRetTemplate = "ds_ztal001";
       break;
       case 75:
       sRetTemplate = "ds_ztal002";
       break;
       case 76:
       sRetTemplate = "kestrekel001";
       break;
       case 77:
       sRetTemplate = "kestrekel001";
       break;
       case 78:
       sRetTemplate = "zep_scorp003";
       break;
       case 79:
       sRetTemplate = "zep_scorp003";
       break;
       case 80:
       sRetTemplate = "desertviper_001";
       break;
       case 81:
       sRetTemplate = "desertviper_001";
       break;
       case 82:
       sRetTemplate = "ds_jankx001";
       break;
       case 83:
       sRetTemplate = "ds_jankx001";
       break;
       case 84:
       sRetTemplate = "skeletongiant001";
       break;
       case 85:
       sRetTemplate = "sitak001";
       break;
       case 86:
       sRetTemplate = "sitak001";
       break;
       case 87:
       sRetTemplate = "skeletonhuman001";
       break;
       case 88:
       sRetTemplate = "zhackal001";
       break;
       case 89:
       sRetTemplate = "zhackal001";
       break;
       case 90:
       sRetTemplate = "skeletonhuman001";
       break;
       case 91:
       sRetTemplate = "skeletonhuman002";
       break;
       case 92:
       sRetTemplate = "skeletonhuman002";
       break;
       case 93:
       sRetTemplate = "zep_skelpir3";
       break;
       case 94:
       sRetTemplate = "zombie002";
       break;
       case 95:
       sRetTemplate = "zombie002";
       break;
       case 96:
       sRetTemplate = "zombie001";
       break;
       case 97:
       sRetTemplate = "ds_kivit001";
       break;
       case 98:
       sRetTemplate = "ar_cheetah001";
       break;
       case 99:
       sRetTemplate = "zep_cougar";
       break;
       case 100:
       sRetTemplate = "zep_cougar";
       break;
    }
}

    // FT_IANTO__CREATURE_SPAWN
   if (sTemplate == "FT_IANTO__CREATURE_SPAWN")
   {
        switch(d100(1))
       {
       case 1:
       sRetTemplate = "ar_gith_001";
       break;
       case 2:
       sRetTemplate = "ar_gith_001";
       break;
       case 3:
       sRetTemplate = "ar_gith_001";
       break;
       case 4:
       sRetTemplate = "ar_gith_002";
       break;
       case 5:
       sRetTemplate = "ar_gith_003";
       break;
       case 6:
       sRetTemplate = "athyena001";
       break;
       case 7:
       sRetTemplate = "athyena001";
       break;
       case 8:
       sRetTemplate = "ds_ztal001";
       break;
       case 9:
       sRetTemplate = "ds_ztal002";
       break;
       case 10:
       sRetTemplate = "kestrekel001";
       break;
       case 11:
       sRetTemplate = "kestrekel001";
       break;
       case 12:
       sRetTemplate = "zep_scorp003";
       break;
       case 13:
       sRetTemplate = "zep_scorp003";
       break;
       case 14:
       sRetTemplate = "desertviper_001";
       break;
       case 15:
       sRetTemplate = "desertviper_001";
       break;
       case 16:
       sRetTemplate = "jankx001";
       break;
       case 17:
       sRetTemplate = "jankx001";
       break;
       case 18:
       sRetTemplate = "skeletongiant001";
       break;
       case 19:
       sRetTemplate = "sitak001";
       break;
       case 20:
       sRetTemplate = "sitak001";
       break;
       case 21:
       sRetTemplate = "skeletonhuman001";
       break;
       case 22:
       sRetTemplate = "zhackal001";
       break;
       case 23:
       sRetTemplate = "zhackal001";
       break;
       case 24:
       sRetTemplate = "skeletonhuman001";
       break;
       case 25:
       sRetTemplate = "skeletonhuman002";
       break;
       case 26:
       sRetTemplate = "skeletonhuman002";
       break;
       case 27:
       sRetTemplate = "zep_skelpir3";
       break;
       case 28:
       sRetTemplate = "zombie002";
       break;
       case 29:
       sRetTemplate = "zombie002";
       break;
       case 30:
       sRetTemplate = "zombie001";
       break;
       case 31:
       sRetTemplate = "ds_kivit001";
       break;
       case 32:
       sRetTemplate = "ar_cheetah001";
       break;
       case 33:
       sRetTemplate = "zep_cougar";
       break;
       case 34:
       sRetTemplate = "ar_gith_001";
       break;
       case 35:
       sRetTemplate = "ar_gith_001";
       break;
       case 36:
       sRetTemplate = "ar_gith_001";
       break;
       case 37:
       sRetTemplate = "ar_gith_002";
       break;
       case 38:
       sRetTemplate = "ar_gith_003";
       break;
       case 39:
       sRetTemplate = "athyena001";
       break;
       case 40:
       sRetTemplate = "athyena001";
       break;
       case 41:
       sRetTemplate = "ds_ztal001";
       break;
       case 42:
       sRetTemplate = "ds_ztal002";
       break;
       case 43:
       sRetTemplate = "kestrekel001";
       break;
       case 44:
       sRetTemplate = "kestrekel001";
       break;
       case 45:
       sRetTemplate = "zep_scorp003";
       break;
       case 46:
       sRetTemplate = "zep_scorp003";
       break;
       case 47:
       sRetTemplate = "desertviper_001";
       break;
       case 48:
       sRetTemplate = "desertviper_001";
       break;
       case 49:
       sRetTemplate = "ds_jankx001";
       break;
       case 50:
       sRetTemplate = "ds_jankx001";
       break;
       case 51:
       sRetTemplate = "skeletongiant001";
       break;
       case 52:
       sRetTemplate = "sitak001";
       break;
       case 53:
       sRetTemplate = "sitak001";
       break;
       case 54:
       sRetTemplate = "skeletonhuman001";
       break;
       case 55:
       sRetTemplate = "zhackal001";
       break;
       case 56:
       sRetTemplate = "zhackal001";
       break;
       case 57:
       sRetTemplate = "skeletonhuman001";
       break;
       case 58:
       sRetTemplate = "skeletonhuman002";
       break;
       case 59:
       sRetTemplate = "skeletonhuman002";
       break;
       case 60:
       sRetTemplate = "zep_skelpir3";
       break;
       case 61:
       sRetTemplate = "zombie002";
       break;
       case 62:
       sRetTemplate = "zombie002";
       break;
       case 63:
       sRetTemplate = "zombie001";
       break;
       case 64:
       sRetTemplate = "ds_kivit001";
       break;
       case 65:
       sRetTemplate = "ar_cheetah001";
       break;
       case 66:
       sRetTemplate = "zep_cougar";
       break;
       case 67:
       sRetTemplate = "ar_gith_001";
       break;
       case 68:
       sRetTemplate = "ar_gith_001";
       break;
       case 69:
       sRetTemplate = "ar_gith_001";
       break;
       case 70:
       sRetTemplate = "ar_gith_002";
       break;
       case 71:
       sRetTemplate = "ar_gith_003";
       break;
       case 72:
       sRetTemplate = "athyena001";
       break;
       case 73:
       sRetTemplate = "athyena001";
       break;
       case 74:
       sRetTemplate = "ds_ztal001";
       break;
       case 75:
       sRetTemplate = "ds_ztal002";
       break;
       case 76:
       sRetTemplate = "kestrekel001";
       break;
       case 77:
       sRetTemplate = "kestrekel001";
       break;
       case 78:
       sRetTemplate = "zep_scorp003";
       break;
       case 79:
       sRetTemplate = "zep_scorp003";
       break;
       case 80:
       sRetTemplate = "desertviper_001";
       break;
       case 81:
       sRetTemplate = "desertviper_001";
       break;
       case 82:
       sRetTemplate = "ds_jankx001";
       break;
       case 83:
       sRetTemplate = "ds_jankx001";
       break;
       case 84:
       sRetTemplate = "skeletongiant001";
       break;
       case 85:
       sRetTemplate = "sitak001";
       break;
       case 86:
       sRetTemplate = "sitak001";
       break;
       case 87:
       sRetTemplate = "skeletonhuman001";
       break;
       case 88:
       sRetTemplate = "zhackal001";
       break;
       case 89:
       sRetTemplate = "zhackal001";
       break;
       case 90:
       sRetTemplate = "skeletonhuman001";
       break;
       case 91:
       sRetTemplate = "skeletonhuman002";
       break;
       case 92:
       sRetTemplate = "skeletonhuman002";
       break;
       case 93:
       sRetTemplate = "zep_skelpir3";
       break;
       case 94:
       sRetTemplate = "zombie002";
       break;
       case 95:
       sRetTemplate = "zombie002";
       break;
       case 96:
       sRetTemplate = "zombie001";
       break;
       case 97:
       sRetTemplate = "ds_kivit001";
       break;
       case 98:
       sRetTemplate = "ar_cheetah001";
       break;
       case 99:
       sRetTemplate = "zep_cougar";
       break;
       case 100:
       sRetTemplate = "zep_cougar";
       break;
    }
}

// -------------------------------------------
// Only Make Modifications Between These Lines
//
    return sRetTemplate;
}

//void main (){}

