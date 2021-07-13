////////////////////////////////////////////////////
/*
Custom treasure table template for use with the
BESIE Random Encounter Package by Ray Miller

Table 99 - Quest items

*/
////////////////////////////////////////////////////
void main()
{
object oCreature = OBJECT_SELF;
float fRunningChance;
float Chance = 0.0;
int iCounter = 1;
int Class;
int END;
while(!END)
    {
    switch(iCounter)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 100.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
//case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 100.0;   break;
//case 4:Class  = CLASS_TYPE_BARD;          Chance = 100.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
//case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 100.0;   break;
//case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 100.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
//case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 100.0;   break;
//case 10:Class = CLASS_TYPE_DRUID;         Chance = 100.0;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 100.0;   break;
//case 12:Class = CLASS_TYPE_FEY;           Chance = 100.0;   break;
//case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 100.0;   break;
//case 14:Class = CLASS_TYPE_GIANT;         Chance = 100.0;   break;
//case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 100.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
//case 17:Class = CLASS_TYPE_MONK;          Chance = 100.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 100.0;   break;
//case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 100.0;   break;
//case 20:Class = CLASS_TYPE_PALADIN;       Chance = 100.0;   break;
//case 21:Class = CLASS_TYPE_RANGER;        Chance = 100.0;   break;
//case 22:Class = CLASS_TYPE_ROGUE;         Chance = 100.0;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 100.0;   break;
//case 24:Class = CLASS_TYPE_SORCERER;      Chance = 100.0;   break;
//case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 100.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
//case 27:Class = CLASS_TYPE_WIZARD;        Chance = 100.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default:break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    float fChance;
    float fMinCR;
    float fMaxCR;
    int END = FALSE;
    int iCounter1;
    int iCounter2;
    int iMaxNum;
    int iMinNum;
    string sIfIs;
    string sChoice;
    while(!END)
        {
        sChoice = "";
        switch(iCounter1)
            {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM TREASURE TABLE BELOW:////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            case 0:sChoice = "ar_key_spyre"; // Treasure resref goes between the " marks.
            sIfIs = "AR_DEFILER_002";        // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
            fMinCR = 0.0;                    // Only give this treasure to a creature whose challenge rating is between these two values.
            fMaxCR = 0.0;                    // Leave them at 0.0 if you wish them not to be considered.
            fChance = 50.0;                  // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
            iMinNum = 1;                     //
            iMaxNum = 1;                     // The minimum and maximum numbers of this treasure item to randomly give.
            break;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM TREASURE TABLE!  DO NOT EDIT BELOW THIS LINE///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            default:END = TRUE;
            break;
            }
        if((sIfIs == "" || sIfIs == GetTag(oCreature))
        && (fMinCR == 0.0 || (fMinCR != 0.0 && GetChallengeRating(oCreature) >= fMinCR))
        && (fMaxCR == 0.0 || (fMaxCR != 0.0 && GetChallengeRating(oCreature) <= fMaxCR))
        && Random(10000) + 1 <= FloatToInt(fChance * 100.0))
            {
            CreateItemOnObject(sChoice, oCreature, Random((iMaxNum + 1) - iMinNum) + iMinNum);
            }
        iCounter1++;
        }
    }
}
