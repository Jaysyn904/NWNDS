////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 13 - Hamanu's Half-giants / Grotto of Dreams

Areas Used in:
Grotto of Dreams


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
        case 0:sChoice = "halfgiant002"; // Half-Giant - Soldier
        fCR = 43.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 8;
        break;

        case 1:sChoice = "halfgiant004"; // Half-Giant - Veteran
        fCR = 40.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 2:sChoice = "halfgiant003"; // Half-Giant - Hurler
        fCR = 43.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 4;
        break;

        case 3:sChoice = "halfgiant001"; // Half-Giant - Stalker
        fCR = 41.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 4:sChoice = "halfgiant006"; // Half-Giant - Cleric
        fCR = 47.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 5:sChoice = "halfgiant005"; // Half-Giant - Shamaness
        fCR = 40.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 6:sChoice = "elem_rain_el001"; // Rain Paraelemental, Elder
        fCR = 36.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 7:sChoice = "elem_rain_gr001"; // Rain Paraelemental, Greater
        fCR = 32.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 8:sChoice = "elem_rain_hg001"; // Rain Paraelemental, Huge
        fCR = 17.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 9:sChoice = "drake_water001"; // Drake, Water
        fCR = 16.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 10:sChoice = "athasianbear001"; // Bear, Athasian
        fCR = 19.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 11:sChoice = "ar_aviarag_003"; // Aviarag, Elder
        fCR = 24.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 12:sChoice = "ar_aerservant001"; // Aerial Servant
        fCR = 18.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 13:sChoice = "ar_aerservant001"; // Aerial Servant, Large
        fCR = 37.0;
        iMinNum = 1;
        iMaxNum = 1;
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
