////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 27 - The Spyre

Areas Used in:
The Spyre Tower

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

        case 0:sChoice = "ar_defiler_001"; // Defiler, Apprentice
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 1:sChoice = "ar_defiler_002"; // Defiler, Journeyman
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 2:sChoice = "ar_salamander002"; // Salamander, Flamebrother
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 3:sChoice = "ar_skyrossent001"; // Marble Sentinel, Skyros
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 4:sChoice = "elem_earth_sm001"; // [AR] Earth Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 5:sChoice = "elem_fire_sm001"; // [AR] Fire Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 6:sChoice = "elem_silt_sm001"; // [AR] Silt Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 7:sChoice = "grueharginn001"; // Grue, Harginn
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 8:sChoice = "grueildriss001"; // Grue, Ildriss
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
