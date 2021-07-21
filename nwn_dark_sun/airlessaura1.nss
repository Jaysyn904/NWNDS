#include "NW_I0_SPELLS"
#include "inc_suffocate"

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    object oTarget = GetEnteringObject();

    if(GetIsEnemy(oTarget, oCaster))
    {
        Suffocate(oTarget);
    }
}
