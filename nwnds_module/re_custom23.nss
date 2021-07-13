////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 23 - Vermin CR 0 - CR 5

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
        case 0:sChoice = "crp_twigblight"; // Twig Blight
        fCR = 0.5;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 2;
        break;

        case 1:sChoice = "direrat_001"; // Rat, Dire
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 16;
        break;

        case 2:sChoice = "wrab001"; // Wrab
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 3:sChoice = "ar_gianttick001"; // Tick, Giant
        fCR = 2.0;
        iMinNum = 3;
        iMaxNum = 6;
        iWeight = 8;
        break;
        
        case 4:sChoice = "zep_oliveslimes"; // Olive Slime
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;
        
        case 5:sChoice = "direrat_002"; // Rat, Dire - Greater
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 8;
        break;
        
        case 6:sChoice = "monst_spider003"; // Monstrous Spider, Medium [AR]
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 16;
        break;
        
        case 7:sChoice = "monst_spider002"; // Monstrous Spider, Small [AR]
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 11;
        iWeight = 16;
        break;                

        case 8:sChoice = "monst_spider001"; // Monstrous Spider, Tiny [AR]
        fCR = 0.33;
        iMinNum = 8;
        iMaxNum = 16;
        iWeight = 16;
        break;
        
        case 9:sChoice = "ar_bladehood001"; // Blade Hood
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;        
       
        case 10:sChoice = "ar_rat001"; // Rat, Common
        fCR = 0.16;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 16;
        break;
        
        case 11:sChoice = "gold_scorp001"; // Gold Scorpion
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
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
