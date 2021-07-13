////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 1 - Western Dunes 10-15th lvl

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

        case 0:sChoice = "ar_gith_001"; // Creature ResRef goes between the " marks.
        fCR = 1.0;                      // Set this to the challenge rating of the creature as shown on the creature pallette.
        iMinNum = 0;                    //
        iMaxNum = 0;                    // If these are left at zero then an appropriate number of creatures will be spawned based on the CR.
        iWeight = 8;                    // This is the number of times this mob should be considered for the likelyhood of appearing.
        break;

        case 1:sChoice = "ar_gith_002"; //Gith Warrior
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 8;
        break;

        case 2:sChoice = "ar_gith_003"; //Gith Archer
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 3:sChoice = "ar_gith_004"; //Gith Psion
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 4:sChoice = "ar_gith_005"; //Gith Raider
        fCR = 15.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 5:sChoice = "ar_gith_006"; //Gith Scout
        fCR = 14.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 6:sChoice = "ar_gith_007"; //Gith Shaman
        fCR = 10.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 7:sChoice = "barbscorpion_001";    //Barbed Scorpion
        fCR = 10.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 8:sChoice = "beasthead001";   //Beasthead Giant - Ape
        fCR = 14.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 9:sChoice = "beasthead002";   //Beasthead Giant - Lion
        fCR = 17.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 10:sChoice = "beasthead003";  //Beasthead Giant - Bear
        fCR = 17.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 11:sChoice = "beasthead003";  //Beasthead Giant - Wolf
        fCR = 17.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 12:sChoice = "ds_gaj_001";  //Gaj
        fCR = 11.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 1;
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
