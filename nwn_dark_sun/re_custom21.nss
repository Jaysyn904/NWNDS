////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller

Athas Reborn
Table 21 - The Forest Ridge

Areas Used in:
The Forest Ridge


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
        case 0:sChoice = "halfhunter001"; // Feral Halfling Hunter
        fCR = 20.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 4;
        break;

        case 1:sChoice = "halfranger001"; // Feral Halfling Ranger
        fCR = 15.0;
        iMinNum = 2;
        iMaxNum = 4;
        iWeight = 8;
        break;
        
        case 2:sChoice = "half_rg_druid001"; // Feral Halfling Rouge / Druid
        fCR = 18.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;                

        case 3:sChoice = "ar_ape001"; // Ape, Dire
        fCR = 5.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break; 
        
        case 4:sChoice = "ar_aranea001"; // Aranea
        fCR = 4.0;
        iMinNum = 2;
        iMaxNum = 6;
        iWeight = 4;
        break; 
        
        case 5:sChoice = "assassinvine001"; // Assassin Vine - Horizontal
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;           
        
        case 6:sChoice = "assassinvine002"; // Assassin Vine - Vertical
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break;    
        
        case 7:sChoice = "ar_bear001"; // Bear, Black
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 16;
        break;         
        
        case 8:sChoice = "ar_ettercap001"; // Ettercap [AR]
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break; 
        
        case 9:sChoice = "ar_hawk002"; // Hawk, Dire
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;         
        
        case 10:sChoice = "ar_krenshar001"; // Krenshar [AR]
        fCR = 3.0;
        iMinNum = 2;
        iMaxNum = 10;
        iWeight = 4;
        break;         
                        
        case 11:sChoice = "ar_leopard001"; // Leopard
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break; 
        
        case 12:sChoice = "monst_spider001"; // Monstrous Spider, Tiny [AR]
        fCR = 0.33;
        iMinNum = 8;
        iMaxNum = 16;
        iWeight = 16;
        break;
        
        case 13:sChoice = "monst_spider002"; // Monstrous Spider, Small [AR]
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 11;
        iWeight = 16;
        break;

        case 14:sChoice = "monst_spider003"; // Monstrous Spider, Medium [AR]
        fCR = 3.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 16;
        break;           
           
        case 15:sChoice = "monst_spider004"; // Monstrous Spider, Large [AR]
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;           
                   
        case 16:sChoice = "ar_owlbear_001"; // Owlbear
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 8;
        iWeight = 4;
        break; 
        
        case 17:sChoice = "ar_pseudodrag001"; // Psuedodragon
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 2;
        break; 
        
        case 18:sChoice = "ar_tiger002"; // Tiger
        fCR = 6.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 8;
        break;

        case 19:sChoice = "ar_tiger001"; // Tiger, Dire
        fCR = 15.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 20:sChoice = "ar_tiger003"; // Tiger, Legendary
        fCR = 27.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;    
        
        case 21:sChoice = "ar_tiger003"; // Tiger, Legendary
        fCR = 27.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break; 

        case 22:sChoice = "ar_raven001"; // Raven
        fCR = 0.16;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 16;
        break;
        
        case 23:sChoice = "puddingdun001"; // Pudding, Dun
        fCR = 7.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;        
        
        case 24:sChoice = "shardspider001"; // Shard Spider
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
        
        case 25:sChoice = "ds_aprig001"; // Aprig
        fCR = 0.5;
        iMinNum = 2;
        iMaxNum = 20;
        iWeight = 16;
        break;
        
        case 26:sChoice = "ar_axebeak001"; // Axebeak
        fCR = 4.0;
        iMinNum = 1;
        iMaxNum = 6;
        iWeight = 4;
        break;                
        
        case 27:sChoice = "ar_hawk001"; // Hawk
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;
        
        case 28:sChoice = "ds_idfiend001"; // Id Fiend
        fCR = 9.0;
        iMinNum = 1;
        iMaxNum = 1;
        iWeight = 4;
        break;
                
        case 29:sChoice = "kirre001"; // Kirre
        fCR = 8.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;                

        case 30:sChoice = "kirre002"; // Kirre, Greater
        fCR = 14.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 4;
        break;
        
        case 31:sChoice = "kirre003"; // Kirre, Legendary
        fCR = 25.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 2;
        break;
        
        case 32:sChoice = "kivit001"; // Kivit
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;
        
        case 33:sChoice = "sitak"; // Sitak
        fCR = 1.0;
        iMinNum = 1;
        iMaxNum = 12;
        iWeight = 4;
        break;        
        
        case 34:sChoice = "ds_athsloth001"; // Sloth, Athasian
        fCR = 11.0;
        iMinNum = 1;
        iMaxNum = 4;
        iWeight = 4;
        break; 
        
        case 35:sChoice = "takis001"; // Takis
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 2;
        iWeight = 8;
        break;                

        case 36:sChoice = "tigone001"; // Tigone
        fCR = 5.0;
        iMinNum = 1;
        iMaxNum = 5;
        iWeight = 8;
        break;
        
        case 37:sChoice = "ar_zhackal_001"; // Zhackal
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
