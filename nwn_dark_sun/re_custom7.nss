////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 7 - Underground / Sewers CR 0 - CR 5

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

        case 1:sChoice = "ar_shadowasp001"; // Shadow Asp
        fCR = 0.5;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 2;
        break;

        case 2:sChoice = "ds_ratdire001"; // Rat, Dire
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 16;
        break;

        case 3:sChoice = "skeletonhuman001"; // Skeleton, Human
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;

        case 4:sChoice = "skeletondwarf001"; // Skeleton, Dwarf
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;
        
        case 5:sChoice = "wrab001"; // Wrab
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 6:sChoice = "ar_gianttick001"; // Tick, Giant
        fCR = 2.0;
        iMinNum = 3;
        iMaxNum = 6;
        iWeight = 8;
        break;
        
        case 7:sChoice = "vilstrak001"; // Vilstrak
        fCR = 2.0;
        iMinNum = 2;
        iMaxNum = 5;
        iWeight = 4;
        break;
        
        case 8:sChoice = "skeletonhgiant"; // Skeleton, Half-Giant
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 9:sChoice = "ar_ethfilcher001"; // Ethereal Filcher
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;
        
        case 10:sChoice = "slimeolive001"; // Olive Slime
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 2;
        break;
        
        case 11:sChoice = "ar_shadowrat001"; // Shadow Rat, Common
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
        break;
        
        case 12:sChoice = "elem_earth_sm001"; // [AR] Earth Elemental, Small
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 13:sChoice = "antloid002"; // Antloid Worker
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 3;
        iWeight = 8;
        break;
        
        case 14:sChoice = "cr_hejkin001"; // Hej-Kin, Warrior
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 5;
        iWeight = 4;
        break;
        
        case 15:sChoice = "ar_anglerooze001"; // Ooze, Angler
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;
        
        case 16:sChoice = "ar_shadowrat002"; // Shadow Rat, Dire
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 2;
        break;
        
        case 17:sChoice = "direrat_002"; // Rat, Dire - Greater
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 8;
        break;
        
        case 18:sChoice = "shadow003"; // Shadow, Lesser
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;
        
        case 19:sChoice = "ar_mepearth001"; // Mephit, Earth
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 20:sChoice = "shadow001"; // Shadow
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 4;
        break;
        
        case 21:sChoice = "slithertrack001"; // Slithering Tracker
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;
        
        case 22:sChoice = "ar_mepsalt001"; // Mephit, Salt
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 23:sChoice = "ar_amphis001"; // Amphisibaena
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;
        
        case 24:sChoice = "ar_mepooze001"; // Mephit, Ooze
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;
        
        case 25:sChoice = "stunjelly001"; // Stunjelly
        fCR = 2.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 26:sChoice = "tchowb_001"; // T'Chowb
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 27:sChoice = "jellymustard001"; // Jelly, Mustard
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;
        
        case 28:sChoice = "magera_001"; // Magera, Common
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;
        
        case 29:sChoice = "ar_pakubrazi_001"; // Pakubrazi
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 30:sChoice = "ar_bladehood001"; // Blade Hood
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 31:sChoice = "elem_earth_md001"; // [AR] Earth  Elemental, Medium
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 32:sChoice = "ar_rat001"; // Rat, Common
        fCR = 0.16;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 16;
        break;
        
        case 33:sChoice = "ghast001"; // Ghast
        fCR = 5.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 4;
        break;
        
        case 34:sChoice = "tarek_001"; // Tarek
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 8;
        break;
        
        case 35:sChoice = "ar_leechgiant"; // Leech, Giant
        fCR = 1.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 8;
        break;
        
        case 36:sChoice = "oozecrystal_001"; // Ooze, Crystal
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 2;
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
