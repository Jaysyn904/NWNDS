////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 17 - The Ringing Mountains - River Cave

Areas Used in:
The Ringing Mountains - River Cave


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
        case 0:sChoice = "elem_water_sm001"; // [AR] Water Elemental, Small
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 1:sChoice = "elem_water_md001"; // [AR] Water Elemental, Medium
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 2:sChoice = "elem_water_lg001"; // [AR] Water Elemental, Large
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 3:sChoice = "elem_water_hg001"; // [AR] Water Elemental, Huge
        fCR = 17.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 4:sChoice = "elem_water_gr001"; // [AR] Water Elemental, Greater
        fCR = 22.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 5:sChoice = "elem_water_el001"; // [AR] Water Elemental, Elder
        fCR = 24.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break; 

        case 6:sChoice = "drake_water001"; // Drake, Water
        fCR = 16.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;
        
        case 7:sChoice = "ar_mepwater001"; // Mephit, Water
        fCR = 4.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 8:sChoice = "slimeolive001"; // Olive Slime
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;         

        case 9:sChoice = "ar_anglerooze001"; // Ooze, Angler
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;                 
        
        case 10:sChoice = "oozecrystal_001"; // Ooze, Crystal
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 11:sChoice = "ar_algoid001"; // Algoid, Large
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 3;
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
