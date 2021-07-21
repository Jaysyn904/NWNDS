// written by fluffyamoeba 09-07-06
// actually gets the LA modifier, not ECL
// gets the LA from ecl.2da (actually the 2da cache)
// used to hand out XP adjusted for LA

int GetECLMod(object oCreature);

#include "inc_utility"

int GetECLMod(object oCreature)
{
    int nRace = GetRacialType(oCreature); //note this is not MyPRCGetRacialType becuase we want to include subraces too
    int nLA = 0;
    nLA = StringToInt(Get2DACache("ECL", "LA", nRace));
    return nLA;
}
