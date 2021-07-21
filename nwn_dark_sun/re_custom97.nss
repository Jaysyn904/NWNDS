////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 97 - Undead - CR 10-30

Areas Used in:
Crimson Ruins - 1st Sublevel

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
//CUSTOM ENCOUNTER TABLE BELOW:///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*      case 0:sChoice = "tarek_001"; // Creature ResRef goes between the " marks.
        fCR = 6.0;                      // Set this to the challenge rating of the creature as shown on the creature pallette.
        iMinNum = 0;                    //
        iMaxNum = 0;                    // If these are left at zero then an appropriate number of creatures will be spawned based on the CR.
        iWeight = 4;                    // This is the number of times this mob should be considered for the likelyhood of appearing.
        break;
*/
        case 0:sChoice = "angelofdecay001"; // Angel of Decay
        fCR = 32.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 1:sChoice = "ashen001"; // Ashen
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 2:sChoice = "thinkzombie003"; // Thinking Zombie, Mul - Epic DwD
        fCR = 32.0;
        iMinNum = 2;
        iMaxNum = 3;
        iWeight = 2;
        break;

        case 3:sChoice = "blaspheme001"; // Blaspheme
        fCR = 20.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 4:sChoice = "slaughterwight01"; // Slaughter Wight
        fCR = 20.0;
        iMinNum = 1;
        iMaxNum = 10;
        iWeight = 2;
        break;

        case 5:sChoice = "dreamvestige001"; // Dream Vestige
        fCR = 23.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 6:sChoice = "tliz001"; // T'liz
        fCR = 37.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 7:sChoice = "ar_wraith002"; // Wraith, Dread
        fCR = 23.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 8:sChoice = "boneclaw001"; // Boneclaw
        fCR = 16.0;
        iMinNum = 1;
        iMaxNum = 11;
        iWeight = 4;
        break;

        case 9:sChoice = "wheep001"; // Wheep
        fCR = 12.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 2;
        break;

        case 10:sChoice = "shadow002"; // Shadow, Greater
        fCR = 13.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 11:sChoice = "ar_shadowasp001"; // Shadow Asp
        fCR = 0.5;
        iMinNum = 3;
        iMaxNum = 12;
        iWeight = 2;
        break;

        case 12:sChoice = "ashen002"; // Ashen, Evolved
        fCR = 24.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 13:sChoice = "hulkcorpse001"; // Hulking Corpse
        fCR = 17.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 14:sChoice = "ar_visage003"; // Visage, Evolved Greater
        fCR = 36.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 15:sChoice = "thinkzombie003"; // Visage, Evolved Greater
        fCR = 31.0;
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
