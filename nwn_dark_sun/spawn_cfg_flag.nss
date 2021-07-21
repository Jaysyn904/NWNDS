//
// Spawn Flags
//
void SpawnFlags(object oSpawn, int nFlagTableNumber)
{
    // Initialize Values
    string sSpawnName = GetName(oSpawn);
    string sSpawnTag = GetTag(oSpawn);
    string sFlags, sTemplate;

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Sample Complex Replacement
    // Using FT without FT00 will
    // Default to nFlagTableNumber 0
 //   if (nFlagTableNumber == 0)
  //  {
   //     // Old Method of using SpawnTag
   //     if (sSpawnTag == "myspawns")
  //      {
    //        sFlags = "SP_SN02_SA_RW";
    //        sTemplate = "NW_DOG";
    //    }

  //      if (sSpawnTag == "undead")
   //     {
   //         sFlags = "SP_SNO4";
 //         sTemplate = "NW_ZOMBIE01";
   //     }
 //  }
    //

    // Sample Simple Replacement Flag
    // Completely Replaces Flags
    // On Spawnpoints with FT01
    // FIELDS    sligs/fieldsbandits
    if (nFlagTableNumber == 0)
    {
        sFlags = "_SN02_SA_SD03M01_PR00T2_LT16_PCR";
    }
    //

       // ashen wastes giants/
    if (nFlagTableNumber == 1)
    {
        sFlags = "_SN06M03_SA_SD03M01_PCR";
    }
    //
   // GREAT SPYRE

    if (nFlagTableNumber == 2)
    {
        sFlags = "_SG_SN02_SA_SD03M01_SL14R01_PCR";

    }
//Gskeletons
    if (nFlagTableNumber == 3)
    {
        sFlags = "_SN02_SA_SD03M01_LT00_SL14R01_PCR";

    }
//Magera
    if (nFlagTableNumber == 4)
    {
        sFlags = "_SN03M01_SA_SD03M01_LT03_SL14R01_PCR";

    }
    // apprenticedefilers  - sligs
    if (nFlagTableNumber == 5)
    {
        sFlags = "_SN02_SA_SD03M01_PCR";

    }

         // mummies
    if (nFlagTableNumber == 6)
    {
        sFlags = "_SN03_SA_SD03M01_LT17_PCR";

    }
    // Sample Template Flags
    // These Flags Get Added
 //   // To Spawnpoints with FT02
 //   if (nFlagTableNumber == 2)
 //   {
  //      sFlags = "_RW_PC05R";
//   }
    //



// -------------------------------------------
// Only Make Modifications Between These Lines
//

    // Record Values
    if (sFlags != "")
    {
        SetLocalString(oSpawn, "f_Flags", sFlags);
    }
    else
    {
        SetLocalString(oSpawn, "f_Flags", sSpawnName);
    }
    if (sTemplate != "")
    {
        SetLocalString(oSpawn, "f_Template", sTemplate);
    }
    else
    {
        SetLocalString(oSpawn, "f_Template", sSpawnTag);
    }
}
