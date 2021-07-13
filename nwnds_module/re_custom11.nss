////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 11 - Fire Subtype Creatures 

Areas Used in:
Pit of Fire


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
        case 0:sChoice = "elem_fire_el001"; // [AR] Fire Elemental, Elder
        fCR = 37.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 1:sChoice = "elem_fire_gr001"; // [AR] Fire Elemental, Greater
        fCR = 32.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 2:sChoice = "elem_fire_hg001"; // [AR] Fire Elemental, Huge
        fCR = 25.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 3:sChoice = "elem_fire_lg001"; // [AR] Fire Elemental, Large
        fCR = 10.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 4:sChoice = "elem_fire_md001"; // [AR] Fire Elemental, Medium
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 5:sChoice = "elem_fire_sm001"; // [AR] Fire Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 6:sChoice = "golemmagma001"; // Golem: Magma
        fCR = 16.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break; 
        
        case 7:sChoice = "golemmagma002"; // Golem: Magma, Greater
        fCR = 27.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break; 

        case 8:sChoice = "ar_firebat_001"; // Firebat
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 9:sChoice = "ar_magmin001"; // Magmin
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 10:sChoice = "ar_magmin002"; // Magmin, Greater
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 11:sChoice = "ar_flamsnake002"; // Flame Snake, Lesser
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 12:sChoice = "ar_flamsnake003"; // Flame Snake, Minor
        fCR = 0.5;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 13:sChoice = "ar_hellhound001"; // Hell Hound [AR]
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 14:sChoice = "ar_mepfire001"; // Mephit, Fire
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 15:sChoice = "ar_mepmagma001"; // Mephit, Magma
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;        

        case 16:sChoice = "grueharginn001"; // Grue, Harginn
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
