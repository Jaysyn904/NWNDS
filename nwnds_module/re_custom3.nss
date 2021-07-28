////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Table 3 - Desert Wilderness 5-10th lvl

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
        case 0:sChoice = "tarek_001"; // Tarek
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 1:sChoice = "ar_amphis001"; // Amphisbaena
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 2:sChoice = "ar_flamsnake_001"; // Flame Snake, Minor
        fCR = 0.5;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 3:sChoice = "ar_owlbear_001"; // Owlbear
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 4:sChoice = "ar_axebeak001"; // Axe Beak
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 5:sChoice = "ar_wolfspider001"; // Wolf-Spider
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 6:sChoice = "ds_ztal001";    //  Z'tal
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 7:sChoice = "magera_001";  //Magera
        fCR = 6.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 8:sChoice = "slig002";  //Slig, Common
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 9:sChoice = "anakore1";  //Anakore
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 10:sChoice = "belgoi001";  //Belgoi
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 11:sChoice = "bulette";  //Bulette
        fCR = 10.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 12:sChoice = "ds_kestrekel001";  //Kes'trekel, Small
        fCR = 2.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 13:sChoice = "ar_defiler_001";  //Defiler, Apprentice
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 14:sChoice = "tagster001";  //Tagster
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 15:sChoice = "ds_siltspider001";  //Silt Spider
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 16:sChoice = "monst_spider004";  //Monstrous Spider, Large
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 17:sChoice = "monst_spider001";  //Monstrous Spider, Tiny
        fCR = 0.5;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 18:sChoice = "ar_daggoran_001";  //Daggoran
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 19:sChoice = "ar_c_jathlagak";  //Jalath'gak
        fCR = 9.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 20:sChoice = "ankheg001";  //Ankheg
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 21:sChoice = "ds_dunecrab001";  //Dunecrab
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 22:sChoice = "ds_dunecrab002";  //Dunecrab, Greater
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 23:sChoice = "ar_mandragora001";  //Mandragora
        fCR = 3.5;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 24:sChoice = "ar_ssurran_001";  //Ssurran, Common
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 25:sChoice = "ar_ssurran_002";  //Ssurran, Raider
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 26:sChoice = "ar_bladehood001";  //Blade Hood
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 27:sChoice = "ar_lion001";  //Lion, Female
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 28:sChoice = "ar_lion002";  //Lion, Male
        fCR = 5.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 29:sChoice = "sandhowler001";  //Sand Howler
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 30:sChoice = "dunestalker_001";  //Dune Stalker
        fCR = 7.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 1;
        break;

        case 31:sChoice = "ds_g_lizard001";  //Lizard, Giant
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 32:sChoice = "monst_scorp002";  //Monstrous Scorpion, Small
        fCR = 1.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 4;
        break;

        case 33:sChoice = "ar_rocklizard001";  //Lizard, Rock-Horned
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 2;
        break;

        case 34:sChoice = "ar_bloodhawk_001";  //Bloodhawk
        fCR = 3.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 35:sChoice = "desertviper_001";  //Desert Viper, Small
        fCR = 4.0;
        iMinNum = 0;
        iMaxNum = 0;
        iWeight = 3;
        break;

        case 36:sChoice = "monst_scorp003";  //Monstrous Scorpion, Medium
        fCR = 2.0;
        iMinNum = 0;
        iMaxNum = 0;
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
