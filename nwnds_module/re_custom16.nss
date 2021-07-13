////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 16 - The Ringing Mountains

Areas Used in:
The Ringing Mountains


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
        iMinNum = 2;
        iMaxNum = 10;
        iWeight = 4;
        break;

        case 1:sChoice = "ar_gith_002"; // Gith, Warrior
        fCR = 6.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 2;
        break;

        case 2:sChoice = "ar_gith_003"; // Gith, Archer
        fCR = 6.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 2;
        break;

        case 3:sChoice = "ar_gith_005"; // Gith, Raider
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 4:sChoice = "ar_gith_006"; // Gith, Scout
        fCR = 14.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 5:sChoice = "ar_eagle001"; // Eagle
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 6:sChoice = "ds_strine001"; // Strine
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 8;
        break;

        case 7:sChoice = "blkmastyrial_001"; // Mastyrial, Black
        fCR = 7.0;
        iMinNum = 5;
        iMaxNum = 20;
        iWeight = 8;
        break;

        case 8:sChoice = "ar_sout_001"; // So-Ut (Rampager)
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 9:sChoice = "tarek_001"; // Tarek
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;

        case 10:sChoice = "ar_mepair001"; // Mephit, Air
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 12;
        iWeight = 4;
        break;

        case 11:sChoice = "xerichou002"; // Xerichou, Greater
        fCR = 10.0;
        iMinNum = 2;
        iMaxNum = 9;
        iWeight = 4;
        break;

        case 12:sChoice = "drake_earth001"; // Drake, Earth
        fCR = 19.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 13:sChoice = "elem_air_sm001"; // [AR] Air Elemental, Small
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 14:sChoice = "elem_air_md001"; // [AR] Air Elemental, Medium
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 15:sChoice = "elem_air_lg001"; // [AR] Air Elemental, Large
        fCR = 13.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 16:sChoice = "elem_air_hg001"; // [AR] Air Elemental, Huge
        fCR = 25.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 17:sChoice = "ar_bloodhawk_001"; // Bloodhawk
        fCR = 1.0;
        iMinNum = 6;
        iMaxNum = 11;
        iWeight = 8;
        break;

        case 18:sChoice = "ar_brdrinker_001"; // Breathdrinker
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 19:sChoice = "ar_chimera001"; // Chimera [AR]
        fCR = 9.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 20:sChoice = "crystalspider002"; // Crystal Spider, Greater
        fCR = 22.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 21:sChoice = "ar_ettin001"; // Ettin [AR]
        fCR = 11.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 22:sChoice = "ar_braxat_001"; // Braxat
        fCR = 14.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 23:sChoice = "ar_braxat_002"; // Braxat Preserver
        fCR = 24.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 24:sChoice = "ar_braxat_002"; // Braxat Preserver
        fCR = 24.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 25:sChoice = "ar_hawk002"; // Hawk, Dire
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;

        case 26:sChoice = "ar_rocklizard001"; // Lizard, Rock-Horned
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 27:sChoice = "shardspider001"; // Shard Spider
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 28:sChoice = "takis001"; // Takis
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;

        case 29:sChoice = "tembo001"; // Tembo
        fCR = 6.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 8;
        break;

        case 30:sChoice = "tembo002"; // Tembo, Greater
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 31:sChoice = "tigone001"; // Tigone
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 2;
        break;

        case 32:sChoice = "windwalker001"; // Wind Walker
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 33:sChoice = "windwalker001"; // Wind Walker
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 34:sChoice = "ds_ztal001"; // Z'tal
        fCR = 2.0;
        iMinNum = 4;
        iMaxNum = 10;
        iWeight = 16;
        break;

        case 35:sChoice = "ar_zhackal_001"; // Zhackal
        fCR = 4.0;
        iMinNum = 2;
        iMaxNum = 6;
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
