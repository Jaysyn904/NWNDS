////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 9 - Underground / Sewers CR 6 - CR 10

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
        case 0:sChoice = "ar_dagslime_001"; // Dagolar Slime
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 1:sChoice = "ar_otyugh_001"; // Otyugh
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;

        case 2:sChoice = "hejkin001"; // Hej-Kin, Preserver
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 3:sChoice = "antloid004"; // Antloid Dynamis
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 10;
        iWeight = 4;
        break;

        case 4:sChoice = "ar_tyrslime_001"; // Tyrian Slime
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 5:sChoice = "shadowmastiff001"; // Shadow  Mastiff
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 6:sChoice = "zombie003"; // Zombie, Human
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;

        case 7:sChoice = "ar_algoid001"; // Algoid, Large
        fCR = 7.0;
        iMinNum = 3;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 8:sChoice = "antloid003"; // Antloid Soldier
        fCR = 2.0;
        iMinNum = 7;
        iMaxNum = 10;
        iWeight = 8;
        break;

        case 9:sChoice = "puddingdun001"; // Pudding, Dun
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 10:sChoice = "ar_bladehood002"; // Blade Hood, Greater
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 11:sChoice = "ar_tyrslime_002"; // Tyrian Slime, Large
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
        break;

        case 12:sChoice = "ar_brdrinker_001"; // Breathdrinker
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 13:sChoice = "dagslime_002"; // Dagolar Slime, Large
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 4;
        break;

        case 14:sChoice = "ghast002"; // Ghast, Greater
        fCR = 10.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 2;
        break;

        case 15:sChoice = "xerichou002"; // Xerichou, Greater
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
        break;

        case 16:sChoice = "xerichou001"; // Xerichou
        fCR = 5.0;
        iMinNum = 2;
        iMaxNum = 8;
        iWeight = 8;
        break;

        case 17:sChoice = "ar_defiler_001"; // Defiler, Apprentice
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 2;
        break;

        case 18:sChoice = "warrensthug001"; // Thug, Human - Shortsword
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 16;
        break;

        case 19:sChoice = "direrat_003"; // Rat, Dire - Elder
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 10;
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
