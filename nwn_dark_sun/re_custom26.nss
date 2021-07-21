////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 26 - Non-Water Elementals: All

Areas Used in:
Drake's Demise

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

        case 0:sChoice = "elem_air_sm001"; // [AR] Air Elemental, Small
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 1:sChoice = "elem_air_md001"; // [AR] Air Elemental, Medium
        fCR = 8.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 2:sChoice = "elem_air_lg001"; // [AR] Air Elemental, Large
        fCR = 16.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 3:sChoice = "elem_air_hg001"; // [AR] Air Elemental, Huge
        fCR = 30.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 4:sChoice = "elem_air_gr001"; // [AR] Air Elemental, Greater
        fCR = 40.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 5:sChoice = "elem_air_el001"; // [AR] Air Elemental, Elder
        fCR = 45.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 6:sChoice = "elem_air_pr001"; // [AR] Air Elemental, Primal
        fCR = 60.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 7:sChoice = "elem_earth_sm001"; // [AR] Earth Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 8:sChoice = "elem_earth_lg001"; // [AR] Earth Elemental, Medium
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 9:sChoice = "elem_air_lg001"; // [AR] Earth Elemental, Large
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 10:sChoice = "elem_earth_hg001"; // [AR] Earth Elemental, Huge
        fCR = 17.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 11:sChoice = "elem_earth_gr001"; // [AR] Earth Elemental, Greater
        fCR = 22.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 12:sChoice = "elem_earth_el001"; // [AR] Earth Elemental, Elder
        fCR = 25.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 13:sChoice = "elem_earth_pr001"; // [AR] Earth Elemental, Primal
        fCR = 53.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 14:sChoice = "elem_fire_sm001"; // [AR] Fire Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 15:sChoice = "elem_fire_md001"; // [AR] Fire Elemental, Medium
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 16:sChoice = "elem_fire_lg001"; // [AR] Fire Elemental, Large
        fCR = 11.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 17:sChoice = "elem_fire_hg001"; // [AR] Fire Elemental, Huge
        fCR = 30.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 18:sChoice = "elem_fire_gr001"; // [AR] Fire Elemental, Greater
        fCR = 40.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 19:sChoice = "elem_fire_el001"; // [AR] Fire Elemental, Elder
        fCR = 45.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 20:sChoice = "elem_fire_pr001"; // [AR] Fire Elemental, Primal
        fCR = 72.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;
		
        case 21:sChoice = "elem_magma_sm001"; // [AR] Magma Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 22:sChoice = "elem_magma_md001"; // [AR] Magma Elemental, Medium
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 23:sChoice = "elem_magma_lg001"; // [AR] Magma Elemental, Large
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 24:sChoice = "elem_magma_hg001"; // [AR] Magma Elemental, Huge
        fCR = 17.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 25:sChoice = "elem_magma_gr001"; // [AR] Magma Elemental, Greater
        fCR = 22.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 26:sChoice = "elem_magma_el001"; // [AR] Magma Elemental, Elder
        fCR = 24.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        /*case 27:sChoice = "elem_magma_pr001"; // [AR] Magma Elemental, Primal
        fCR = 24.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;		*/

        case 28:sChoice = "elem_silt_sm001"; // [AR] Silt Elemental, Small
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 29:sChoice = "elem_silt_md001"; // [AR] Silt Elemental, Medium
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 30:sChoice = "elem_silt_lg001"; // [AR] Silt Elemental, Large
        fCR = 8.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 31:sChoice = "elem_silt_hg001"; // [AR] Silt Elemental, Huge
        fCR = 15.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 32:sChoice = "elem_silt_gr001"; // [AR] Silt Elemental, Greater
        fCR = 19.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 33:sChoice = "elem_silt_el001"; // [AR] Silt Elemental, Elder
        fCR = 21.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;
		
        case 34:sChoice = "elem_sun_sm001"; // [AR] Sun Elemental, Small
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 35:sChoice = "elem_sun_md001"; // [AR] Sun Elemental, Medium
        fCR = 8.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 16;
        break;

        case 36:sChoice = "elem_sun_lg001"; // [AR] Sun Elemental, Large
        fCR = 15.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 37:sChoice = "elem_sun_hg001"; // [AR] Sun Elemental, Huge
        fCR = 30.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;
		
		case 38:sChoice = "elem_sun_gr001"; // [AR] Sun Elemental, Greater
        fCR = 39.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 39:sChoice = "elem_sun_el001"; // [AR] Sun Elemental, Elder
        fCR = 44.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;		

        case 40:sChoice = "ar_belker001"; // Belker [AR]
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;			

        case 41:sChoice = "ar_brdrinker_001"; // Breathdrinker
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;	

        case 42:sChoice = "crystalspider001"; // Crystal Spider
        fCR = 11.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;	

        case 43:sChoice = "crystalspider002"; // Crystal Spider, Greater
        fCR = 18.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;	

        case 44:sChoice = "grueharginn001"; // Grue, Harginn
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;	
		
        case 45:sChoice = "grueildriss001"; // Grue, Ildriss
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;	

        case 46:sChoice = "windwalker001"; // Wind Walker
		fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;	
		
        case 47:sChoice = "ar_aerservant001"; // Aerial Servant
        fCR = 18.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;	

        case 48:sChoice = "ar_aerservant002"; // Aerial Servant, Large
		fCR = 37.0;
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
