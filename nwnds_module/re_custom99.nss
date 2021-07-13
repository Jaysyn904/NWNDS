////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 99 - Arena - All
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
        case 0:sChoice = "nightmarebeast"; // Nightmare  Beast
        fCR = 32.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 1:sChoice = "intdevourer001"; // Intellect Devourer
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 2:sChoice = "ar_brdrinker001"; // Breathdrinker
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 3:sChoice = "grueharginn001"; // Grue, Harginn
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 4:sChoice = "grueildriss001"; // Grue, Ildriss
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 5:sChoice = "ar_aerservant001"; // Aerial Servant
        fCR = 18.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 6:sChoice = "ar_aerservant002"; // Aerial Servant, Large
        fCR = 37.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 7:sChoice = "ar_algoid001"; // Algoid, Large
        fCR = 7.0;
        iMinNum = 3;
        iMaxNum = 6;
        iWeight = 4;
        break;

        case 8:sChoice = "ar_amphis001"; // Amphisibaena
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 9:sChoice = "puddingbrown001"; // Pudding, Brown
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 10:sChoice = "puddingdun001"; // Pudding, Dun
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 11:sChoice = "jellymustard001"; // Jelly, Mustard
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 12:sChoice = "slimeolive001"; // Olive Slime
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 13:sChoice = "slithertrack001"; // Slithering Tracker
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 14:sChoice = "sluggiant001"; // Giant Slug
        fCR = 11.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 16;
        break;

        case 15:sChoice = "ar_gianttick001"; // Tick, Giant
        fCR = 2.0;
        iMinNum = 3;
        iMaxNum = 12;
        iWeight = 4;
        break;

        case 16:sChoice = "vilstrak001"; // Vilstrak
        fCR = 2.0;
        iMinNum = 2;
        iMaxNum = 20;
        iWeight = 4;
        break;

        case 17:sChoice = "windwalker001"; // Windwalker
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 2;
        break;

        case 18:sChoice = "ar_flamsnake_001"; // Flame Snake,  Minor
        fCR = 0.5;
        iMinNum = 4;
        iMaxNum = 12;
        iWeight = 8;
        break;

        case 19:sChoice = "ar_flamsnake_002"; // Flame Snake,  Lesser
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 9;
        iWeight = 4;
        break;

        case 20:sChoice = "ar_flamsnake_003"; // Flame Snake,  Greater
        fCR = 20.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;

        case 21:sChoice = "ar_shadowasp001"; // Shadow Asp
        fCR = 0.5;
        iMinNum = 3;
        iMaxNum = 12;
        iWeight = 2;
        break;

        case 22:sChoice = "drake_earth001"; // Drake, Earth
        fCR = 19.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 23:sChoice = "drake_fire001"; // Drake, Fire
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 24:sChoice = "drake_air001"; // Drake, Air
        fCR = 23.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 25:sChoice = "drake_water001"; // Drake, Water
        fCR = 16.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;

        case 26:sChoice = "direrat_001"; // Rat, Dire
        fCR = 0.3;
        iMinNum = 11;
        iMaxNum = 20;
        iWeight = 16;
        break;

        case 27:sChoice = "tarek_001"; // Tarek
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 12;
        iWeight = 8;
        break;

        case 28:sChoice = "magera_001"; // Magera
        fCR = 5.0;
        iMinNum = 2;
        iMaxNum = 8;
        iWeight = 8;
        break;

        case 29:sChoice = "magera_002"; // Magera Fighter
        fCR = 11.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 30:sChoice = "ar_pakubrazi_001"; // Pakubrazi
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 31:sChoice = "ds_idfiend001"; // Id Fiend
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 32:sChoice = "athasianbear001"; // Bear, Athasian
        fCR = 19.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 33:sChoice = "bulette";  //Bulette
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 34:sChoice = "ar_lask002";  //Lask, Barbarian
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 35:sChoice = "ar_lask003";  //Lask, Epic Cleric
        fCR = 27.0;
        iMinNum = 1;
        iMaxNum = 1;
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
