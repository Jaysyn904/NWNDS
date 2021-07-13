////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 22 - Spiders!

Areas Used in:
UnderTyr - The Web


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
        case 0:sChoice = "monst_spider004"; // Monstrous Spider, Large [AR]
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
        break;

        case 1:sChoice = "monst_spider003"; // Monstrous Spider, Medium [AR]
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 16;
        break;

        case 2:sChoice = "monst_spider002"; // Monstrous Spider, Small [AR]
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 11;
        iWeight = 16;
        break;

        case 3:sChoice = "monst_spider001"; // Monstrous Spider, Tiny [AR]
        fCR = 0.33;
        iMinNum = 8;
        iMaxNum = 16;
        iWeight = 16;
        break;

        case 4:sChoice = "ar_aranea001"; // Aranea
        fCR = 4.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 5:sChoice = "ar_ettercap001"; // Ettercap [AR]
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 6:sChoice = "gntwolfspider001"; // Wolf Spider, Giant
        fCR = 5.0;
        iMinNum = 2;
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
