//#include "NW_I0_SPELLS"
//#include "x2_inc_spellhook"
#include "inc_suffocate"

void main()
{
    //Declare major variables
    //Get the object that is exiting the AOE
    object oTarget = GetExitingObject();

    GiveBreath(oTarget);
}
