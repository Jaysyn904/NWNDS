#include "NW_I0_SPELLS"
//#include "x2_inc_spellhook"

void main()
{
    //Declare major variables
    //Get the object that is exiting the AOE
    object oTarget = GetExitingObject();
    effect eAOE;
    int nEffectType;

    int bValid = FALSE;
    //Search through the valid effects on the target.
    eAOE = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eAOE) && bValid == FALSE)
    {
        if (GetEffectCreator(eAOE) == GetAreaOfEffectCreator(OBJECT_SELF))
        {
            nEffectType = GetEffectType(eAOE);
                if(GetEffectSpellId(eAOE) == -1)
                {
                    RemoveEffect(oTarget, eAOE);
                    bValid = TRUE;
                }

        }
        //Get next effect on the target
        eAOE = GetNextEffect(oTarget);
    }
}
