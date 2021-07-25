////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 8 - Underground / Hej-Kin Lairs CR 0 - CR 5

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
        case 0:sChoice = "vilstrak001"; // Vilstrak
        fCR = 2.0;
        iMinNum = 2;
        iMaxNum = 5;
        iWeight = 4;
        break;
        
        case 1:sChoice = "elem_earth_sm001"; // [AR] Earth Elemental, Small
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 2:sChoice = "antloid002"; // Antloid Worker
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 8;
        break;
        
        case 3:sChoice = "cr_hejkin001"; // Hej-Kin, Warrior
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 5;
        iWeight = 16;
        break;
        
        case 4:sChoice = "direrat_002"; // Rat, Dire - Greater
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 8;
        break;
        
        case 5:sChoice = "ar_mepearth001"; // Mephit, Earth
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 6:sChoice = "ar_mepsalt001"; // Mephit, Salt
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 7:sChoice = "ar_mepooze001"; // Mephit, Ooze
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 8:sChoice = "elem_earth_md001"; // [AR] Earth  Elemental, Medium
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 9:sChoice = "ar_rat001"; // Rat, Common
        fCR = 0.16;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 16;
        break;
        
        case 10:sChoice = "ds_ratdire001"; // Rat, Dire
        fCR = 1.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 8;
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
