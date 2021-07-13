////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 15 - Gith Caverns

Areas Used in:
Gith Caverns


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
        case 0:sChoice = "ar_gith_001"; // Gith, Common
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 20;
        iWeight = 16;
        break;

        case 1:sChoice = "ar_gith_002"; // Gith, Warrior
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;

        case 2:sChoice = "ar_gith_003"; // Gith, Archer
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;

        case 3:sChoice = "ar_gith_004"; // Gith, Psion
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 4:sChoice = "ar_gith_007"; // Gith, Shaman
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 5:sChoice = "ar_gith_005"; // Gith, Raider
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 6:sChoice = "ar_gith_006"; // Gith, Scout
        fCR = 14.0;
        iMinNum = 1;
        iMaxNum = 2;
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
