////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 5 - Tyr Fields
          (CR 3) area

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
        case 0:sChoice = "humanbandit_001"; // Bandit, Human - Short Sword
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 16;
        break;

        case 1:sChoice = "humanbandit_002"; // Bandit, Human - Psionic
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 8;
        break;

        case 2:sChoice = "halfbandit_001"; // Bandit, Halfling - Daggers
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 8;
        break;

        case 3:sChoice = "slig002"; // Slig, Common
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 4:sChoice = "gold_scorp001"; // Gold Scorpion
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 5:sChoice = "monst_scorp001"; // Monstrous Scorpion, Tiny
        fCR = 0.25;
        iMinNum = 2;
        iMaxNum = 8;
        iWeight = 16;
        break;        

        case 6:sChoice = "monst_spider001"; // Monstrous Spider, Tiny
        fCR = 0.25;
        iMinNum = 2;
        iMaxNum = 8;
        iWeight = 16;
        break;  
        
        case 7:sChoice = "desertviper_001"; // Desert Viper, Small
        fCR = 0.5;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 16;
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
