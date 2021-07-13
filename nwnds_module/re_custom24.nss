////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 24 - Crimson Ruins: LVL 20+

Areas Used in:
Crimson Ruins - 1st Floor

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

        case 0:sChoice = "ar_lask003"; // Lask Patriarch
        fCR = 27.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;

        case 1:sChoice = "cloaker001"; // Cloaker
        fCR = 11.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 2:sChoice = "ar_mepfire001"; // Mephit, Fire
        fCR = 4.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 3:sChoice = "ar_bloodsent001"; // Bloodstone Sentinel
        fCR = 12.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 4:sChoice = "ar_ebonsent001"; // Ebony Sentinel
        fCR = 16.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 5:sChoice = "ar_onyxsent001"; // Onyx Sentinel
        fCR = 8.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 6:sChoice = "ar_skyrossent001"; // Skyros Sentinel
        fCR = 5.0;
        iMinNum = 3;
        iMaxNum = 8;
        iWeight = 4;
        break;

        case 7:sChoice = "necrophidius"; // Necrophidius
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 8:sChoice = "barbscorpion_001"; // Barbed Scorpion
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 16;
        break;

        case 9:sChoice = "crimscorpion_001"; // Crimson Scorpion
        fCR = 18.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;

        case 10:sChoice = "crimscorpion_002"; // Black Touched Crimson Scorpion
        fCR = 23.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
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
