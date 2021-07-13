////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 10 - Undead CR 0 - CR 5

Areas Used in:
Dead's Revenge
Tyr - Southern Expanse - Graveyard


*/
////////////////////////////////////////////////////


void main()
{
int iVarNum = GetLocalInt(OBJECT_SELF, "re_iVarNum");
float fMinCR = GetLocalFloat(OBJECT_SELF, "re_fMinCR");
float fMaxCR = GetLocalFloat(OBJECT_SELF, "re_fMaxCR");
int END;
int iCounter1;
int iCounter2;
int iMaxNum;
int iMinNum;
int iWeight;
float fCR;
string sChoice;
object oMod = GetModule();
while(!END)
    {
    sChoice = "";
    switch(iCounter1)
        {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ===========================================================================================================================================
// Encounter Weights
// Very Rare    = 2
// Rare         = 4
// Uncommon     = 8
// Common       = 16
//============================================================================================================================================
//CUSTOM ENCOUNTER TABLE BELOW:///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*      case 0:sChoice = "tarek_001"; // Creature ResRef goes between the " marks.
        fCR = 6.0;                      // Set this to the challenge rating of the creature as shown on the creature pallette.
        iMinNum = 0;                    //
        iMaxNum = 0;                    // If these are left at zero then an appropriate number of creatures will be spawned based on the CR.
        iWeight = 4;                    // This is the number of times this mob should be considered for the likelyhood of appearing.
        break;
*/
        case 0:sChoice = "skeletondwarf001"; // Skeleton, Dwarf
        fCR = 1.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 1:sChoice = "blight001"; // Blight
        fCR = 1.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 2:sChoice = "skeletonhuman001"; // Skeleton, Human
        fCR = 1.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 3:sChoice = "zombie003"; // Zombie, Human
        fCR = 2.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 4:sChoice = "zombie002"; // Zombie, Mul
        fCR = 2.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 5:sChoice = "skeletonhgiant"; // Skeleton, Half-Giant
        fCR = 2.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 6:sChoice = "ghoul001"; // Ghoul
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 7:sChoice = "ar_shadowrat001"; // Shadow Rat, Common
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 8:sChoice = "shadow003"; // Shadow, Lesser
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 9:sChoice = "ar_shadowrat002"; // Shadow Rat, Dire
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 10:sChoice = "tombmote001"; // Tomb Mote
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 11:sChoice = "bonebat001"; // Bonebat
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 12:sChoice = "ghast001"; // Ghast
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 13:sChoice = "ioramh001"; // Ioramh
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 14:sChoice = "deathlock001"; // Deathlock
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM ENCOUNTER TABLE!  DO NOT EDIT BELOW THIS LINE//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        default:END = TRUE;
        break;
        }
    if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
        {
        for(iCounter2 = 1; iCounter2 <= iWeight; iCounter2++)
            {
            SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
            SetLocalInt(oMod, "re_iMaxNumberOfCreatures" + IntToString(iVarNum), iMaxNum);
            SetLocalInt(oMod, "re_iMinNumberOfCreatures" + IntToString(iVarNum), iMinNum);
            iVarNum++;
            }
        }
    iCounter1++;
    }
SetLocalInt(OBJECT_SELF, "re_iVarNum", iVarNum);
}
