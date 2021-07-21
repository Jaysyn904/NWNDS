////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 98 - Underground: All
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
        case 0:sChoice = "dunestalker_001"; // Dune  Stalker
        fCR = 7.0;
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

        case 6:sChoice = "crp_teigblight"; // Twig Blight
        fCR = 0.5;
        iMinNum = 1;
        iMaxNum = 10;
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

        case 12:sChoice = "zep_oliveslimes"; // Olive Slime
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

        case 18:sChoice = "necrophidius"; // Necrophidius
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 2;
        break;

        case 19:sChoice = "cr_hejkin001"; // Hej-Kin, Warrior
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 5;
        iWeight = 4;
        break;

        case 20:sChoice = "hejkin001"; // Hej-Kin, Preserver
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 4;
        break;

        case 21:sChoice = "ar_shadowasp001"; // Shadow Asp
        fCR = 0.5;
        iMinNum = 3;
        iMaxNum = 12;
        iWeight = 2;
        break;

        case 22:sChoice = "elem_earth_sm001"; // Earth Elemental, Small
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 23:sChoice = "elem_earth_md001"; // Earth Elemental, Medium
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 24:sChoice = "elem_earth_lg001"; // Earth Elemental, Large
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 25:sChoice = "elem_earth_hg001"; // Earth Elemental, Huge
        fCR = 17.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 26:sChoice = "ds_ratdire001"; // Rat, Dire
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

        case 32:sChoice = "elem_earth_gr001"; // Earth Elemental, Greater
        fCR = 22.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 33:sChoice = "elem_earth_el001"; // Earth Elemental, Elder
        fCR = 25.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 34:sChoice = "ar_bladehood001"; // Blade Hood
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 35:sChoice = "ar_bladehood002"; // Blade Hood, Greater
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 36:sChoice = "ar_anglerooze001"; // Ooze, Angler
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 37:sChoice = "ar_dagslime_001"; // Dagolar Slime
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 4;
        break;

        case 38:sChoice = "ar_dagslime_003"; // Dagolar Slime, Elder
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 39:sChoice = "ar_dagslime_002"; // Dagolar Slime, Large
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 40:sChoice = "ar_tyrslime_001"; // Tyrian Slime
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 4;
        break;

        case 41:sChoice = "ar_tyrslime_003"; // Tyrian Slime, Elder
        fCR = 11.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;

        case 42:sChoice = "ar_tyrslime_002"; // Tyrian Slime, Large
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;

        case 43:sChoice = "cloaker001"; // Cloaker
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 12;
        iWeight = 2;
        break;

        case 44:sChoice = "ar_otyugh_001"; // Otyugh
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;

        case 45:sChoice = "ar_umberhulk001"; // Umberhulk
        fCR = 10.0;
        iMinNum = 1;
        iMaxNum = 4;
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
