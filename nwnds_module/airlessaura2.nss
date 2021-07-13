#include "NW_I0_SPELLS"
#include "inc_suffocate"

void main()
{
    //Declare major variables
    object oCaster = GetAreaOfEffectCreator();
    object oTarget = GetFirstInPersistentObject();

    while(GetIsObjectValid(oTarget))
    {
        if(GetIsEnemy(oTarget, oCaster))
        {
            Suffocate(oTarget);
        }
    oTarget = GetNextInPersistentObject();
    }
}
