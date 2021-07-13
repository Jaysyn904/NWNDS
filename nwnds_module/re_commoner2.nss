////////////////////////////////////////////////////
/*
Custom Random Commoner Table for use with the BESIE
Random Encounter Package by Ray Miller

Kled Commoners & guards.

*/
////////////////////////////////////////////////////

void main()
{
int iVarNum = GetLocalInt(OBJECT_SELF, "re_iVarNum");
int END;
int iWeight;
int iCounter1;
int iCounter2;
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

//  case 0:sChoice = "RESREF";  // Creature resref goes between the " marks.
//  iWeight = 10;               // This is the number of times this mob should be considered for the likelyhood of appearing.
//  break;

        case 0:sChoice = "npc_commoner003";        // Commoner - Dwarf Female 01
        iWeight = 8;
        break;

        case 1:sChoice = "npc_commoner004";        // Commoner - Dwarf Male 01
        iWeight = 10;
        break;

        case 2:sChoice = "npc_kledguard"; // Kled Guard
        iWeight = 2;
        break;

        case 3:sChoice = "npc_commoner003";        // Commoner - Dwarf Female 01
        iWeight = 8;
        break;

        case 4:sChoice = "npc_commoner004";        // Commoner - Dwarf Male 01
        iWeight = 10;
        break;

        case 5:sChoice = "npc_kledguard"; // Kled Guard
        iWeight = 2;
        break;

        case 6:sChoice = "npc_commoner003";        // Commoner - Dwarf Female 01
        iWeight = 8;
        break;

        case 7:sChoice = "npc_commoner004";        // Commoner - Dwarf Male 01
        iWeight = 10;
        break;

        case 8:sChoice = "npc_kledguard"; // Kled Guard
        iWeight = 2;
        break;

        case 9:sChoice = "npc_commoner003";        // Commoner - Dwarf Female 01
        iWeight = 8;
        break;

        case 10:sChoice = "npc_commoner004";        // Commoner - Dwarf Male 01
        iWeight = 10;
        break;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM ENCOUNTER TABLE!  DO NOT EDIT BELOW THIS LINE//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        default:END = TRUE;
        break;
        }
    if(GetStringLowerCase(sChoice) != "")
        {
        for(iCounter2 = 1; iCounter2 <= iWeight; iCounter2++)
            {
            SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
            iVarNum++;
            }
        }
    iCounter1++;
    }
SetLocalInt(OBJECT_SELF, "re_iVarNum", iVarNum);
}
